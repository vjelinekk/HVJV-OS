#include <stdio.h>

#include <kernel/tty.h>

void kernel_main(void) {
	terminal_initialize();
	printf("Test\n");
    printf("Print char %c\n", 'A');
    printf("Print string %s\n", "string");
    printf("Print int %d\n", 10);
    printf("Print hex %x\n", 15);
}
