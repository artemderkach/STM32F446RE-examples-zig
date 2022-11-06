MEMORY {
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K  /* 0x0808.0000 */
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

/* This sections are not required for current program
   removed for cleaner output of 'objdump' */
SECTIONS {
	/DISCARD/ : {
		*(.comment)
		*(.symtab)
		*(.strtab)
		*(.ARM.attributes)
	}
}

/* exidx section require to handle unwinding the stack when exception occurs.
   -fno-unwind-tables flag is needed to handle removing this table.
   even if '-fno-unwind-tables' technically is available in zig binary,
   build-exe does not pass it to the llvm linker. */
SECTIONS {
	/DISCARD/ : { *(.ARM.exidx) }
}

