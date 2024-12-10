#include <shared_memory.h>
#include <stdio.h>

int main() {
    shared_memory_t *shared_memory = (shared_memory_t *)get_shared_memory();

    while (1) {
        if (shared_memory->is_written == 1) {
            printf("Data read from shared memory: ");
            int *data = (int *)shared_memory->data;
            for (int i = 0; i < 10; i++) {
                printf("%d ", data[i]);
            }
            printf("\n");
            shared_memory->is_written = 0;
        }
    }

    return 0;
}
