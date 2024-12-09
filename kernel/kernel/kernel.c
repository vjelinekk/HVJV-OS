#include <kernel/file_system.h>
#include <kernel/scheduler.h>
#include <kernel/kheap.h>
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
#include <kernel/paging.h>
#include <kernel/page_allocator.h>

void kernel_main(struct multiboot_info *mbi) {
	terminal_initialize();
    pic_remap();
    init_gdt();
    init_idt();
    init_timer(1);
    init_keyboard();
    sti();

    mbi = (struct multiboot_info *)((uint32_t)mbi + 0xC0000000);
    uint32_t total_memory_bytes = (mbi->mem_upper + mbi->mem_lower) * 1024;
    paging_init(total_memory_bytes);
    kheap_init();
    fs_init();
    scheduler_init();

    while(1) {
        char c = get_ascii_char();
        printf("%c", c);
    }

    printf("end of kernel code");
}

