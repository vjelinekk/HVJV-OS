#include <shared_memory.h>
#include <stdio.h>

int main() {
    shared_memory_t *shared_memory = (shared_memory_t *)get_shared_memory();

    while (1) {
        if (shared_memory->is_written == 1) {
            printf("Data read from shared memory: ");
            printf("%s\n", shared_memory->data);
            shared_memory->is_written = 0;
        }
    }

    return 0;
}
