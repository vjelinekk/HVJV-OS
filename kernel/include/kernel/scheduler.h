#ifndef SCHED_H
#define SCHED_H

#include <kernel/pcb.h>


void init_scheduler();
void create_process(void(*fnc)(void));
void schedule();
#endif // !SCHED_H
