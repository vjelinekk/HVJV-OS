#include <shared_memory.h>

void *get_shared_memory() {
    int shared_memory_addr;
    asm volatile(
        "movl $7, %%eax\n"    // Syscall number for open
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Store return value in fd
        : "=r"(shared_memory_addr)            // Output
    );

    return (void *)shared_memory_addr;
}
