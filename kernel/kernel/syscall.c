#include <kernel/shared_memory.h>
#include <kernel/file_system.h>
#include <kernel/scheduler.h>
#include <kernel/tty.h>
#include <kernel/syscall.h>
#include <stdint.h>
#include <stdio.h>

int syscall_putchar(char c) {
    terminal_write(&c, sizeof(c));

    return 1;
}

int syscall_exit(int return_code) {
    // currently there is no usage for return_code
    process_exit();
    return 1;
}

int syscall_open(const char* filename) {
    int fd = fs_find_file(filename);
    if (fd >= 0) {
        // File found
        return fd;
    }

    // File not found so create it
    fd = fs_create_file(filename);
    if (fd >= 0) {
        return fd;
    }

    // No file found and could not be created
    return -1;
}

int syscall_read(int fd, char* buffer, uint32_t size) {
    return fs_read_file(fd, (uint8_t*)buffer, size);
}

int syscall_write(int fd, const uint8_t* buffer, uint32_t size) {
    return fs_write_file(fd, buffer, size);
}

int syscall_delete(const char* filename) {
    int fd = fs_find_file(filename);
    if (fd >= 0) {
        return fs_delete_file(fd);
    }

    return -1;
}

int syscall_get_pid() {
    return get_pid();
}

int syscall_allocate_shared_memory() {
    pcb_list_node_t *process = get_current_process();
    return allocate_shared_memory_for_process(process);
}

int syscall_start_simulation() {
    start_SM_simulation();
    return 1;
}

int syscall_dispatcher(syscall_regs_t regs) {
    // For simplicity we are using a switch statement to determine the syscall
    // This is not the most efficient way to do this in the future we will use a
    // array of function pointers to call the correct syscall
    switch (regs.eax) {
        case 0:
            return syscall_putchar(regs.ebx);
            break;
        case 1:
            return syscall_exit(regs.ebx);
            break;
        case 2:
            return syscall_open((const char*) regs.ebx);
            break;
        case 3:
            return syscall_read(regs.ebx, (char*) regs.ecx, regs.edx);
            break;
        case 4:
            return syscall_write(regs.ebx, (const uint8_t*) regs.ecx, regs.edx);
            break;
        case 5:
            return syscall_delete((const char*) regs.ebx);
            break;
        case 6:
            return syscall_get_pid();
            break;
        case 7:
            return syscall_allocate_shared_memory();
            break;
        case 8:
            return syscall_start_simulation();
            break;
        default:
            printf("Unknown syscall\n");
            break;
    }

    return -1;
}
