#ifndef FRAME_H
#define FRAME_H

#include <stdint.h>

#define FRAME_SIZE 4096
#define FREE 0
#define USED 1
#define KERNEL_RESERVED_FRAMES (5 * 1024 * 1024) / FRAME_SIZE

/**
 * Initialize the frame allocator
 * 
 * @param total_memory_size The total memory size in bytes
 */
void frame_init_allocator(uint32_t total_memory_size);

/**
 * Allocate a frame
 * 
 * @return The frame number
 */
uint32_t frame_alloc();

/**
 * Free a frame
 * 
 * @param frame The frame number
 */
void frame_free(uint32_t frame);

/**
 * Set the status of a frame
 * 
 * @param frame_number The frame number
 */
void frame_set(uint32_t frame_number);

/**
 * Clear the status of a frame
 * 
 * @param frame_number The frame number
 */
void frame_clear(uint32_t frame_number);

/**
 * Print the number of used frames
 */
void frame_print_used_frames();

#endif // !FRAME_H 
