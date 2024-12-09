#include <shared_memory.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    // shared_memory_t *shared_memory = (shared_memory_t *)get_shared_memory();
    //
    // while (1) {
    //     if (shared_memory->is_written == 0) {
    //         char *data = "Hello from process 1";
    //         uint32_t data_length = strlen(data);
    //         memcpy(shared_memory->data, data, data_length);
    //         shared_memory->is_written = 1;
    //         printf("Data written to shared memory\n");
    //     }
    // }
    
    char *ptr = (char *)malloc(100);
    printf("Ptr %x\n", ptr);
    char *ptr2 = (char *)malloc(100);
    printf("Ptr %x\n", ptr2);
    // check if difference between ptr and ptr2 is 100
    printf("Difference %d\n", (char *)ptr2 - (char *)ptr);

    return 0;
}
