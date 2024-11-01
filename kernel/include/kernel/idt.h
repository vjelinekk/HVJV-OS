#ifndef IDT_H
#define IDT_H

#include <stdint.h>

#define IDT_MAX_DESCRIPTORS 256

// Exception Codes (https://wiki.osdev.org/Exceptions)
#define DIVIDE_ERROR 0
#define DEBUG 1
#define NMI 2
#define BREAKPOINT 3
#define OVERFLOW 4
#define BOUNDS 5
#define INVALID_OPCODE 6
#define DEVICE_NOT_AVAILABLE 7
#define DOUBLE_FAULT 8
#define COPROCESSOR_SEGMENT_OVERRUN 9
#define INVALID_TSS 10
#define SEGMENT_NOT_PRESENT 11
#define STACK_SEGMENT_FAULT 12
#define GENERAL_PROTECTION 13
#define PAGE_FAULT 14
#define FLOATING_POINT_ERROR 16
#define ALIGNMENT_CHECK 17
#define MACHINE_CHECK 18
#define SIMD_FLOATING_POINT 19
#define VIRTUALIZATION 20
#define CONTROL_PROTECTION 21
#define RESERVED 22
#define RESERVED2 23
#define RESERVED3 24
#define RESERVED4 25
#define RESERVED5 26
#define RESERVED6 27
#define HYPERVISOR 28
#define VMM 29
#define SECURITY 30
#define RESERVED7 31

// IRQs
#define IRQ0 32
#define IRQ1 33
#define IRQ2 34
#define IRQ3 35
#define IRQ4 36
#define IRQ5 37
#define IRQ6 38
#define IRQ7 39
#define IRQ8 40
#define IRQ9 41
#define IRQ10 42
#define IRQ11 43
#define IRQ12 44
#define IRQ13 45
#define IRQ14 46
#define IRQ15 47

struct idt_entry_struct {
    uint16_t isr_low;
    uint16_t kernel_cs;
    uint8_t reserved;
    uint8_t flags;
    uint16_t isr_high;
} __attribute__((packed));
typedef struct idt_entry_struct idt_entry_t;

struct idt_ptr_struct {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));
typedef struct idt_ptr_struct idt_ptr_t;

// ISR Handlers
extern void isr0(void);
extern void isr1(void);
extern void isr2(void);
extern void isr3(void);
extern void isr4(void);
extern void isr5(void);
extern void isr6(void);
extern void isr7(void);
extern void isr8(void);
extern void isr9(void);
extern void isr10(void);
extern void isr11(void);
extern void isr12(void);
extern void isr13(void);
extern void isr14(void);
extern void isr15(void);
extern void isr16(void);
extern void isr17(void);
extern void isr18(void);
extern void isr19(void);
extern void isr20(void);
extern void isr21(void);
extern void isr22(void);
extern void isr23(void);
extern void isr24(void);
extern void isr25(void);
extern void isr26(void);
extern void isr27(void);
extern void isr28(void);
extern void isr29(void);
extern void isr30(void);
extern void isr31(void);

// IRQ Handlers
extern void irq0();
extern void irq1();
extern void irq2();
extern void irq3();
extern void irq4();
extern void irq5();
extern void irq6();
extern void irq7();
extern void irq8();
extern void irq9();
extern void irq10();
extern void irq11();
extern void irq12();
extern void irq13();
extern void irq14();
extern void irq15();

void idt_set_descriptor(uint8_t num, uint32_t base, uint16_t sel, uint8_t flags);

extern void load_idt(idt_ptr_t*);

void init_idt(void);

#endif // IDT_H
