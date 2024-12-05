#ifndef SCHED_H
#define SCHED_H

#include <kernel/isr.h>
#include <kernel/pcb.h>

extern void jump_usermode();
extern void restore_general_purpose_registers(struct cpu_context context);
extern void switch_to_process(struct cpu_context context);

void scheduler_init();
void create_process(char *process_start, uint32_t process_size);
void start_process(pcb_list_node_t *process_node);
void switch_process(registers_t regs);
void schedule(registers_t regs);
void scheduler_print();

#endif // !SCHED_H
