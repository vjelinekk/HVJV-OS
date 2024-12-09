#include <stdint.h>
#ifndef _STDLIB_H
#define _STDLIB_H 1

#define HEAP_START 0x00020000
#define PAGE_SIZE 0x1000

#include <sys/cdefs.h>

#ifdef __cplusplus
extern "C" {
#endif

struct block {
    uint32_t size;
    struct block *next;
    struct block *prev;
    uint8_t is_free;
};
typedef struct block block_t;

__attribute__((__noreturn__))
void abort(void);


char* itoa(long value, char* buffer, int base, int is_unsigned);
void *malloc(uint32_t size);
void free(void *ptr);

#ifdef __cplusplus
}
#endif

#endif
