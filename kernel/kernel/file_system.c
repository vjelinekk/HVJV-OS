#include <kernel/kheap.h>
#include <kernel/file_system.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

directory_t *root_directory;

void fs_init() {
    root_directory = kmalloc(sizeof(directory_t));
    for (uint32_t i = 0; i < MAX_FILE_COUNT; i++) {
        root_directory->files[i].used = 0;
    }
}

int fs_create_file(const char *name) {
    for (uint32_t i = 0; i < MAX_FILE_COUNT; i++) {
        if (!root_directory->files[i].used) {
            root_directory->files[i].used = 1;
            strcpy(root_directory->files[i].name, name);
            root_directory->files[i].data = NULL;
            root_directory->files[i].size = 0;
            return i; // Return the file descriptor
        }
    }
    return -1;
}

int fs_write_file(int fd, const uint8_t *data, uint32_t size) {
    if (fd < 0 || fd >= MAX_FILE_COUNT) {
        return -1;
    }

    if (!root_directory->files[fd].used) {
        return -1;
    }

    if (size > MAX_FILE_SIZE) {
        return -1;
    }

    root_directory->files[fd].data = kmalloc(size);
    memcpy(root_directory->files[fd].data, data, size);
    root_directory->files[fd].size = size;

    return 0;
}

int fs_append(int fd, const uint8_t *data, uint32_t size) {
    if (fd < 0 || fd >= MAX_FILE_COUNT) {
        return -1;
    }

    if (!root_directory->files[fd].used) {
        return -1;
    }

    if (size + root_directory->files[fd].size > MAX_FILE_SIZE) {
        return -1;
    }

    uint8_t *new_data = kmalloc(size + root_directory->files[fd].size);
    memcpy(new_data, root_directory->files[fd].data, root_directory->files[fd].size);
    memcpy(new_data + root_directory->files[fd].size, data, size);

    kfree(root_directory->files[fd].data);
    root_directory->files[fd].data = new_data;
    root_directory->files[fd].size += size;

    return 0;
}

int fs_read_file(int fd, uint8_t *buffer, uint32_t size) {
    if (fd < 0 || fd >= MAX_FILE_COUNT) {
        return -1;
    }

    if (!root_directory->files[fd].used) {
        return -1;
    }

    if (root_directory->files[fd].data == NULL) {
        return -1;
    }

    if (size > MAX_FILE_SIZE) {
        return -1;
    }

    memcpy(buffer, root_directory->files[fd].data, size);

    return size;
}

int fs_find_file(const char *name) {
    for (uint32_t i = 0; i < MAX_FILE_COUNT; i++) {
        if (root_directory->files[i].used && strcmp(root_directory->files[i].name, name) == 0) {
            return i;
        }
    }

    return -1;
}

int fs_delete_file(int fd) {
    if (fd < 0 || fd >= MAX_FILE_COUNT) {
        return -1;
    }

    if (!root_directory->files[fd].used) {
        return -1;
    }

    kfree(root_directory->files[fd].data);
    root_directory->files[fd].data = NULL;
    root_directory->files[fd].used = 0;

    return 0;
}

void fs_print() {
    for (uint32_t i = 0; i < MAX_FILE_COUNT; i++) {
        if (root_directory->files[i].used) {
            printf("File: %s\n", root_directory->files[i].name);
        }
    }
}
