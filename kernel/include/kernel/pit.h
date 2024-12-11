#ifndef PIT_H
#define PIT_H

#include <stdint.h>

#define PIT_NATURAL_FREQ 1193180

#define PIT_DATA0 0x40
#define PIT_DATA1 0x41
#define PIT_DATA2 0x42
#define PIT_COMMAND 0x43

/**
 * Initialize the PIT
 * 
 * @param frequency The frequency in Hz
 */
void init_timer(uint32_t frequency); //frequency in Hz

#endif // !PIT_H
