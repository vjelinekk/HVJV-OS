#include <kernel/frame.h>
#include <kernel/kmalloc.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

uint8_t *frame_bitmap;
uint32_t total_frames;

static void mark_reserved_frames() {
    uint32_t kernel_end = kmalloc_get_last_address();
    uint32_t aligned_kernel_end = kernel_end & 0xFFFFF000;
    uint32_t kernel_end_frame = aligned_kernel_end / FRAME_SIZE;
    printf("Kernel end frame: %d\n", kernel_end_frame);

    for (uint32_t i = 0; i < kernel_end_frame; i++) {
        frame_set(i);
    }
}

void frame_init_allocator(uint32_t total_memory_size) {
    uint32_t frame_count = total_memory_size / FRAME_SIZE;
    total_frames = frame_count;
    printf("Total frames: %d\n", frame_count);

    uint32_t bitmap_size = (frame_count + 7) / 8;
    printf("Bitmap size: %d\n", bitmap_size);
    frame_bitmap = (uint8_t *)kmalloc(bitmap_size);

    memset(frame_bitmap, FREE, bitmap_size);
    // mark_reserved_frames();
}

void frame_print_used_frames() {
    uint32_t used_frames = 0;
    for (uint32_t i = 0; i < total_frames / 8; i++) {
        if ((frame_bitmap[i] & 0xFF) != 0) {
            for (uint32_t j = 0; j < 8; j++) {
                if (frame_bitmap[i] & (1 << j)) {
                    used_frames++;
                }
            }
            continue;
        }
    }
    printf("Used frames: %d\n", used_frames);
}

void frame_set(uint32_t frame_number) {
    if (frame_number >= total_frames) {
        return;
    }

    uint32_t index = frame_number / 8;
    uint32_t offset = frame_number % 8;
    frame_bitmap[index] |= (USED << offset);
}

void frame_clear(uint32_t frame_number) {
    if (frame_number >= total_frames) {
        return;
    }
    
    uint32_t index = frame_number / 8;
    uint32_t offset = frame_number % 8;
    frame_bitmap[index] &= ~(USED << offset);
}

void frame_free(void *frame) {
    if (frame == NULL) {
        return;
    }

    uint32_t frame_number = (uint32_t)frame / FRAME_SIZE;
    frame_clear(frame_number);
}

uint32_t frame_alloc() {
    for (uint32_t i = 0; i < total_frames / 8; i++) {
        if (frame_bitmap[i] != 0xFF) {
            for (uint32_t j = 0; j < 8; j++) {
                if (frame_bitmap[i] & (1 << j)) {
                    continue;
                }
                frame_set(i * 8 + j);
                return (i * 8 + j) * FRAME_SIZE;
            }
        }
    }

    printf("No free frames available\n");
    return 0xFFFFFFFF;
}

