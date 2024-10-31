#include "kernel/idt.h"
#include <kernel/isr.h>
#include <stdio.h>

isr_handler_t interrupt_handlers[256];

void register_interrupt_handler(uint8_t n, isr_handler_t handler) {
    interrupt_handlers[n] = handler;
}

void isr_handler(registers_t regs) {
    if (regs.int_no == GENERAL_PROTECTION) {
        printf("General Protection Fault\n");
    } 

    if (interrupt_handlers[regs.int_no]) {
        interrupt_handlers[regs.int_no](regs);
    }
}

void irq_handler(registers_t regs) {
    // if (regs.int_no >= 40) {
    //     outb(0xA0, 0x20);
    // }
    //
    // outb(0x20, 0x20);
    //
    if (interrupt_handlers[regs.int_no]) {
        interrupt_handlers[regs.int_no](regs);
    }
}
