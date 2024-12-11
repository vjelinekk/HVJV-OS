#ifndef ISR_H
#define ISR_H

#include <stdint.h>
#include <kernel/idt.h>

typedef struct registers
{
    uint32_t ds;                             // Data segment selector
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax; // Pushed by pusha.
    uint32_t int_no, err_code;               // Interrupt number and error code (if applicable)
    uint32_t eip, cs, eflags, useresp, ss;   // Pushed by the processor automatically.
} registers_t;

typedef void (*isr_handler_t)(registers_t);

/**
 * Register an interrupt handler
 * 
 * @param n The interrupt number
 * @param handler The handler function
 */
void register_interrupt_handler(uint8_t n, isr_handler_t handler);

/**
 * Basic interrupt service routine handler
 * 
 * @param regs The register state
 */
void isr_handler(registers_t regs);

/**
 * Basic interrupt request handler
 * 
 * @param regs The register state
 */
void irq_handler(registers_t regs);


#endif
