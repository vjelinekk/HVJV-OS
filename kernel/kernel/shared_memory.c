#include <kernel/paging.h>
#include <kernel/page_allocator.h>
#include <kernel/shared_memory.h>
#include <string.h>

static int shared_memory_initilized = 0;
static page_table_entry_t *shared_memory_page;

int allocate_shared_memory_for_process(pcb_list_node_t *process) {
    if (!shared_memory_initilized) {
        // allocate shared memory
        shared_memory_page = alloc_page(SHARED_MEMORY_ADDR, 1, process->process.page_directory_v);
        shared_memory_initilized = 1;

        shared_memory_t *shared_memory = (shared_memory_t *)SHARED_MEMORY_ADDR;
        shared_memory->is_written = 0;
        memset(shared_memory->data, 0, 100);

        return SHARED_MEMORY_ADDR;
    }

    // map shared memory
    map_page_to_directory(shared_memory_page, SHARED_MEMORY_ADDR, process->process.page_directory_v);

    return SHARED_MEMORY_ADDR;
}
