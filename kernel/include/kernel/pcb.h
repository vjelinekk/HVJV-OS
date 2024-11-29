
#ifndef PCB_H

#include <stdint.h>
enum  process_state {
    new,
    runnable,
    running,
    blocked
};

struct cpu_context {
    uint32_t eax;
    uint32_t ebx;
    uint32_t ecx;
    uint32_t edx;
    uint32_t esi;
    uint32_t edi;
    uint32_t eip;
    uint32_t esp;
};

struct pcb_block {
    uint8_t pid;
    enum process_state state;
    struct cpu_context context;
    uint32_t time_slice;
};

struct pcb_list_node {
    struct pcb_list_node *next;
    struct pcb_list_node *previous;
    struct pcb_block process;
};
typedef struct pcb_list_node pcb_list_node_t ;
#endif //!PCB_H

