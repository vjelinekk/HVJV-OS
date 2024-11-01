#include <kernel/pic.h>
#include <kernel/port.h>
#include <stdio.h>

void pic_remap(void) {
    printf("Remapping the IRQ table\n");
    outb(MASTER_COMMAND, ICW1_INIT | ICW1_ICW4); // Start initialization sequence
    outb(SLAVE_COMMAND, ICW1_INIT | ICW1_ICW4);  // Start initialization sequence
    outb(MASTER_DATA, 0x20);                     // Remap to 0x20
    outb(SLAVE_DATA, 0x28);                      // Remap slave to 0x28
    outb(MASTER_DATA, 4);                        // Tell Master about slave @ IRQ 2
    outb(SLAVE_DATA, 2);                         // Tell slave PIC its cascade ID

    outb(MASTER_DATA, ICW4_8086);
    outb(SLAVE_DATA, ICW4_8086);

    uint8_t master_mask = 0xFC; // 11111100
    uint8_t slave_mask = 0xFF;  // 11111111

    outb(MASTER_DATA, master_mask);
    outb(SLAVE_DATA, slave_mask);
}
