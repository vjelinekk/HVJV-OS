#ifndef SHARED_MEMORY_H
#define SHARED_MEMORY_H

#include <kernel/pcb.h>

#define SHARED_MEMORY_ADDR 0x4000

struct shared_memory {
    int is_written;
    char data[100];
};
typedef struct shared_memory shared_memory_t;
    

/**
 * Allocate shared memory for a process
 * 
 * @param process The process to allocate shared memory for
 * @return The address of the shared memory
 */
int allocate_shared_memory_for_process(pcb_list_node_t *process);


#endif // !SHARED_MEMORY_H
