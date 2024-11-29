#include "kernel/pcb.h"
#include <cstddef>
#include <kernel/scheduler.h>
#include <kernel/kheap.h>

void create_process() {
    struct pcb_list_node *new_process = (pcb_list_node_t*)kmalloc(sizeof(pcb_list_node));

    if(current == NULL) {
        current = new_process;
        new_process->next = NULL;
        new_process->previous = NULL;
    }
    else {
        new_process->next = current;
        new_process->previous = current->previous;
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
    
}

void schedule() {
    if(current->process.time_slice > 0) {
        current->process.time_slice--;
    }
    else {
        pcb_list_node_t *next_process = find_to_switch();
        switch_process(next_process);
    }   
}

