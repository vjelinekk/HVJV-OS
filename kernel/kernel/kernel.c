#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/gdt.h>
#include <kernel/idt.h>

void kernel_main(void) {
	terminal_initialize();
    init_gdt();
    init_idt();
    printf("Hello, kernel World!\n");
    printf("About to divide by zero\n");
    int x = 10/0;
    printf("Divided by zero\n");
    printf("Result: %d\n", x);
}

void debug_print(const char *str) {
    volatile char *vga = (volatile char*)0xB8000;
    while (*str) {
        *vga++ = *str++;
        *vga++ = 0x07;  // Color attribute: light gray on black
    }
}
