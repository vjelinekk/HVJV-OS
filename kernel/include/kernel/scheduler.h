#ifndef SCHED_H
#define SCHED_H
#include <stdint.h>
#include <kernel/pcb.h>

#define DEFALUT_TIME_SLICE 0x40; 

void init_scheduler();
void create_process();
void schedule();
#endif // !SCHED_H
