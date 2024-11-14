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

    printf("Flags: %x\n", mbi->flags);
    printf("Lower memory: %d KB\n", mbi->mem_lower);
    printf("Upper memory: %d KB\n", mbi->mem_upper);
    printf("Memory map length: %x\n", mbi->mmap_length);
    printf("Memory map address: %x\n", mbi->mmap_addr);

    uint32_t i;
    for(i = 0; i < mbi->mmap_length; 
        i += sizeof(multiboot_memory_map_t)) 
    {
        multiboot_memory_map_t* mmmt = 
            (multiboot_memory_map_t*) (mbi->mmap_addr + i);

        printf("A lower: %lx, A upper: %lx, L lower: %lx, L upper: %lx, Type: %d\n",
            mmmt->addr_low, mmmt->addr_high, mmmt->len_low, mmmt->len_high, mmmt->type);

        if(mmmt->type == MULTIBOOT_MEMORY_AVAILABLE) {
            /* 
             * Do something with this memory block!
             * BE WARNED that some of memory shown as availiable is actually 
             * actively being used by the kernel! You'll need to take that
             * into account before writing to memory!
             */
        }
    }

    while (1) {
        char c = get_ascii_char();
        printf("%c", c);
    }
}
