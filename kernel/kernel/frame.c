#include <kernel/frame.h>
#include <kernel/kmalloc.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

uint8_t *frame_bitmap;
uint32_t total_frames;

void init_frames(uint32_t total_memory_size) {
    uint32_t frame_count = total_memory_size / FRAME_SIZE;

    // Align frame count to 8 bytes
    if (frame_count % 8 != 0) {
        frame_count += 8 - (frame_count % 8);
    }
    total_frames = frame_count;

    uint32_t bitmap_size = frame_count / 8;
    frame_bitmap = (uint8_t *)kmalloc(bitmap_size);

    memset(frame_bitmap, FREE, bitmap_size);
}

void print_frame_bitmap() {
    for (uint32_t i = 0; i < total_frames / 8; i++) {
        printf("%b ", frame_bitmap[i]);
    }
    printf("\n");
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

    return NULL;
}

