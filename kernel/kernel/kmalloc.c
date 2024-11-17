#include <kernel/kmalloc.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

uint32_t placement_address = (uint32_t)&kernel_end;

uint32_t kmalloc_impl(uint32_t size, int align, uint32_t *phys) {
    if (align == 1 && (placement_address & 0xFFFFF000)) {
        placement_address &= 0xFFFFF000;
        placement_address += 0x1000;
    }

    if (phys) {
        *phys = placement_address;
    }

    uint32_t addr = placement_address;
    placement_address += size;
    return addr;
}

uint32_t kmalloc(uint32_t size) {
    placement_address += size;
    return kmalloc_impl(size, 0, NULL);
}

uint32_t kmalloc_a(uint32_t size) {
    return kmalloc_impl(size, 1, NULL);
}

uint32_t kmalloc_get_last_address() {
    return placement_address;
}
