#ifndef KMALLOC_H
#define KMALLOC_H

#include <stdint.h>

extern uint32_t _kernel_end;

uint32_t kmalloc(uint32_t size);
uint32_t kmalloc_a(uint32_t size);

uint32_t kmalloc_get_last_address();

#endif
