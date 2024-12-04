.code32
.section .text
.global syscall_handler
.extern syscall_dispatcher

.type syscall_handler, @function
syscall_handler:
    cli
    push %edi
    push %esi
    push %edx
    push %ecx
    push %ebx
    push %eax
    call syscall_dispatcher
    movl %eax, %ebx # Save return value
    add $24, %esp  # Clean up stack (3 registers x 4 bytes each)
    sti
    iret
