#ifndef SYSCALL_H
#define SYSCALL_H

#include <stdint.h>
struct syscall_regs {
    uint32_t eax, ebx, ecx, edx, esi, edi;
} __attribute__((packed));
typedef struct syscall_regs syscall_regs_t;

int syscall_dispatcher(syscall_regs_t regs);

#endif /* ifndef SYSCALL_H */
