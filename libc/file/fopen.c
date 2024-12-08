#include <file.h>

int fopen(const char *filename) {
    int fd;
    asm volatile(
        "movl $2, %%eax\n"    // Syscall number for open
        "movl %1, %%ebx\n"    // Argument 1: pointer to filename
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Store return value in fd
        : "=r"(fd)            // Output
        : "r"(filename)       // Input
        : "eax", "ebx", "memory" // Clobbered registers
    );
    return fd;
}
