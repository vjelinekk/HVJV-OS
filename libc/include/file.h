#ifndef FILE_H
#define FILE_H

#define MAX_FILE_SIZE 1024

/**
 * Open a file
 * 
 * @param filename The name of the file to open
 * @return The file descriptor
 */
int fopen(const char *filename);

/**
 * Write data to a file
 * 
 * @param fd The file descriptor
 * @param data The data to write
 * @param size The size of the data
 * @return The number of bytes written
 */
int fwrite(int fd, const char *data, int size);

/**
 * Read data from a file
 * 
 * @param fd The file descriptor
 * @param buffer The buffer to read into
 * @param size The size of the buffer
 * @return The number of bytes read
 */
int fread(int fd, char *buffer, int size);

#endif // !FILE_H
