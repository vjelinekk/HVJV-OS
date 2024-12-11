#ifndef PAGE_ALLOCATOR_H
#define PAGE_ALLOCATOR_H

#include <stdint.h>
#include <kernel/paging.h>

/**
 * Allocate a page
 * 
 * @param virtual_address The virtual address of the page
 * @param is_user_space Whether the page is in user space
 * @param dir The page directory to allocate the page in
 */
page_table_entry_t *alloc_page(uint32_t virtual_address, int is_user_space, page_directory_t *dir);

/**
 * Free a page
 * 
 * @param virtual_address The virtual address of the page
 * @param is_kernel Whether the page is in kernel space
 * @param dir The page directory to free the page in
 */
void free_page(uint32_t virtual_address, int is_kernel, page_directory_t *dir);

#endif // !PAGE_ALLOCATOR_H
