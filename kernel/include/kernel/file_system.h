#ifndef FILE_SYSTEM_H
#define FILE_SYSTEM_H

#include <stdint.h>

#define MAX_FILE_NAME 20
#define MAX_FILE_SIZE 1024
#define MAX_FILE_COUNT 50

struct file_descriptor {
    char name[MAX_FILE_NAME];
    uint8_t *data;
    uint32_t size;
    uint8_t used;
} __attribute__((packed));
typedef struct file_descriptor file_descriptor_t;

struct directory {
    file_descriptor_t files[MAX_FILE_COUNT];
} __attribute__((packed));
typedef struct directory directory_t;

void fs_init();
int fs_create_file(const char *name);
int fs_write_file(int fd, const uint8_t *data, uint32_t size);
int fs_read_file(int fd, uint8_t *buffer, uint32_t size);
int fs_delete_file(int fd);

void fs_print();

#endif // !FILE_SYSTEM_H
