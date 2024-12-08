#include <kernel/file_system.h>
#include <kernel/scheduler.h>
#include <kernel/tty.h>
#include <kernel/syscall.h>
#include <stdint.h>
#include <stdio.h>

int syscall_printf(const char* data, uint32_t length) {
    if (!data || length <= 0) {
        return -1;
    }

    for (uint32_t i = 0; i < length; i++) {
        char c = data[i];
        terminal_write(&c, sizeof(c));
    }

    return length;
}

int syscall_exit(int return_code) {
    process_exit();
    return 0;
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

int syscall_dispatcher(syscall_regs_t regs) {
    switch (regs.eax) {
        case 0:
            return syscall_printf((const char*) regs.ebx, regs.ecx);
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
        default:
            printf("Unknown syscall\n");
            break;
    }

    return -1;
}
