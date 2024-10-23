#ifndef GDT_H
#define GDT_H

// Structure for GDT entries
struct gdt_entry {
    unsigned short limit_low;   // Lower 16 bits of the limit
    unsigned short base_low;    // Lower 16 bits of the base
    unsigned char base_mid;      // Next 8 bits of the base
    unsigned char access;        // Access flags
    unsigned char granularity;   // Granularity flags
    unsigned char base_high;     // Last 8 bits of the base
};

// Structure for GDT pointer
struct gdt_ptr {
    unsigned short limit;        // Limit of the GDT
    unsigned int base;          // Base address of the GDT
};

extern void setGdt();

void init_gdt();

struct gdt_ptr get_gdtp();

struct gdt_entry get_gdt(int index);

#endif // GDT_H

