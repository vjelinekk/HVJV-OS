#include <kernel/kmalloc.h>
#include <stdint.h>
#include <stdio.h>

uint32_t placement_address = (uint32_t)&kernel_end;

uint32_t kmalloc(uint32_t size) {
    printf("Allocating %d bytes at %d\n", size, placement_address);
    uint32_t addr = placement_address;
    placement_address += size;
    return addr;
}
