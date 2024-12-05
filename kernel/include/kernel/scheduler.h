#ifndef SCHED_H
#define SCHED_H

#include <kernel/pcb.h>

extern void register_context_switch(uint32_t esp, uint32_t eip);

extern void jump_usermode();

void scheduler_init();
void create_process(char *process_start, uint32_t process_size);
void start_process(pcb_list_node_t *process_node);
void schedule();
void scheduler_print();

#endif // !SCHED_H
