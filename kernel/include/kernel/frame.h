#ifndef FRAME_H
#define FRAME_H

#include <stdint.h>

#define FRAME_SIZE 4096
#define FREE 0
#define USED 1

void init_frames(uint32_t total_memory_size);
uint32_t frame_alloc();
void frame_free(void *frame);

void frame_set(uint32_t frame_number);
void frame_clear(uint32_t frame_number);

void print_frame_bitmap();

#endif // !FRAME_H 
