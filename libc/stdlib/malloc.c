#include <stdint.h>
#include <limits.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

uint32_t allocated_pages = 0;
// last address of the heap
uint32_t heap_end = 0;
uint32_t heap_allocated_size = 0;
block_t *first_block = NULL;
block_t *last_block = NULL;

static bool print(const char* data, size_t length) {
    int result;
    asm volatile (
        "movl $0, %%eax\n"    // Syscall number for write (0)
        "movl %1, %%ebx\n"    // Argument 1: pointer to message
        "movl %2, %%ecx\n"    // Argument 2: length of message
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Return value in eax
        : "=r"(result)        // Output
        : "r"(data), "r"(length) // Inputs
        : "eax", "ebx", "ecx" // Clobbered registers
    );
    if (result < 0)
        return false;
    return true;
}

static int printf(const char* restrict format, ...) {
    va_list parameters;
	va_start(parameters, format);

	int written = 0;

	while (*format != '\0') {
		size_t maxrem = INT_MAX - written;

		if (format[0] != '%' || format[1] == '%') {
			if (format[0] == '%')
				format++;
			size_t amount = 1;
			while (format[amount] && format[amount] != '%')
				amount++;
			if (maxrem < amount) {
				// TODO: Set errno to EOVERFLOW.
				return -1;
			}
			if (!print(format, amount))
				return -1;
			format += amount;
			written += amount;
			continue;
		}

		const char* format_begun_at = format++;

		if (*format == 'c') {
			format++;
			char c = (char) va_arg(parameters, int /* char promotes to int */);
			if (!maxrem) {
				// TODO: Set errno to EOVERFLOW.
				return -1;
			}
			if (!print(&c, sizeof(c)))
				return -1;
			written++;
		} else if (*format == 's') {
			format++;
			const char* str = va_arg(parameters, const char*);
			size_t len = strlen(str);
			if (maxrem < len) {
				// TODO: Set errno to EOVERFLOW.
				return -1;
			}
			if (!print(str, len))
				return -1;
			written += len;
        } else if (*format == 'd') {
            format++;
            int i = va_arg(parameters, int);
            char str[12];
            itoa(i, str, 10, 0);
            size_t len = strlen(str);
            if (maxrem < len)
                return -1;
            if (!print(str, len))
                return -1;
            written += len;
        } else if (*format == 'u') {
            format++;
            unsigned int i = va_arg(parameters, unsigned int);
            char str[12];
            itoa(i, str, 10, 1);
            size_t len = strlen(str);
            if (maxrem < len)
                return -1;
            if (!print(str, len))
                return -1;
            written += len;
        } else if (*format == 'x') {
            format++;
            int i = va_arg(parameters, int);
            char str[12];
            itoa(i, str, 16, 0);
            size_t len = strlen(str);
            if (maxrem < len)
                return -1;
            if (!print("0x", 2))
                return -1;
            if (!print(str, len))
                return -1;
            written += len;
		} else if (*format == 'b') {
            format++;
            int i = va_arg(parameters, int);
            char str[12];
            itoa(i, str, 2, 0);
            size_t len = strlen(str);
            if (maxrem < len)
                return -1;
            if (!print("0b", 2))
                return -1;
            if (!print(str, len))
                return -1;
            written += len;
        } else if (*format == 'l') {
            format++;
            if (*format == 'x') {
                format++;
                long i = va_arg(parameters, long);
                char str[12];
                itoa(i, str, 16, 0);
                size_t len = strlen(str);
                if (maxrem < len)
                    return -1;
                if (!print("0x", 2))
                    return -1;
                if (!print(str, len))
                    return -1;
                written += len;
            } else if (*format == 'u') {
                format++;
                unsigned long i = va_arg(parameters, unsigned long);
                char str[12];
                itoa(i, str, 10, 1);
                size_t len = strlen(str);
                if (maxrem < len)
                    return -1;
                if (!print(str, len))
                    return -1;
                written += len;
            } else if (*format == 'd') {
                format++;
                long i = va_arg(parameters, long);
                char str[12];
                itoa(i, str, 10, 0);
                size_t len = strlen(str);
                if (maxrem < len)
                    return -1;
                if (!print(str, len))
                    return -1;
                written += len;
            }
        } else {
			format = format_begun_at;
			size_t len = strlen(format);
			if (maxrem < len) {
				// TODO: Set errno to EOVERFLOW.
				return -1;
			}
			if (!print(format, len))
				return -1;
			written += len;
			format += len;
		}
	}

	va_end(parameters);
	return written;
}

void alloc_pages() {
    int pages;
    asm volatile(
        "movl $8, %%eax\n"    // Syscall number for malloc
        "int $0x80\n"         // Trigger syscall
        "movl %%eax, %0\n"    // Store return value in pages
        : "=r"(pages)         // Output
    );
    allocated_pages += pages;
}

static void heap_init() {
    alloc_pages();

    memset((void *)HEAP_START, 0, allocated_pages * PAGE_SIZE);
    first_block = (block_t *)HEAP_START;
    first_block->size = allocated_pages * PAGE_SIZE - sizeof(block_t);
    first_block->next = NULL;
    first_block->prev = NULL;
    first_block->is_free = 1;

    last_block = first_block;
    heap_end = HEAP_START + (allocated_pages * PAGE_SIZE) + PAGE_SIZE;
}

static block_t *find_free_block(uint32_t size) {
    block_t *current_block = first_block;

    while (current_block != NULL) {
        if (current_block->is_free && current_block->size >= (size + sizeof(block_t))) {
            return current_block;
        }
        current_block = current_block->next;
    }

    return NULL;
}

static void split_block(block_t *block, uint32_t size) {
    block_t *new_block = (block_t *)((uint8_t *)block + sizeof(block_t) + size);
    new_block->size = block->size - size - sizeof(block_t);
    new_block->next = block->next;
    new_block->prev = block;
    new_block->is_free = 1;

    if (!new_block->next) {
        last_block = new_block;
    }

    block->size = size + sizeof(block_t);
    block->next = new_block;
}

void print_heap() {
    block_t *current_block = first_block;
    while (current_block != NULL) {
        printf("Link: %x, size: %d, is_free: %d\n", current_block, current_block->size, current_block->is_free);
        current_block = current_block->next;
    }
}

void *malloc(uint32_t size) {
    if (size <= 0) {
        return NULL;
    }

    if (allocated_pages == 0) {
        heap_init();
    }

    block_t *free_block = find_free_block(size);
    if (free_block == NULL) {
        // Here we should expand the heap
        return NULL;
    }

    if (free_block->size > size + sizeof(block_t)) {
        split_block(free_block, size);
    }
    free_block->is_free = 0;

    heap_allocated_size += free_block->size;
    
    return (void *)((uint8_t *)free_block + sizeof(block_t));
}
