.global _start

_start:
    # Call main(argc, argv)
    call main

    # Capture return value from main in %eax and call exit
    # movl %eax, %ebx       # Return value of main is exit code
    # movl $1, %eax         # System call number for exit (example)
    # int $0x80             # Software interrupt to invoke kernel
