#include <shared_memory.h>
#include <stdio.h>
#include <string.h>

static unsigned int seed = 1;

int rand() {
    // Linear Congruential Generator constants
    seed = (1664525 * seed + 1013904223) % 0xFFFFFFFF;
    return (seed & 0x7FFFFFFF); // Return a positive random number
}

int random_range(int min, int max) {
    return min + (rand() % (max - min + 1));
}

int main() {
    shared_memory_t *shared_memory = (shared_memory_t *)get_shared_memory();
    static int runs = 0;

    while (1) {
        if (shared_memory->is_written == 0) {
            int rand_numbers[10];
            for (int i = 0; i < 10; i++) {
                rand_numbers[i] = random_range(0, 100);
            }
            memcpy(shared_memory->data, rand_numbers, sizeof(rand_numbers));
            printf("10 random numbers written shared memory\n");
            shared_memory->is_written = 1;
            runs++;
        }
        if (runs == 3) {
            runs = 0;
            break;
        }
    }


    return 0;
}
