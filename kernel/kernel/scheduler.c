#include "kernel/isr.h"
#include <kernel/interrupt_helpers.h>
#include <kernel/pcb.h>
#include <kernel/scheduler.h>
#include <kernel/kheap.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <kernel/port.h>
#include <kernel/pic.h>

pcb_list_node_t *current;
int8_t last_pid = 0;

void init_scheduler() {
    register_interrupt_handler(IRQ0, &schedule);
    create_process();
    create_process();
}
void create_process(int (*fnc_pointer)(void)) {
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
    new_process->process.state = new;
    new_process->process.time_slice = DEFALUT_TIME_SLICE;
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

    current->process.time_slice = 0;
    current->process.state = runnable;
    //TODO switch context function
    
    current = process_node;
    current->process.state = running;
    current->process.time_slice = DEFALUT_TIME_SLICE;
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
    
    printf("runnging process: %d                    \n", current->process.pid);
    outb(MASTER_COMMAND, PIC_EOI);
}

