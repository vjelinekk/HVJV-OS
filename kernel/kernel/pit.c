#include <kernel/pic.h>
#include <kernel/pit.h>
#include <kernel/isr.h>
#include <kernel/port.h>
#include <kernel/scheduler.h>

void init_timer(uint32_t frequency) {
    uint32_t divisor;
    if(frequency)
        divisor = PIT_NATURAL_FREQ / frequency;
    else
        divisor = 0;
    /*
      http://wiki.osdev.org/Programmable_Interval_Timer#I.2FO_Ports

      Channel  Access Mode        Operating Mode    BCD/Binary
      0x36 == 0011 0110 == 00       11 (lobyte/hibyte) 011 (square Wave) 0 (16-bit bin

      )
    */
    outb(PIT_COMMAND, 0x36);

    //Chop freq up into bytes and send to data0 port
    uint8_t low = (uint8_t)(divisor & 0xFF);
    uint8_t high = (uint8_t)((divisor >> 8) & 0xFF);

    outb(PIT_DATA0, low);
    outb(PIT_DATA0, high);
}

void mask_timer() {
    outb(MASTER_DATA, inb(MASTER_DATA) | 0x01);
}

void unmask_timer() {
    outb(MASTER_DATA, inb(MASTER_DATA) & ~0x01);
}
