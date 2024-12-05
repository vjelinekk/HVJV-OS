.code32
.section .text
.global restore_general_purpose_registers
.global switch_to_process

# Function: restore_general_purpose_registers
# Input: cpu_context passed on the stack
restore_general_purpose_registers:
    # Base of the cpu_context on the stack (esp + 4)
    mov 4(%esp), %edi       # Load edi
    mov 8(%esp), %esi       # Load esi
    mov 12(%esp), %ebp      # Load ebp
    # mov 16(%esp), %esp      # Skip loading esp directly
    mov 20(%esp), %ebx      # Load ebx
    mov 24(%esp), %edx      # Load edx
    mov 28(%esp), %ecx      # Load ecx
    mov 32(%esp), %eax      # Load eax

    # Restore segment registers
    mov 48(%esp), %ax       # Load ds
    mov %ax, %ds            # Set ds
    mov %ax, %es            # Set es
    mov %ax, %fs            # Set fs
    mov %ax, %gs            # Set gs

    ret                     # Return to caller


# Function: switch_to_process
# Input: cpu_context passed on the stack
switch_to_process:
    # Base of the cpu_context on the stack (esp + 4)
    pushl 52(%esp)          # Push SS (user data segment selector)
    pushl 56(%esp)          # Push useresp (user-mode stack pointer)
    pushl 40(%esp)          # Push EFLAGS
    pushl 44(%esp)          # Push CS (user code segment selector)
    pushl 36(%esp)          # Push EIP (instruction pointer)

    iret                    # Return to user mode


