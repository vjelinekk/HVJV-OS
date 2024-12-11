#ifndef GDT_H
#define GDT_H

#include <stdint.h>

// This structure contains the value of one GDT entry.
// We use the attribute 'packed' to tell GCC not to change
// any of the alignment in the structure.
struct gdt_entry_struct
{
    uint16_t limit_low;           // The lower 16 bits of the limit.
    uint16_t base_low;            // The lower 16 bits of the base.
    uint8_t  base_middle;         // The next 8 bits of the base.
    uint8_t  access;              // Access flags, determine what ring this segment can be used in.
    uint8_t  granularity;         // low 4 bits are high 4 bits of limit
    uint8_t  base_high;           // The last 8 bits of the base.
} __attribute__((packed));
typedef struct gdt_entry_struct gdt_entry_t;

struct gdt_ptr_struct
{
    uint16_t limit;               // The upper 16 bits of all selector limits.
    uint32_t base;                // The address of the first gdt_entry_t struct.
}
    __attribute__((packed));
typedef struct gdt_ptr_struct gdt_ptr_t;

// Lets us access our ASM functions from our C code.
//extern void load_gdt(uint32_t);
extern void load_gdt(gdt_ptr_t * gdt_ptr);

extern void tss_flush();

/**
 * Initialize the GDT
 */
void init_gdt();

/**
 * Set the value of one GDT entry.
 * 
 * @param num The index of the GDT entry
 * @param base The base address
 * @param limit The limit
 * @param access The access flags
 * @param gran The granularity
 */
gdt_ptr_t * get_gdt_ptr();

/**
 * Get the GDT entries
 * 
 * @return The GDT entries
 */
gdt_entry_t *get_gdt_entries();

/**
 * Get the GDT entry at the given index
 * 
 * @param index The index of the GDT entry
 * @return The GDT entry
 */
gdt_entry_t get_gdt_entry_at(int index);

/**
 * Switch the TSS
 * 
 * @param esp0 The new ESP0
 */
void tss_switch(uint32_t esp0);

#endif
