#include <kernel/kheap.h>
#include <kernel/idt.h>
#include <kernel/interrupt_helpers.h>
#include <kernel/frame.h>
#include <kernel/kmalloc_early.h>
#include <kernel/paging.h>
#include <kernel/tty.h>
#include <kernel/isr.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

page_directory_t *kernel_directory;
page_directory_t *current_directory;
uint8_t kheap_initialized = 0;

void page_fault_handler(registers_t regs) {
    uint32_t faulting_address;
    __asm__ __volatile__("mov %%cr2, %0" : "=r" (faulting_address));

    int present = !(regs.err_code & 0x1);
    int rw = regs.err_code & 0x2;
    int us = regs.err_code & 0x4;
    int reserved = regs.err_code & 0x8;
    int id = regs.err_code & 0x10;

    printf("Page fault! ( ");
    if (present) printf("present ");
    if (rw) printf("read-only ");
    if (us) printf("user-mode ");
    if (reserved) printf("reserved ");
    if (id) printf("instruction-fetch ");
    printf(") at %x\n", faulting_address);
    pause();
}

void set_kheap_initialized() {
    kheap_initialized = 1;
}

void paging_init(uint32_t total_memory_size) {
    printf("Initializing paging\n");
    frame_init_allocator(total_memory_size);

    kernel_directory = (page_directory_t*)kmalloc_early_a(sizeof(page_directory_t));
    memset(kernel_directory, 0, sizeof(page_directory_t));
    current_directory = kernel_directory;

    uint32_t i;
    for (i = 0; i < PAGE_DIRECTORY_SIZE; i++) {
        kernel_directory->tables[i] = NULL;
        kernel_directory->physical_tables[i] = 0x00000002;
    }

    page_table_t *kernel_higher_half = (page_table_t*)kmalloc_early_a(sizeof(page_table_t));
    memset(kernel_higher_half, 0, sizeof(page_table_t));

    for (i = 0; i < PAGE_TABLE_SIZE; i++) {
        uint32_t frame_address = frame_alloc();
        if (frame_address == 0xFFFFFFFF) {
            printf("Failed to allocate frame\n");
            return;
        }
        // shift by 12 so the address is page aligned
        kernel_higher_half->pages[i].frame = frame_address >> 12;
        kernel_higher_half->pages[i].present = 1;
        kernel_higher_half->pages[i].read_write = 1;
        kernel_higher_half->pages[i].user_supervisor = 0;
    }

    // Map VGA memory to 0xC03FF000
    kernel_higher_half->pages[0x3FF].frame = 0xB8000 >> 12;

    uint32_t kernel_higher_index = KERNEL_VIRTUAL_BASE >> 22;
    kernel_directory->tables[kernel_higher_index] = kernel_higher_half;
    kernel_directory->physical_tables[kernel_higher_index] = (((uint32_t)kernel_higher_half) - KERNEL_VIRTUAL_BASE) | PAGE_PRESENT | PAGE_WRITE;

    uint32_t kernel_page_dir_phys_addr = (uint32_t)&kernel_directory->physical_tables[0] - KERNEL_VIRTUAL_BASE;

    load_page_directory((uint32_t*)kernel_page_dir_phys_addr);

    // Register page fault handler
    register_interrupt_handler(PAGE_FAULT, page_fault_handler);

    printf("Paging initialized\n");
}

page_table_entry_t *get_page(uint32_t virtual_address, int make, int is_user_space, page_directory_t *dir) {
    if (dir == NULL) {
        printf("get_page: dir is NULL\n");
        return NULL;
    }

    uint32_t table_index = virtual_address >> 22;
    uint32_t page_index = (virtual_address >> 12) & 0x3FF;

    if (dir->tables[table_index] != NULL) {
        return &dir->tables[table_index]->pages[page_index];
    } else if (make) {
        page_table_t *table;
        uint32_t phys_addr;
        if (kheap_initialized) {
            table = (page_table_t *)kmalloc_ap(sizeof(page_table_t), &phys_addr);
            // printf("table: %x\n", table);
            // printf("phys: %x\n", phys_addr);
        } else {
            table = (page_table_t *)kmalloc_early_a(sizeof(page_table_t));
            phys_addr = (uint32_t)table - KERNEL_VIRTUAL_BASE;
        }

        if (table == NULL) {
            return NULL;
        }
        
        dir->tables[table_index] = table;
        memset(dir->tables[table_index], 0, sizeof(page_table_t));
        // printf("phys_addr: %x\n", phys_addr);

        uint32_t phys_addr_with_flags = phys_addr | PAGE_PRESENT | PAGE_WRITE;
        if (is_user_space) {
            phys_addr_with_flags |= PAGE_USER;
        }

        dir->physical_tables[table_index] = phys_addr_with_flags;

        return &dir->tables[table_index]->pages[page_index];
    } else {
        return NULL;
    }
}

page_table_entry_t *get_kernel_page(uint32_t virtual_address, int make) {
    return get_page(virtual_address, make, 0, kernel_directory);
}

uint32_t virt_to_phys(uint32_t virtual_address, page_directory_t *dir) {
    if (!dir) {
        dir = kernel_directory;
    }

    page_table_entry_t *page = get_page(virtual_address, 0, 0, dir);
    if (page == NULL) {
        return 0;
    }

    uint32_t frame = page->frame;
    return ((frame << 12) + (virtual_address & 0xFFF));
}
