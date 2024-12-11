#include <kernel/tty.h>
#include <kernel/gdt.h>
#include <kernel/isr.h>
#include <kernel/page_allocator.h>
#include <kernel/interrupt_helpers.h>
#include <kernel/pcb.h>
#include <kernel/scheduler.h>
#include <kernel/kheap.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <kernel/port.h>
#include <kernel/pic.h>
#include <kernel/paging.h>

extern uint32_t _binary_bin_process_1_bin_start;
extern uint32_t _binary_bin_process_1_bin_size;

extern uint32_t _binary_bin_process_2_bin_start;
extern uint32_t _binary_bin_process_2_bin_size;

extern uint32_t _binary_bin_shell_bin_start;
extern uint32_t _binary_bin_shell_bin_size;

pcb_list_node_t *current;
int8_t last_pid = 0;
int active_processes = 0;

void scheduler_init() {
    // PID 0
    create_process((char*)&_binary_bin_shell_bin_start, (uint32_t)&_binary_bin_shell_bin_size, state_new);
    // PID 1
    create_process((char*)&_binary_bin_process_1_bin_start, (uint32_t)&_binary_bin_process_1_bin_size, blocked);
    // PID 2
    create_process((char*)&_binary_bin_process_2_bin_start, (uint32_t)&_binary_bin_process_2_bin_size, blocked);
    // // now we have created the processes, we can start the scheduler
    register_interrupt_handler(IRQ0, &schedule);
    // // now we start the first process and enter the user space
    enter_user_space(current);
}

void map_process_pages(pcb_list_node_t *process_node) {
    page_directory_t *kernel_directory = get_kernel_directory();
    page_directory_t *process_directory = (page_directory_t*)kmalloc_a(sizeof(page_directory_t));
    memcpy(process_directory, kernel_directory, sizeof(page_directory_t));

    uint32_t physical_addr = virt_to_phys((uint32_t)&process_directory->physical_tables[0], NULL);
    process_node->process.pd_phys = physical_addr;

    // map process stack
    uint32_t next_stack_page = USER_STACK_ADDRESS;
    for (uint32_t i = 0; i < USER_STACK_SIZE; i++) {
        alloc_page(next_stack_page, 1, process_directory);
        next_stack_page -= PAGE_SIZE;
    }

    // map process code
    uint32_t next_code_page = USER_CODE_ADDRESS;
    for (uint32_t i = 0; i < USER_CODE_SIZE; i++) {
        alloc_page(next_code_page, 1, process_directory);
        next_code_page += PAGE_SIZE;
    }

    process_node->process.page_directory_v = process_directory;
    process_node->process.context.esp = USER_STACK_ADDRESS;
    process_node->process.context.eip = USER_CODE_ADDRESS;
    process_node->process.context.ebp = next_stack_page;
    process_node->process.context.eflags = 0x202;
    process_node->process.context.cs = (3 * 8) | 0x3;
    process_node->process.context.ds = (4 * 8) | 0x3;
    process_node->process.context.ss = (4 * 8) | 0x3;
}

void load_process_code(pcb_list_node_t *process_node, char *process_start, uint32_t process_size) {
    // switch to the process page directory
    load_page_directory((uint32_t*)process_node->process.pd_phys);
    memcpy((uint32_t*)process_node->process.context.eip, process_start, process_size);
}   


void create_process(char *process_start, uint32_t process_size, enum process_state state) {
    pcb_list_node_t *new_process = (pcb_list_node_t*)kmalloc(sizeof(pcb_list_node_t));   

    if(current == NULL) {
        current = new_process;
        new_process->next = new_process;
        new_process->previous = new_process;
    }
    else {
        new_process->next = current;
        new_process->previous = current->previous;

        current->previous->next = new_process;
        current->previous = new_process;

    }

    new_process->process.pid = last_pid++;
    new_process->process.state = state;
    new_process->process.time_slice = DEFALUT_TIME_SLICE;
    new_process->process.process_kernel_stack = (uint32_t)kmalloc_a(1024) + 1024;

    map_process_pages(new_process);
    load_process_code(new_process, process_start, process_size);
}


pcb_list_node_t *find_to_switch() {
    pcb_list_node_t *next = current->next;

    while(next->process.state == blocked && next != current) {
        next = next->next;
    }

    return next;
}

void load_next_process(pcb_list_node_t *next) {
    // Load the next process's page directory
    load_page_directory((uint32_t *)next->process.pd_phys);

    // Prepare the next process for execution
    current = next;  // Update the global current process pointer
    current->process.state = running;
    current->process.time_slice = DEFALUT_TIME_SLICE;

    // Switch kernel stack and context
    tss_switch(current->process.process_kernel_stack);
    context_switch(current->process.context);
}

void switch_process(registers_t regs) {
    // Find the next process to switch to
    pcb_list_node_t *next = find_to_switch();
    if (next == current || next->process.state == blocked) {
        return;
    }

    // Save the current process context
    current->process.context.eax = regs.eax;
    current->process.context.ebx = regs.ebx;
    current->process.context.ecx = regs.ecx;
    current->process.context.edx = regs.edx;
    current->process.context.ebp = regs.ebp;
    current->process.context.esi = regs.esi;
    current->process.context.edi = regs.edi;
    current->process.context.esp = regs.esp;  // Kernel stack pointer
    current->process.context.eip = regs.eip;  // Return address
    current->process.context.eflags = regs.eflags;
    current->process.context.cs = regs.cs;
    current->process.context.ds = regs.ds;
    current->process.context.ss = regs.ss;

    if (current->process.state == blocked) {
        current->process.state = blocked;
    } else {
        current->process.state = runnable;
    }

    // Load the next process
    load_next_process(next);
}


void enter_user_space(pcb_list_node_t *process_node) {
    process_node->process.state = running;
    tss_switch(process_node->process.process_kernel_stack);
    load_page_directory((uint32_t*)process_node->process.pd_phys);
    jump_usermode();
}


pcb_list_node_t *get_process_by_pid(int pid) {
    pcb_list_node_t *node = current;
    while (node->process.pid != pid) {
        node = node->next;
        if (node == current) {
            return NULL;
        }
    }

    return node;
}

void process_exit() {
    active_processes--;

    // mark current as blocked
    current->process.state = blocked;

    // restart its registers
    current->process.context.eax = 0;
    current->process.context.ebx = 0;
    current->process.context.ecx = 0;
    current->process.context.edx = 0;
    current->process.context.ebp = 0;
    current->process.context.esi = 0;
    current->process.context.edi = 0;
    current->process.context.esp = USER_STACK_ADDRESS;
    current->process.context.eip = USER_CODE_ADDRESS;
    current->process.context.eflags = 0x202;

    if (active_processes == 0) {
        current = get_process_by_pid(0);
        load_next_process(current);
        return;
    }
    
    // find next process to switch to
    pcb_list_node_t *next = find_to_switch();
    if (next == current) {
        printf("Current: %d\n", current->process.pid);
        printf("Next: %d\n", next->process.pid);
        // all processes are either blocked or finished
        printf("Simulation finished\n");
        while (1);
        return;
    }

    // Load next process
    load_next_process(next);
}

int get_pid() {
    return current->process.pid;
}

pcb_list_node_t *get_current_process() {
    return current;
}

void schedule(registers_t regs) {
    if(current == NULL) {
        return;
    }

    if (current->process.time_slice > 0 && current->process.state == running) {
        current->process.time_slice--;
    } else {
        switch_process(regs);
    }
}

void start_simulation() {
    // find PID 1 and PID 2
    pcb_list_node_t *pid1 = get_process_by_pid(1);
    pcb_list_node_t *pid2 = get_process_by_pid(2);

    // set PID 1 adn PID 2 to running
    pid1->process.state = runnable;
    active_processes++;
    pid2->process.state = runnable;
    active_processes++;

    current->process.time_slice = 0;
    current->process.state = blocked;
}

void scheduler_print() {
    pcb_list_node_t *node = current;
    while (node->next != current) {
        printf("pid: %d, state: %d\n", node->process.pid, node->process.state);
        node = node->next;
    }
}

