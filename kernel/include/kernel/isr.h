#ifndef ISR_H
#define ISR_H

#include <stdint.h>
#include <kernel/idt.h>

typedef void (*isr_handler_t)(registers_t);
void register_interrupt_handler(uint8_t n, isr_handler_t handler);
void isr_handler(registers_t regs);
void irq_handler(registers_t regs);


#endif
