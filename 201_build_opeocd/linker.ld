MEMORY {
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K  /* 0x0808.0000 */
	SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K  /* 0x2002.0000 */
}

SECTIONS {
	/* The startup code goes first into FLASH */
	.isr_vector : {        
		KEEP(*(.isr_vector))
	} > FLASH

	.text : {
	    *(.text)
	} > FLASH
}

_estack = ORIGIN(SRAM) + LENGTH(SRAM);

/* This sections are not required for current program
   removed for cleaner output of 'objdump' */
SECTIONS {
	/DISCARD/ : {
		*(.comment)
		*(.symtab)
		*(.strtab)
	}
}

/* exidx section require to handle unwinding the stack when exception occurs.
   -fno-unwind-tables flag is needed to handle removing this table.
   even if '-fno-unwind-tables' technically is available in zig binary,
   build-exe does not pass it to the llvm linker. */
SECTIONS {
	/DISCARD/ : { *(.ARM.exidx) }
}

