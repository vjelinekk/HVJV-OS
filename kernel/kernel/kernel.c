#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/gdt.h>
#include <kernel/idt.h>
#include <kernel/pic.h>
#include <kernel/pit.h>
#include <kernel/keyboard.h>
#include <kernel/interrupt_helpers.h>

void kernel_main(void) {
	terminal_initialize();
    pic_remap();
    init_gdt();
    init_idt();
    init_timer(100);
    init_keyboard();
    sti();
    printf("Hello, kernel World!\n");
    printf("> ");

    while (1) {
        char c = get_ascii_char();
        printf("%c", c);
    }
}
