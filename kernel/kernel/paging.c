#include <kernel/frame.h>
#include <kernel/kmalloc.h>
#include <kernel/paging.h>
#include <kernel/tty.h>
#include <kernel/isr.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

page_directory_t *kernel_directory;
page_directory_t *current_directory;

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
    __asm__ __volatile__("hlt");
}

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

    page_table_t *kernel_ident = (page_table_t*)kmalloc_a(sizeof(page_table_t));
    memset(kernel_ident, 0, sizeof(page_table_t));

    page_table_t *kernel_higher_half = (page_table_t*)kmalloc_a(sizeof(page_table_t));
    memset(kernel_higher_half, 0, sizeof(page_table_t));

    for (i = 0; i < PAGE_TABLE_SIZE; i++) {
        uint32_t frame_address = frame_alloc();
        if (frame_address == 0xFFFFFFFF) {
            printf("Failed to allocate frame\n");
            return;
        }
        kernel_ident->pages[i].frame = frame_address >> 12;
        kernel_ident->pages[i].present = 1;
        kernel_ident->pages[i].read_write = 1;
        kernel_ident->pages[i].user_supervisor = 0;

        kernel_higher_half->pages[i].frame = frame_address >> 12;
        kernel_higher_half->pages[i].present = 1;
        kernel_higher_half->pages[i].read_write = 1;
        kernel_higher_half->pages[i].user_supervisor = 0;
    }
}

