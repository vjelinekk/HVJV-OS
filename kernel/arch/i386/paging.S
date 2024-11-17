.code32

.text
.global load_page_directory
load_page_directory:
    cli
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %eax
    mov %eax, %cr3
    pop %ebp
    sti
    ret

.global enable_paging
enable_paging:
    cli
    mov %cr0, %eax
    or $0x80000000, %eax
    mov %eax, %cr0
    sti
    ret
