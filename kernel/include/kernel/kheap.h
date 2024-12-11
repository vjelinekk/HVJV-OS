#ifndef KHEAP_H
#define KHEAP_H

#include <stdint.h>

#define KHEAP_START 0xC4000000
// initial heap size is 1MB
#define KHEAP_INITIAL_SIZE 0x100000
// initial heap size in pages
#define KHEAP_INITIAL_SIZE_PAGES (KHEAP_INITIAL_SIZE / 4096)
// max heap size is 4MB
#define KHEAP_MAX_SIZE 0x400000
// alignment
#define ALIGNMENT 0x1000

struct block {
    uint32_t size;
    struct block *next;
    struct block *prev;
    uint8_t is_free;
};
typedef struct block block_t;

/**
 * Initialize the kernel heap
 */
void kheap_init();

/**
 * Allocate memory
 * 
 * @param size The size of the memory to allocate
 * @return The pointer to the allocated memory
 */
void *kmalloc(uint32_t size);

/**
 * Allocate aligned memory
 * 
 * @param size The size of the memory to allocate
 * @return The pointer to the allocated memory
 */
void *kmalloc_a(uint32_t size);

/**
 * Allocate aligned memory and get the physical address
 * 
 * @param size The size of the memory to allocate
 * @param phys The physical address of the allocated memory
 * @return The pointer to the allocated memory
 */
void *kmalloc_ap(uint32_t size, uint32_t *phys);

/**
 * Free memory
 * 
 * @param *ptr The pointer to the memory to free
 * @return void
 */
void kfree(void *ptr);

/**
 * Print the kernel heap
 */
void kheap_print();

#endif // !KHEAP_H
