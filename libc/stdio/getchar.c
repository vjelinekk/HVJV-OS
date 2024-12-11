#include <stdio.h>
#include <file.h>

static int i = 0;

char getchar() {
    char buffer[MAX_FILE_SIZE];
    while (fread(0, buffer, MAX_FILE_SIZE) < 0 || buffer[i] == 0) {
        // Wait for input
    }

    if (i == MAX_FILE_SIZE - 1) {
        i = 0;
    }

    return buffer[i++];
}
