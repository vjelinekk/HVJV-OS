#include <process.h>

int getpid() {
    int pid;
    asm volatile(
        "movl $6, %%eax\n"    // Syscall number for getpid
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Store return value in pid
        : "=r"(pid)           // Output
    );
    return pid;
}
