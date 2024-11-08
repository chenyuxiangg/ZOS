OUTPUT_ARCH("riscv")
OUTPUT_FORMAT("elf32-littleriscv")
ENTRY(_start)

MIN_STACK_SIZE = 0x800;

MEMORY
{
	ITCM : ORIGIN = 0x80000000, LENGTH = 64M
	DTCM : ORIGIN = 0x84000000, LENGTH = 64M
}

SECTIONS
{
	.text : {
		KEEP(*(.text.start))
		*(.text .text.*)
	} > ITCM

	.rodata ALIGN(0x20) : {
		*(.rodata .rodata.*)
	} > ITCM

	.data ALIGN(0x20) : {
		_data_start = .;
		*(.data .sdata .comment)
		_data_end = .;
	} > DTCM

	.rela ALIGN(0x20) : {
		*(.rela .rela.*)
	} > ITCM

	. = ALIGN(0x20);
	.bss (NOLOAD) : {
		__system_bss_start = .;
		*(.bss .bss.*, .sbss)
		__system_bss_end = .;
	} > DTCM

	/DISCARD/ : {
		*(.riscv .riscv.* .note.*)
	}
	 
	. = ALIGN(0x20);
	__system_stack_top = . + MIN_STACK_SIZE;
	_end = . ;
}
