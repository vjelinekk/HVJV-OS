#ifndef PAGING_H
#define PAGING_H

#include <stdint.h>

#define PAGE_SIZE 4096
#define PAGE_DIRECTORY_SIZE 1024
#define PAGE_TABLE_SIZE 1024
#define NUM_PAGES 1024
#define KERNEL_VIRTUAL_BASE 0xC0000000

extern void load_page_directory(uint32_t*);
extern void enable_paging();
extern void switch_to_higher_half();

typedef struct {
    uint32_t present    : 1;  // 1 = page present in memory
    uint32_t read_write : 1;  // 1 = read/write access, 0 = read-only
    uint32_t user_supervisor : 1; // 0 = supervisor (kernel), 1 = user space
    uint32_t reserved   : 2;  // reserved
    uint32_t accessed   : 1;  // 1 = accessed
    uint32_t dirty      : 1;  // 1 = dirty (modified)
    uint32_t pat        : 1;  // page attribute table
    uint32_t global     : 1;  // global page
    uint32_t available  : 3;  // available for use by the system
    uint32_t frame      : 20; // the frame address (physical page address)
} __attribute__((packed)) page_table_entry_t;

typedef struct {
    page_table_entry_t pages[PAGE_TABLE_SIZE];
} page_table_t;

typedef struct {
    page_table_t *tables[NUM_PAGES];
    uint32_t physical_tables[NUM_PAGES];
} page_directory_t;

void paging_init(uint32_t total_memory_size);

#endif // !PAGING_H
