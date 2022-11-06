// Vector table
.section  .text.vector, "a"

	.word    0    // Top of the stack. from linker script
	.word    _start +1    // ref to main function. +1 for thumb mode
