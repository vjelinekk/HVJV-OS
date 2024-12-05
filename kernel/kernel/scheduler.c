#include "kernel/isr.h"
#include "kernel/page_allocator.h"
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

extern char *_binary_bin_process_2_bin_start;
extern uint32_t _binary_bin_process_2_bin_size;

pcb_list_node_t *current;
int8_t last_pid = 0;

void scheduler_init() {
    register_interrupt_handler(IRQ0, &schedule);
    create_process();
    printf("process 1 created\n");
    create_process();
    printf("process 2 created\n");
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
      next_stack_page += PAGE_SIZE;
    }

    // map process code
    uint32_t next_code_page = USER_CODE_ADDRESS;
    for (uint32_t i = 0; i < USER_CODE_SIZE; i++) {
        alloc_page(next_code_page, 1, process_directory);
        next_code_page += PAGE_SIZE;
    }

    process_node->process.page_directory_v = process_directory;
    process_node->process.context.esp = next_stack_page;
    process_node->process.context.eip = USER_CODE_ADDRESS;
}

void map_process(pcb_list_node_t *process_node) {
    load_page_directory((uint32_t*)process_node->process.pd_phys);
    memcpy((uint32_t*)process_node->process.context.eip, &_binary_bin_process_2_bin_start,
           (uint32_t) &_binary_bin_process_2_bin_size);
}   


void create_process() {
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
    new_process->process.state = state_new;
    new_process->process.time_slice = DEFALUT_TIME_SLICE;

    map_process_pages(new_process);
    map_process(new_process);


}


pcb_list_node_t *find_to_switch() {
    pcb_list_node_t *next = current->next;

    while(next->process.state == blocked && next != current) {
        next = next->next;
    }

    return next;
}

void switch_process(pcb_list_node_t *process_node) {
    if(process_node == NULL || process_node->process.state == blocked) {
        return;
    }
    
    printf("switching %d -> %d           \r", current->process.pid, process_node->process.pid);
    current->process.time_slice = 0;
    current->process.state = runnable;
    
    current = process_node;
    current->process.state = running;
    current->process.time_slice = DEFALUT_TIME_SLICE;
    
    printf("stack address: %x\n", current->process.context.esp);
    printf("instruction pointer %x\n", current->process.context.eip);
    printf("page directory ph: %x\n", current->process.pd_phys);
    pause();
    load_page_directory((uint32_t*)current->process.pd_phys);
    register_context_switch(current->process.context.esp, current->process.context.eip);
}

void schedule() {
    if(current == NULL) {
        outb(MASTER_COMMAND, PIC_EOI);
        return;
    }


    if(current->process.time_slice > 0) {
        current->process.time_slice--;
    }
    else {
        pcb_list_node_t *next_process = find_to_switch();
        switch_process(next_process);
    }
    outb(MASTER_COMMAND, PIC_EOI);
}

