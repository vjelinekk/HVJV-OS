#include <file.h>

int fwrite(int fd, const char *data, int size) {
    int result;
    asm volatile(
        "movl $4, %%eax\n"    // Syscall number for write
        "int $0x80\n"         // Trigger syscall
        : "=a"(result)        // Bind result to eax
        : "b"(fd), "c"(data), "d"(size) // Inputs bound to ebx, ecx, edx
        : "memory"            // Clobbered memory
    );

    return result;
}
