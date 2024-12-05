#ifndef SCHED_H
#define SCHED_H

#include <kernel/pcb.h>

extern void register_context_switch(uint32_t esp, uint32_t eip);
void scheduler_init();
void create_process();
void schedule();
#endif // !SCHED_H
