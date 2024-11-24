#ifndef KMALLOC_H
#define KMALLOC_H

#include <stdint.h>

extern uint32_t _kernel_end;

uint32_t kmalloc_early(uint32_t size);
uint32_t kmalloc_early_a(uint32_t size);

void kmalloc_early_disable();

uint32_t kmalloc_early_get_last_address();

#endif
