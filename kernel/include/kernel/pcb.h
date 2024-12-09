#ifndef PCB_H
#define PCB_H

#include <kernel/paging.h>
#include <stdint.h>

#define DEFALUT_TIME_SLICE 0x50

#define USER_STACK_SIZE 1000 // number of pages
#define USER_CODE_SIZE 16 // number of pages
#define USER_STACK_ADDRESS 0xC0000000 
#define USER_CODE_ADDRESS 0x8000

enum  process_state {
    state_new,
    runnable,
    running,
    blocked
};

struct cpu_context {
    // General-purpose registers
    uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax;
    // Processor state
    uint32_t eip, eflags;
    // Segment registers
    uint32_t cs, ss, ds;
    // User-mode stack
    uint32_t useresp;
};

struct pcb_block {
    uint8_t pid;
    enum process_state state;
    struct cpu_context context;
    uint32_t process_kernel_stack;
    uint32_t time_slice;
    page_directory_t *page_directory_v; // page directory virtual adress
    uint32_t pd_phys;
    uint32_t heap_pages_count;
    uint32_t heap_last_page_address;
};

struct pcb_list_node {
    struct pcb_list_node *next;
    struct pcb_list_node *previous;
    struct pcb_block process;
};
typedef struct pcb_list_node pcb_list_node_t ;
#endif //!pcb_h

