#ifndef SCHED_H
#include <stdint.h>
#include <kernel/pcb.h>

#define DEFALUT_TIME_SLICE 0x40000; 


pcb_list_node_t *current;
uint8_t last_pid = 0;

void create_process();
void schedule();
#endif // !SCHED_H
