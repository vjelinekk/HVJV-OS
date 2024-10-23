#include <kernel/gdt.h>

// Declare GDT and GDT pointer
struct gdt_entry gdt[3]; // We'll define 3 segments
struct gdt_ptr gdtp;

void init_gdt() {
    gdtp.limit = sizeof(gdt) - 1; // Limit of GDT
    gdtp.base = (unsigned int)&gdt; // Base address of GDT

    // Set up GDT entries (initialization is already done in gdt.S)
    gdt[0] = (struct gdt_entry){0}; // Null descriptor
    gdt[1] = (struct gdt_entry){
        .limit_low = 0xFFFF,
        .base_low = 0x0000,
        .base_mid = 0x00,
        .access = 0x9A, // Code segment: present, ring 0, executable
        .granularity = 0xCF, // Granularity: limit high, 32-bit
        .base_high = 0x00
    };
    gdt[2] = (struct gdt_entry){
        .limit_low = 0xFFFF,
        .base_low = 0x0000,
        .base_mid = 0x00,
        .access = 0x92, // Data segment: present, ring 0, writable
        .granularity = 0xCF, // Granularity: limit high, 32-bit
        .base_high = 0x00
    };

    setGdt(); // Call the assembly function to load the GDT
}

struct gdt_ptr get_gdtp() {
    return gdtp;
}

struct gdt_entry get_gdt(int index) {
    return gdt[index];
}
