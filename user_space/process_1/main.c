#include <stdio.h>
#include <file.h>
#include <process.h>

int main() {
    int fd = fopen("file.txt");
    printf("Process 1 opened file.txt with fd %d\n", fd);
    int write = fwrite(fd, "Hello in file.txt", 17);
    printf("Process 1 wrote %d bytes\n", write);
    char buffer[17];
    int read = fread(fd, buffer, 17);
    printf("Process 1 read %d bytes: %s\n", read, buffer);
    int pid = getpid();
    printf("Process 1 PID: %d\n", pid);
    return 0;
}
