.code32
.section .text
.global context_switch

# void push_iret_regds(struct cpu_context regs)
.type context_switch, @function
context_switch:
    # Push registers for iret
    pushl 0x20(%esp)   # eip
    pushl 0x28(%esp)   # cs
    pushl 0x24(%esp)   # eflags

    # Push registers for popa
    pushl 0x00(%esp)   # edi
    pushl 0x04(%esp)   # esi
    pushl 0x08(%esp)   # ebp
    pushl $0           # esp placeholder
    pushl 0x10(%esp)   # ebx
    pushl 0x14(%esp)   # edx
    pushl 0x18(%esp)   # ecx
    pushl 0x1C(%esp)   # eax

    # Push the data segment register
    pushl 0x30(%esp)   # ds

