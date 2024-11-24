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

struct block {
    uint32_t size;
    struct block *next;
    struct block *prev;
    uint8_t is_free;
};
typedef struct block block_t;

void kheap_init();
void *kmalloc(uint32_t size);
void kfree(void *ptr);

void kheap_print();

#endif // !KHEAP_H
