#include <kernel/scheduler.h>
#include <kernel/tty.h>
#include <kernel/syscall.h>
#include <stdint.h>
#include <stdio.h>

int syscall_printf(const char* data, uint32_t length) {
    if (!data || length <= 0) {
        return -1;
    }

    for (uint32_t i = 0; i < length; i++) {
        char c = data[i];
        terminal_write(&c, sizeof(c));
    }

    return length;
}

int syscall_exit(int return_code) {
    process_exit();
    return 0;
}

int syscall_dispatcher(syscall_regs_t regs) {
    switch (regs.eax) {
        case 0:
            return syscall_printf((const char*) regs.ebx, regs.ecx);
            break;
        case 1:
            return syscall_exit(regs.ebx);
            break;
        default:
            printf("Unknown syscall\n");
            break;
    }

    return -1;
}
