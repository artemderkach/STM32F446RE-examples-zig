MEMORY {
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K  /* 0x0808.0000 */
}

SECTIONS {
	.text : {
		KEEP(*(.text))
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