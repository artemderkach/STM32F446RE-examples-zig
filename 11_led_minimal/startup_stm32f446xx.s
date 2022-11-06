// Vector table
.section  .isr_vector, "a"

	.word    0    // Top of the stack. from linker script
	.word    _start    // ref to main function. +1 for thumb mode
