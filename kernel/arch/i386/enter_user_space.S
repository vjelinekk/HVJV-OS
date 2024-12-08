.code32
.section .text
.global jump_usermode

jump_usermode:
    movw $((4 * 8) | 3), %ax    # ring 3 data selector
    movw %ax, %ds               # set data segment
    movw %ax, %es               # set extra segment
    movw %ax, %fs               # set FS segment
    movw %ax, %gs               # set GS segment

    # Set up the stack frame for iret
    pushl $((4 * 8) | 3)        # push data selector (ring 3)
    pushl $(0x60000000)                  # push current ESP
    pushfl                      # push EFLAGS
    pushl $((3 * 8) | 3)        # push code selector (ring 3)
    pushl $(0x8000)   # push instruction pointer for user function
    iret
