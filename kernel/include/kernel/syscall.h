#ifndef SYSCALL_H
#define SYSCALL_H

#include <stdint.h>
struct syscall_regs {
    uint32_t eax, ebx, ecx, edx, esi, edi;
} __attribute__((packed));
typedef struct syscall_regs syscall_regs_t;

/**
 * The syscall dispatcher
 * 
 * @param regs The registers containing the syscall number and arguments
 * @return The return value of the syscall
 */
int syscall_dispatcher(syscall_regs_t regs);

#endif /* ifndef SYSCALL_H */
