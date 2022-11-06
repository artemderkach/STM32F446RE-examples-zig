MEMORY {
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K  /* 0x0808.0000 */
	/* SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K  0x2002.0000 */
}

SECTIONS {
	/* The startup code goes first into FLASH */
    .asd : {
        . = ALIGN(4);
        KEEP(*(.text.vector)) /* Startup code */
        . = ALIGN(4);
    } > FLASH

	/* .isr_vector : {
		*(.isr_vector)
	} > FLASH */

	.text : {
	    *(.text)
		. = ALIGN(4);
		*(.rodata*)  /* Read-only data */
    	. = ALIGN(4);
	} > FLASH

	/* .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } > FLASH */
}

/* _estack = ORIGIN(SRAM) + LENGTH(SRAM); */
