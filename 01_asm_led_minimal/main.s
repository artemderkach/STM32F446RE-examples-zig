// buid and flash program:
// zig build-exe main.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -TSTM32F446RETx.ld --name main.elf --verbose-link --verbose-cc --strip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program build/main.elf verify reset exit"


.thumb // select thumb instruction set
.syntax unified
.global _start

.section .text

    // Vector table
	.word    0                  // Top of the stack. Value is irrelevant for this example
	.word    _start             // Reference to main label. +1 for thumb mode

.thumb_func					    // Allows caller to have +1 in address
_start:
	// Enable GPIOA Peripheral Clock (bit 1 in AHB1ENR register)
	ldr r6, = 0x40023830        // Load peripheral clock reg address to r6
	ldr r5, [r6]                // Read its content to r5
	orr r5, 0x00000001          // Set bit 1 to enable GPIOA clock
	str r5, [r6]                // Store result in peripheral clock register

	// Make GPIOA Pin5 as output pin (bits 11:10 in MODER register)
	ldr r6, = 0x40020000        // Load GPIOA MODER register address to r6
	ldr r5, [r6]                // Read its content to r5
	and r5, 0xFFFFF3FF          // Clear bits 10, 11 for P5
	orr r5, 0x00000400          // Write 01 to bits 10, 11 for P5
	str r5, [r6]                // Store result in GPIOA MODER register

	// Set GPIOA Pin5 to 1 (bit 5 in ODR register)
	ldr r6, = 0x40020014        // Load GPIOA output data register
	ldr r5, [r6]                // Read its content to r5
	orr r5, 0x0020              // write 1 to pin 5
	str r5, [r6]                // Store result in GPIOA output data register

