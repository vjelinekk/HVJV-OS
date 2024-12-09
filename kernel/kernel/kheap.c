#include <kernel/paging.h>
#include <kernel/kheap.h>
#include <kernel/page_allocator.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

block_t *first_block = NULL;
block_t *last_block = NULL;
uint32_t kheap_end = KHEAP_START + KHEAP_INITIAL_SIZE;
uint32_t kheap_total_size = KHEAP_INITIAL_SIZE;

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

    set_kheap_initialized();
}

static uint8_t *get_aligned_address_in_block(block_t *block, uint32_t size, uint32_t *bytes_skipped) {
    if (block == NULL || block->is_free == 0) {
        return NULL;
    }

    uint8_t *start_address = (uint8_t *)block + sizeof(block_t);

    uint32_t aligned_address = ((uint32_t)start_address + ALIGNMENT - 1) & ~(ALIGNMENT - 1);

    if (bytes_skipped) {
        *bytes_skipped = aligned_address - (uint32_t)start_address;
    }

    uint32_t remaining_size = block->size - (aligned_address - (uint32_t)start_address);

    if (remaining_size < size) {
        return NULL;
    }

    return (uint8_t *)aligned_address;
}

static block_t *split_aligned_block(block_t *old_block, uint8_t *aligned_address, uint32_t bytes_skipped) {
    if (
        old_block == NULL || 
        old_block->is_free == 0 || 
        aligned_address == NULL || 
        bytes_skipped >= old_block->size
    ) {
        return NULL;
    }

    // it is possible that the old_block is already aligned
    if ((uint8_t *)old_block + sizeof(block_t) == aligned_address) {
        return old_block;
    }

    block_t *new_block = (block_t *)(aligned_address - sizeof(block_t));
    new_block->size = old_block->size - bytes_skipped - sizeof(block_t);
    new_block->next = old_block->next;
    new_block->prev = old_block;
    new_block->is_free = 1;

    // now we need to make the old block smaller and it as free
    old_block->size = bytes_skipped;
    old_block->next = new_block;

    return new_block;
}

static block_t *find_free_block(uint32_t size, int align) {
    block_t *current_block = first_block;

    while (current_block != NULL) {
        if (align) {
            uint32_t bytes_skipped = 0;
            uint8_t *aligned_address = get_aligned_address_in_block(current_block, size, &bytes_skipped);
            if (aligned_address != NULL) { // there is enough space in the block for an aligned allocation
                return split_aligned_block(current_block, aligned_address, bytes_skipped);
            }
        } else {
            if (current_block->is_free && current_block->size >= (size + sizeof(block_t))) {
                return current_block;
            }
        }
        current_block = current_block->next;
    }

    return NULL;
}

static void expand_heap(uint32_t size) {
    size += PAGE_SIZE;

    if (kheap_total_size + size > KHEAP_MAX_SIZE) {
        printf("Failed to allocate block: Out of memory\n");
        return;
    }

    uint32_t new_block_size = size + sizeof(block_t);
    uint32_t new_block_pages = new_block_size / PAGE_SIZE + 1;

    for (uint32_t i = 0; i < new_block_pages; i++) {
        page_table_entry_t *page = alloc_page(kheap_end + i * PAGE_SIZE, 0, NULL);
        if (page == NULL) {
            printf("Failed to allocate page\n");
            // free the pages that were allocated
            for (uint32_t j = 0; j < i; j++) {
                free_page(kheap_end + j * PAGE_SIZE, 1, NULL);
            }
            return;
        }
    }

    memset((void *)kheap_end, 0, new_block_pages * PAGE_SIZE);
    block_t *new_block = (block_t *)kheap_end;
    new_block->size = new_block_pages * PAGE_SIZE;
    new_block->next = NULL;
    new_block->prev = last_block;
    new_block->is_free = 1;

    if (last_block->is_free) {
        last_block->size += new_block->size;
        last_block->next = new_block->next;
    } else {
        last_block->next = new_block;
        last_block = new_block;
    }

    kheap_end += new_block_pages * PAGE_SIZE;
}

static void split_block(block_t *block, uint32_t size) {
    block_t *new_block = (block_t *)((uint8_t *)block + size + sizeof(block_t));
    new_block->size = block->size - size - sizeof(block_t);
    new_block->next = block->next;
    new_block->prev = block;
    new_block->is_free = 1;

    if (!new_block->next) {
        last_block = new_block;
    }

    block->size = size + sizeof(block_t);
    block->next = new_block;
}

void *kmalloc_impl(uint32_t size, int align) {
    if (size <= 0) {
        return NULL;
    }

    block_t *free_block = find_free_block(size, align);
    if (free_block == NULL) {
        expand_heap(size);
        free_block = find_free_block(size, align);
        if (free_block == NULL) {
            printf("Failed to allocate block\n");
            return NULL;
        }
    }

    // If the block is larger than the requested size, split it
    if (free_block->size > size + sizeof(block_t)) {
        split_block(free_block, size);
    }
    // Mark the block as used
    free_block->is_free = 0;

    kheap_total_size += free_block->size;

    return (void *)((uint8_t *)free_block + sizeof(block_t));
}

void *kmalloc(uint32_t size) {
    return kmalloc_impl(size, 0);
}

void *kmalloc_a(uint32_t size) {
    return kmalloc_impl(size, 1);
}

void *kmalloc_ap(uint32_t size, uint32_t *phys) {
    void *virt = kmalloc_impl(size, 1);
    if (virt == NULL) {
        return NULL;
    }

    page_table_entry_t *page = get_kernel_page((uint32_t)virt, 0);
    if (page == NULL) {
        return NULL;
    }

    *phys = (page->frame << 12) | ((uint32_t)virt & 0xFFF);

    return virt;
}

static void join_free_blocks() {
    block_t *current_block = first_block;
    while (current_block != NULL) {
        if (current_block->is_free && current_block->next != NULL && current_block->next->is_free) {
            current_block->size += current_block->next->size;
            current_block->next = current_block->next->next;
            if (current_block->next != NULL) {
                current_block->next->prev = current_block;
            } else {
                last_block = current_block;
            }
            continue; // Recheck the current block
        }
        current_block = current_block->next;
    }
}

void kfree(void *ptr) {
    if (ptr == NULL) {
        return;
    }

    if ((uint32_t)ptr < KHEAP_START || (uint32_t)ptr > kheap_end) {
        return;
    }

    block_t *block = (block_t *)((uint8_t *)ptr - sizeof(block_t));

    if (block->is_free) {
        printf("Double free detected\n");
        return;
    }

    block->is_free = 1;
    kheap_total_size -= block->size;

    join_free_blocks();
}

void kheap_print() {
    printf("Total heap size: %d\n", kheap_total_size);
    block_t *current_block = first_block;
    while (current_block != NULL) {
        printf("Link: %x, size: %d, is_free: %d\n", current_block, current_block->size, current_block->is_free);
        current_block = current_block->next;
    }
}


