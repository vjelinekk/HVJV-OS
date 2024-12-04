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
#include <string.h>

void test_syscall(int syscall_number, int arg1, int arg2) {
    asm volatile (
        "movl %0, %%eax\n"  // Syscall number
        "movl %1, %%ebx\n"  // First argument
        "movl %2, %%ecx\n"  // Second argument
        "int $0x80"         // Trigger interrupt
        :
        : "r"(syscall_number), "r"(arg1), "r"(arg2)
        : "eax", "ebx", "ecx", "memory"
    );
}

void kernel_main(struct multiboot_info *mbi) {
	terminal_initialize();
    pic_remap();
    init_gdt();
    init_idt();
    init_timer(100);
    init_keyboard();
    sti();

    mbi = (struct multiboot_info *)((uint32_t)mbi + 0xC0000000);

    printf("Flags: %x\n", mbi->flags);
    printf("Lower memory: %d KB\n", mbi->mem_lower);
    printf("Upper memory: %d KB\n", mbi->mem_upper);
    printf("Memory map length: %x\n", mbi->mmap_length);
    printf("Memory map address: %x\n", mbi->mmap_addr);

    uint32_t total_memory_bytes = (mbi->mem_upper + mbi->mem_lower) * 1024;
    printf("Total memory: %d KB\n", total_memory_bytes / 1024);
    paging_init(total_memory_bytes);
    kheap_init();

    const char *message = "Hello from user space simulation!\n";
    uint32_t length = strlen(message);

    // Place the syscall number and arguments in registers
    int result;
    asm volatile (
        "movl $0, %%eax\n"    // Syscall number for write (0)
        "movl %1, %%ebx\n"    // Argument 1: pointer to message
        "movl %2, %%ecx\n"    // Argument 2: length of message
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Return value in eax
        : "=r"(result)        // Output
        : "r"(message), "r"(length) // Inputs
        : "eax", "ebx", "ecx" // Clobbered registers
    );

    // Continue with kernel execution
    printf("Syscall simulation complete.\n");
    printf("Syscall returned: %d\n", result);

    while (1) {
        char c = get_ascii_char();
        printf("%c", c);
    }
}
