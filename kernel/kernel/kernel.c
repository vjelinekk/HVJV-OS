#include <stdio.h>

#include <kernel/tty.h>

#include <kernel/gdt.h>

void kernel_main(void) {
    init_gdt();
	terminal_initialize();
    struct gdt_ptr ptr = get_gdtp();
    printf("GDT base: %x\n", ptr.base);
    printf("GDT limit: %x\n", ptr.limit);
    struct gdt_entry entry = get_gdt(1);
    printf("GDT entry 1 base: %x\n", entry.base_low);
    printf("GDT entry 1 limit: %x\n", entry.limit_low);
	printf("Test\n");
    printf("Print char %c\n", 'A');
    printf("Print string %s\n", "string");
    printf("Print int %d\n", 10);
    printf("Print hex %x\n", 15);
}
