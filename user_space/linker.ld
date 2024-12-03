ENTRY(_start)

MEMORY
{
    main : ORIGIN = 0x8000, LENGTH = 0x10000
}

SECTIONS
{
    .text :
	{
		*(.text*)
	} > main

	.rodata :
    {
		*(.rodata*)
	} > main
	
	.data :
    {
        data = .;
		_data = .;
		__data = .;
        *(.data)
    } > main
	
    .bss :
	{
        __bss_start = .;

		*(.bss*)
		*(COMMON)

        __bss_end = .;
	} > main
}
