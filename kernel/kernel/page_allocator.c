#include <kernel/paging.h>
#include <kernel/page_allocator.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <kernel/frame.h>

page_table_entry_t *alloc_page(uint32_t virtual_address, int is_user_space, page_directory_t *dir) {
    page_table_entry_t *page;

    if (is_user_space) {
        page = get_page(virtual_address, 1, 1, dir);
    } else {
        page = get_kernel_page(virtual_address, 1);
    }

    if (page == NULL) {
        printf("Failed to allocate page\n");
        return NULL;
    }

    uint32_t frame_address = frame_alloc();
    if (frame_address == 0xFFFFFFFF) {
        printf("Failed to allocate frame\n");
        return NULL;
    }

    page->frame = frame_address >> 12;
    page->present = 1;
    page->read_write = 1;
    page->user_supervisor = is_user_space;

    flush_tlb();
    return page;
}

void free_page(uint32_t virtual_address, int is_kernel, page_directory_t *dir) {
    page_table_entry_t *page;
    if (is_kernel) {
        page = get_kernel_page(virtual_address, 0);
    } else {
        page = get_page(virtual_address, 0, 1, dir);
    }

    if (page == NULL) {
        printf("Failed to free page\n");
        return;
    }

    frame_free(page->frame << 12);
    page->frame = 0;
    page->present = 0;
    page->read_write = 0;
    page->user_supervisor = 0;

    flush_tlb();
}

int alloc_user_heap_pages(pcb_list_node_t *process) {
    uint32_t heap = process->process.heap_last_page_address;

    for (uint32_t i = 0; i < 10; i++) {
        page_table_entry_t *page = alloc_page(heap, 1, process->process.page_directory_v);
        if (page == NULL) {
            printf("Failed to allocate heap page\n");
            return 0;
        }

        heap += PAGE_SIZE;
    }

    process->process.heap_pages_count += 10;
    process->process.heap_last_page_address = heap;

    return process->process.heap_pages_count;
}
