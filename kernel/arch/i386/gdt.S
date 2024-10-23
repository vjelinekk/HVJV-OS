.section .data
    # Define the GDT pointer structure
    gdtp:
        .word gdt_end - gdt - 1    # Limit
        .long gdt                   # Base address of the GDT

    # Define the GDT with three segments
    gdt:
        # Null descriptor
        .word 0                     # Limit (low)
        .word 0                     # Base (low)
        .byte 0                     # Base (mid)
        .byte 0x9A                  # Access byte: present, privilege level, type
        .byte 0xCF                  # Granularity: limit high, size, granularity
        .byte 0                     # Base (high)

        # Code segment descriptor
        .word 0xFFFF                # Limit (low)
        .word 0                     # Base (low)
        .byte 0                     # Base (mid)
        .byte 0x9A                  # Access byte: present, privilege level, type
        .byte 0xCF                  # Granularity: limit high, size, granularity
        .byte 0                     # Base (high)

        # Data segment descriptor
        .word 0xFFFF                # Limit (low)
        .word 0                     # Base (low)
        .byte 0                     # Base (mid)
        .byte 0x92                  # Access byte: present, privilege level, type
        .byte 0xCF                  # Granularity: limit high, size, granularity
        .byte 0                     # Base (high)

    gdt_end:

.section .text
.global setGdt

setGdt:
    # Load the GDT
    lgdt gdtp                    # Load the GDT pointer
    ret

