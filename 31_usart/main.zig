// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const std = @import("std");

const regs = @import("registers.zig");

const freq: u32 = 16000000;
const baud: u32 = 115200;

pub export fn _start() void {
    // Enable clock access
    regs.RCC.AHB1ENR |= 0x1;

    // PA2 Alternate function mode ([5:4] bit is [1:0])
    regs.GPIOA.MODER &= ~@as(u32, 1 << 4); // 4-th bit
    regs.GPIOA.MODER |=  (1 << 5); // 5-th bit

    // Select alternate function AF7 (0111) for USART2
    regs.GPIOA.AFR0 |=  (0x1 << 8);
    regs.GPIOA.AFR0 |=  (0x2 << 8);
    regs.GPIOA.AFR0 |=  (0x4 << 8);
    regs.GPIOA.AFR0 &= ~@as(u32, 0x8 << 8);


    // UART
    // Enable clock access
    regs.RCC.APB1ENR |= (0x1 << 17);

    // Configure baud rate
    regs.USART2.BRR = ((freq + (baud/2))/baud);

    // Configure transfer direction
    regs.USART2.CR1 = (0x1 << 3);

    // Enable UART module
    regs.USART2.CR1 |= (0x1 << 13);


    while (true) {
        while((regs.USART2.SR & @as(u32, 0x1 << 7)) < 0x1) {}
        regs.USART2.DR	= ('n' & 0xFF);
    }
}
