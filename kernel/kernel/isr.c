#include <kernel/idt.h>
#include <kernel/isr.h>
#include <kernel/port.h>
#include <kernel/pic.h>
#include <stdio.h>

isr_handler_t interrupt_handlers[256];

void register_interrupt_handler(uint8_t n, isr_handler_t handler) {
    interrupt_handlers[n] = handler;
}

void isr_handler(registers_t regs) {
    printf("ISR\n");
    printf("Interrupt number: %d\n", regs.int_no);
    printf("Error code: %x\n", regs.err_code);
    if (regs.int_no == GENERAL_PROTECTION) {
        printf("General Protection Fault\n");
        printf("Error code: %x\n", regs.err_code);
        printf("EIP: %x\n", regs.eip);
        printf("CS: %x\n", regs.cs);
        printf("EFLAGS: %x\n", regs.eflags);
        printf("ESP: %x\n", regs.esp);
        printf("SS: %x\n", regs.ss);
        printf("DS: %x\n", regs.ds);
        __asm__ __volatile__("hlt");
    } 

    if (interrupt_handlers[regs.int_no]) {
        printf("Calling interrupt handler for interrupt %x\n", regs.int_no);
        interrupt_handlers[regs.int_no](regs);
    }
    printf("End of ISR\n");
}

void irq_handler(registers_t regs) {
    if (regs.int_no >= 40) {
        outb(SLAVE_COMMAND, PIC_EOI); // Send reset signal to slave
    }

    outb(MASTER_COMMAND, PIC_EOI); // Send reset signal to master

    if (interrupt_handlers[regs.int_no]) {
        interrupt_handlers[regs.int_no](regs);
    }
}
