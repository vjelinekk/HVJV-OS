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
/**
 * Create a file with the given name
 * 
 * @param name The name of the file
 * @return The file descriptor of the created file
 */
int fs_create_file(const char *name);

/**
 * Write data to the file
 * 
 * @param fd The file descriptor of the file
 * @param data The data to write
 * @param size The size of the data
 * @return The number of bytes written
 */
int fs_write_file(int fd, const uint8_t *data, uint32_t size);

/**
 * Append data to the file
 * 
 * @param fd The file descriptor of the file
 * @param data The data to append
 * @param size The size of the data
 * @return The number of bytes appended
 */
int fs_append(int fd, const uint8_t *data, uint32_t size);

/**
 * Read data from the file
 * 
 * @param fd The file descriptor of the file
 * @param buffer The buffer to read the data into
 * @param size The size of the buffer
 * @return The number of bytes read
 */
int fs_read_file(int fd, uint8_t *buffer, uint32_t size);

/**
 * Find a file by name
 * 
 * @param name The name of the file
 * @return The file descriptor of the file
 */
int fs_find_file(const char *name);

/**
 * Delete a file by file descriptor
 * 
 * @param fd The file descriptor of the file
 * @return 0 if successful, -1 otherwise
 */
int fs_delete_file(int fd);

/**
 * Print the file system
 */
void fs_print();

#endif // !FILE_SYSTEM_H
