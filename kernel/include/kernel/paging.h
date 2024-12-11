#ifndef PAGING_H
#define PAGING_H

#include <stdint.h>

#define PAGE_SIZE 4096
#define PAGE_DIRECTORY_SIZE 1024
#define PAGE_TABLE_SIZE 1024
#define NUM_PAGES 1024
#define KERNEL_VIRTUAL_BASE 0xC0000000

#define PAGE_PRESENT  0x1
#define PAGE_WRITE    0x2
#define PAGE_USER     0x4
#define PAGE_KERNEL   0x0


extern void load_page_directory(uint32_t*);
extern void enable_paging();
extern void switch_to_higher_half();
extern void flush_tlb();

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

/**
 * Initialize the paging system
 * 
 * @param total_memory_size The total memory size in bytes
 */
void paging_init(uint32_t total_memory_size);

/**
 * Set the kernel heap initialized flag
 */
void set_kheap_initialized();

/**
 * Get the kernel directory
 * 
 * @return The kernel page directory
 */
page_directory_t *get_kernel_directory();

/**
 * Get page
 * 
 * @param virtual_address The virtual address
 * @param is_user_space 1 if user space, 0 if kernel space
 * @param make 1 if the page should be created, 0 if not
 * @param dir The page directory
 * @return The page table entry
 */
page_table_entry_t *get_page(uint32_t virtual_address, int make, int is_user_space, page_directory_t *dir);

/**
 * Get kernel page
 * 
 * @param virtual_address The virtual address
 * @param make 1 if the page should be created, 0 if not
 * @return The page table entry
 */
page_table_entry_t *get_kernel_page(uint32_t virtual_address, int make);

/**
 * Map a page to a directory
 * 
 * @param page The page table entry
 * @param virtual_address The virtual address
 * @param dir The page directory
 * @return 0 if successful, -1 otherwise
 */
int map_page_to_directory(page_table_entry_t *page, uint32_t virtual_address, page_directory_t *dir);

/**
 * Get the physical address of a virtual address
 * 
 * @param virtual_address The virtual address
 * @param dir The page directory
 */
uint32_t virt_to_phys(uint32_t virtual_address, page_directory_t *dir);

#endif // !PAGING_H
