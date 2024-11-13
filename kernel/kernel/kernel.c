#include <stdint.h>
#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/gdt.h>
#include <kernel/idt.h>
#include <kernel/pic.h>
#include <kernel/pit.h>
#include <kernel/keyboard.h>
#include <kernel/interrupt_helpers.h>
#include <kernel/multiboot.h>
#include <kernel/frame.h>

void kernel_main(struct multiboot_info *mbi) {
	terminal_initialize();
    pic_remap();
    init_gdt();
    init_idt();
    init_timer(100);
    init_keyboard();
    sti();
    printf("Hello, kernel World!\n");

    uint32_t total_memory_size = mbi->mem_upper + mbi->mem_lower;
    printf("Total memory size: %d KB\n", total_memory_size);
    init_frames(total_memory_size);
    print_frame_bitmap();
    
    while (1) {
        char c = get_ascii_char();
        printf("%c", c);
    }
}
