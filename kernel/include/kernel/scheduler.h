#ifndef SCHED_H
#define SCHED_H

#include <kernel/isr.h>
#include <kernel/pcb.h>

/**
 * Jump to user mode
 * 
 */
extern void jump_usermode();

/**
 * Switch the context
 * 
 * @param regs The context to switch to
 */
extern void context_switch(struct cpu_context regs);

/**
 * Initialize the scheduler
 * 
 */
void scheduler_init();

/**
 * Create a new process
 * 
 * @param process_start The start of the process
 * @param process_size The size of the process
 * @param state The state of the process
 */
void create_process(char *process_start, uint32_t process_size, enum process_state state);

/**
 * Enter the user space
 * 
 * @param process_node The process to enter
 */
void enter_user_space(pcb_list_node_t *process_node);

/**
 * Switch the process
 * 
 * @param regs The context of current process
 */
void switch_process(registers_t regs);

/**
 * Exit the process
 * 
 * NOTE: Currently when exiting the process is only put into blocked state so it
 * can be rerun later. This is not the correct behavior and will be fixed in the future.
 */
void process_exit();

/**
 * Get the process PID
 * 
 * @return The PID of current process
 */
int get_pid();

/**
 * Get the current process
 * 
 * @return The current process
 */
pcb_list_node_t *get_current_process();

/**
 * Start the simulation
 */
void start_SM_simulation();

/**
 * Schedule the next process
 * 
 * @param regs The context of the current process
 */
void schedule(registers_t regs);

/**
 * Print the scheduler
 */
void scheduler_print();

#endif // !SCHED_H
