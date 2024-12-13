#include <process.h>

void start_simulation() {
    asm volatile(
        "movl $8, %%eax\n"    // Syscall number for start_simulation
        "int $0x80\n"         // Trigger syscall
        :                     // No outputs
        :                     // No inputs
        : "eax"               // Clobbered registers
    );
}

