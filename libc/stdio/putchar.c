#include <stdio.h>

#if defined(__is_libk)
#include <kernel/tty.h>
#endif

int putchar(int ic) {
	char c = (char) ic;
#if defined(__is_libk)
	terminal_write(&c, sizeof(c));
#else
    int result;
    asm volatile (
        "movl $0, %%eax\n"    // Syscall number for write (0)
        "movb %1, %%bl\n"    // Argument 1: pointer to message
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Return value in eax
        : "=r"(result)        // Output
        : "r"(c)              // Inputs
        : "eax", "ebx" // Clobbered registers
    );
#endif
	return ic;
}
