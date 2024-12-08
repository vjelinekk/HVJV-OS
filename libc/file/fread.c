#include <file.h>

int fread(int fd, char *buffer, int size) {
    int result;
    asm volatile(
        "movl $3, %%eax\n"    // Syscall number for read
        "int $0x80\n"         // Trigger syscall
        : "=a"(result)        // Bind result to eax
        : "b"(fd), "c"(buffer), "d"(size) // Inputs bound to ebx, ecx, edx
        : "memory"            // Clobbered memory
    );

    return result;
}

