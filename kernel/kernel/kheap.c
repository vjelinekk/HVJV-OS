#include <kernel/paging.h>
#include <kernel/kheap.h>
#include <kernel/page_allocator.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

block_t *first_block = NULL;
block_t *last_block = NULL;
uint32_t kheap_end = KHEAP_START + KHEAP_INITIAL_SIZE;
uint32_t total_heap_size = KHEAP_INITIAL_SIZE;

void kheap_init() {
    for (uint32_t i = 0; i < KHEAP_INITIAL_SIZE_PAGES; i++) {
        page_table_entry_t *page = alloc_page(KHEAP_START + i * PAGE_SIZE, 0, NULL);
        if (page == NULL) {
            printf("Failed to allocate page\n");
            return;
        }
    }
    memset((void *)KHEAP_START, 0, KHEAP_INITIAL_SIZE_PAGES * PAGE_SIZE);
    first_block = (block_t *)KHEAP_START;
    first_block->size = KHEAP_INITIAL_SIZE_PAGES * PAGE_SIZE - sizeof(block_t);
    first_block->next = NULL;
    first_block->prev = NULL;
    first_block->is_free = 1;

    last_block = first_block;
}

block_t *find_free_block(uint32_t size) {
    block_t *current_block = first_block;

    while (current_block != NULL) {
        if (current_block->is_free && current_block->size >= (size + sizeof(block_t))) {
            return current_block;
        }
        current_block = current_block->next;
    }

    return NULL;
}

block_t *create_new_block(uint32_t size) {
    if (total_heap_size + size > KHEAP_MAX_SIZE) {
        printf("Failed to allocate block: Out of memory\n");
        return NULL;
    }

    uint32_t new_block_size = size + sizeof(block_t);
    uint32_t new_block_pages = new_block_size / PAGE_SIZE + 1;

    for (uint32_t i = 0; i < new_block_pages; i++) {
        page_table_entry_t *page = alloc_page(kheap_end + i * PAGE_SIZE, 0, NULL);
        if (page == NULL) {
            printf("Failed to allocate page\n");
            return NULL;
        }
    }

    memset((void *)kheap_end, 0, new_block_pages * PAGE_SIZE);
    block_t *new_block = (block_t *)kheap_end;
    new_block->size = new_block_pages * PAGE_SIZE;
    new_block->next = NULL;
    new_block->prev = last_block;
    new_block->is_free = 1;

    last_block->next = new_block;

    kheap_end += new_block_pages * PAGE_SIZE;

    return new_block;
}

void split_block(block_t *block, uint32_t size) {
    block_t *new_block = (block_t *)((uint8_t *)block + size + sizeof(block_t));
    new_block->size = block->size - size - sizeof(block_t);
    new_block->next = block->next;
    new_block->prev = block;
    new_block->is_free = 1;

    last_block = new_block;

    block->size = size + sizeof(block_t);
    block->next = new_block;
}

void *kmalloc(uint32_t size) {
    if (size <= 0) {
        return NULL;
    }

    block_t *free_block = find_free_block(size);
    if (free_block == NULL) {
        free_block = create_new_block(size);
        if (free_block == NULL) {
            printf("Failed to allocate block: Out of memory\n");
            return NULL;
        }
    }

    // If the block is larger than the requested size, split it
    if (free_block->size > size + sizeof(block_t)) {
        split_block(free_block, size);
    }
    // Mark the block as used
    free_block->is_free = 0;

    total_heap_size += free_block->size;

    return (void *)((uint8_t *)free_block + sizeof(block_t));
}

void kheap_print() {
    printf("Total heap size: %d\n", total_heap_size);
    block_t *current_block = first_block;
    while (current_block != NULL) {
        printf("Link: %x, size: %d, is_free: %d\n", current_block, current_block->size, current_block->is_free);
        current_block = current_block->next;
    }
}


