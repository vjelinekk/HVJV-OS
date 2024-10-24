#include <stdio.h>
#include <kernel/tty.h>
#include <kernel/gdt.h>

void kernel_main(void) {
	terminal_initialize();
    init_gdt();
    gdt_ptr_t *gdt_ptr = get_gdt_ptr();
    gdt_entry_t gdt_entry = get_gdt_entry_at(1);
    printf("GDT limit: %d\n", gdt_ptr->limit);
    printf("GDT base: %d\n", gdt_ptr->base);
    printf("GDT entry 0 limit_low: %d\n", gdt_entry.limit_low);
    printf("GDT entry 0 base_low: %d\n", gdt_entry.base_low);
    printf("GDT entry 0 base_middle: %d\n", gdt_entry.base_middle);
    printf("GDT entry 0 access: %d\n", gdt_entry.access);
    printf("GDT entry 0 granularity: %d\n", gdt_entry.granularity);
    printf("GDT entry 0 base_high: %d\n", gdt_entry.base_high);
	printf("Test\n");
    printf("Print char %c\n", 'A');
    printf("Print string %s\n", "string");
    printf("Print int %d\n", 10);
    printf("Print hex %x\n", 15);
}
