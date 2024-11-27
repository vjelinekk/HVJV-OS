#include <kernel/kmalloc_early.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

uint32_t placement_address = (uint32_t)&_kernel_end;
uint8_t enabled = 1;

uint32_t kmalloc_early_impl(uint32_t size, int align, uint32_t *phys) {
    if (!enabled) {
        printf("kmalloc_early is disabled\n");
        return 0;
    }

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

uint32_t kmalloc_early(uint32_t size) {
    placement_address += size;
    return kmalloc_early_impl(size, 0, NULL);
}

uint32_t kmalloc_early_a(uint32_t size) {
    return kmalloc_early_impl(size, 1, NULL);
}

void kmalloc_early_disable() {
    enabled = 0;
}

uint32_t kmalloc_early_get_last_address() {
    return placement_address;
}
