#include <kernel/gdt.h>
#include <kernel/tss.h>
#include <stdio.h>
#include <string.h>

// Internal function prototypes.
static void gdt_set_gate(int32_t,uint32_t,uint32_t,uint8_t,uint8_t);

gdt_entry_t gdt_entries[6];
gdt_ptr_t   gdt_ptr;

tss_entry_t tss_entry;

void init_gdt()
{
    gdt_ptr.limit = (sizeof(gdt_entry_t)*6) - 1;
    gdt_ptr.base = (uint32_t)&gdt_entries;

    /*
      Pr  Priv  1   Ex  DC   RW   Ac
      0x9A == 1001 1010  == 1   00    1   1   0    1    0
      0x92 == 1001 0010  == 1   00    1   0   0    1    0
      0xFA == 1111 1010  == 1   11    1   1   0    1    0
      0xF2 == 1111 0010  == 1   11    1   0   0    1    0

      We have page-granularity and 32-bit mode
      G   D   0   Av
      0xCF == 1100 1111  == 1   1   0   0  ~
    */

    gdt_set_gate(0,0,0,0,0);                    //Null segment
    gdt_set_gate(1, 0, 0xFFFFFFFF, 0x9A, 0xCF); //Code segment
    gdt_set_gate(2, 0, 0xFFFFFFFF, 0x92, 0xCF); //Data segment
    gdt_set_gate(3, 0, 0xFFFFFFFF, 0xFA, 0xCF); //User mode code segment
    gdt_set_gate(4, 0, 0xFFFFFFFF, 0xF2, 0xCF); //User mode data segment

    // Set up our TSS
    memset(&tss_entry, 0, sizeof(tss_entry_t));
    tss_entry.ss0 = 0x10;  // Set the kernel stack segment.
    tss_entry.esp0 = 0x0;  // Set the kernel stack pointer.
    printf("TSS base: %x\n", &tss_entry);
    
    // Add our TSS to the GDT
    gdt_set_gate(5, (uint32_t)&tss_entry, sizeof(tss_entry_t), 0xE9, 0x00);

    load_gdt(&gdt_ptr);
    tss_flush();
}

// get the gtd_ptr struct
gdt_ptr_t * get_gdt_ptr()
{
    return &gdt_ptr;
}

// get the gtd_entry struct
gdt_entry_t * get_gdt_entry()
{
    return gdt_entries;
}

// get the gtd_entry struct at index
gdt_entry_t get_gdt_entry_at(int index)
{
    return gdt_entries[index];
}

void tss_switch(uint32_t esp0)
{
    tss_entry.esp0 = esp0;
}


static void gdt_set_gate(int32_t entry, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran)
{
    gdt_entries[entry].base_low = (base & 0xFFFF);
    gdt_entries[entry].base_middle = (base >> 16) & 0xFF;
    gdt_entries[entry].base_high = (base >> 24) & 0xFF;

    gdt_entries[entry].limit_low = (limit & 0xFFFF);
    gdt_entries[entry].granularity = (limit >> 16) & 0x0F;

    gdt_entries[entry].granularity |= gran & 0xF0;
    gdt_entries[entry].access = access;
}
