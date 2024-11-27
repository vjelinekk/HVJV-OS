#ifndef PAGE_ALLOCATOR_H
#define PAGE_ALLOCATOR_H

#include <stdint.h>
#include <kernel/paging.h>

page_table_entry_t *alloc_page(uint32_t virtual_address, int is_user_space, page_directory_t *dir);
void free_page(uint32_t virtual_address, int is_kernel, page_directory_t *dir);

#endif // !PAGE_ALLOCATOR_H
