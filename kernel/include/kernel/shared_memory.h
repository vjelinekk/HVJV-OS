#ifndef SHARED_MEMORY_H
#define SHARED_MEMORY_H

#include <kernel/pcb.h>

#define SHARED_MEMORY_ADDR 0x4000

struct shared_memory {
    int is_written;
    char data[100];
};
typedef struct shared_memory shared_memory_t;
    

int allocate_shared_memory_for_process(pcb_list_node_t *process);


#endif // !SHARED_MEMORY_H
