#ifndef KMALLOC_H
#define KMALLOC_H

#include <stdint.h>

extern uint32_t _kernel_end;

/**
 * Early kernel memory allocation when the heap is not yet initialized
 *
 * @param size The size of the memory to allocate
 * @return The pointer to the allocated memory
 */
uint32_t kmalloc_early(uint32_t size);

/**
 * Early aligned kernel memory allocation when the heap is not yet initialized
 * 
 * @param size The size of the memory to allocate
 * @return The pointer to the allocated memory
 */
uint32_t kmalloc_early_a(uint32_t size);

/**
 * Disable early kernel memory allocation
 */
void kmalloc_early_disable();

/**
 * Get the last address allocated by the early kernel memory allocator
 * 
 * @return The last address allocated
 */
uint32_t kmalloc_early_get_last_address();

#endif
