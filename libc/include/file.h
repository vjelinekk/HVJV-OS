#ifndef FILE_H
#define FILE_H

int fopen(const char *filename);
int fwrite(int fd, const char *data, int size);
int fread(int fd, char *buffer, int size);

#endif // !FILE_H
