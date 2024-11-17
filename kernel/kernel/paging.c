#include <kernel/frame.h>
#include <kernel/kmalloc.h>
#include <kernel/paging.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

page_directory_t *kernel_directory;
page_directory_t *current_directory;

uint32_t page_dir[1024] __attribute__((aligned(4096)));
uint32_t first_page_table[1024] __attribute__((aligned(4096)));

void paging_init(uint32_t total_memory_size) {
    frame_init_allocator(total_memory_size);

    kernel_directory = (page_directory_t*)kmalloc_a(sizeof(page_directory_t));
    memset(kernel_directory, 0, sizeof(page_directory_t));
    current_directory = kernel_directory;

    uint32_t i;
    for (i = 0; i < PAGE_DIRECTORY_SIZE; i++) {
        kernel_directory->tables[i] = NULL;
        kernel_directory->physical_tables[i] = 0x00000002;
    }

    page_table_t *first_page_table = (page_table_t*)kmalloc_a(sizeof(page_table_t));
    memset(first_page_table, 0, sizeof(page_table_t));

    for (i = 0; i < PAGE_TABLE_SIZE; i++) {
        uint32_t frame_address = frame_alloc();
        if (frame_address == 0xFFFFFFFF) {
            printf("Failed to allocate frame\n");
            return;
        }
        first_page_table->pages[i].frame = frame_address >> 12;
        first_page_table->pages[i].present = 1;
        first_page_table->pages[i].read_write = 1;
    }

    kernel_directory->tables[0] = first_page_table;
    kernel_directory->physical_tables[0] = ((uint32_t)first_page_table) | 3;

    load_page_directory(&kernel_directory->physical_tables[0]);
    enable_paging();
}
