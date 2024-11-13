#ifndef KMALLOC_H
#define KMALLOC_H

#include <stdint.h>

extern uint32_t kernel_end;

uint32_t kmalloc(uint32_t size);

#endif
