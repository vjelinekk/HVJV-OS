#ifndef FRAME_H
#define FRAME_H

#include <stdint.h>

#define FRAME_SIZE 4096
#define FREE 0
#define USED 1
#define KERNEL_RESERVED_FRAMES (5 * 1024 * 1024) / FRAME_SIZE

void frame_init_allocator(uint32_t total_memory_size);
uint32_t frame_alloc();
void frame_free(uint32_t frame);

void frame_set(uint32_t frame_number);
void frame_clear(uint32_t frame_number);

void frame_print_used_frames();

#endif // !FRAME_H 
