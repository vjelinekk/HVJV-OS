#ifndef SCHED_H
#define SCHED_H

#include <kernel/isr.h>
#include <kernel/pcb.h>

extern void jump_usermode();
extern void context_switch(struct cpu_context regs);

void scheduler_init();
void create_process(char *process_start, uint32_t process_size);
void enter_user_space(pcb_list_node_t *process_node);
void switch_process(registers_t regs);
void schedule(registers_t regs);
void scheduler_print();

#endif // !SCHED_H
