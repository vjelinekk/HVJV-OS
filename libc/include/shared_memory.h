#ifndef SHARED_MEMORY_H
#define SHARED_MEMORY_H

struct shared_memory {
    int is_written;
    char data[100];
};
typedef struct shared_memory shared_memory_t;

void *get_shared_memory();

#endif // !SHARED_MEMORY_H
