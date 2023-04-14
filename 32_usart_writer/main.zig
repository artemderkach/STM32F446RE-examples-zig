// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const std = @import("std");

const regs = @import("registers.zig");

const freq: u32 = 16000000;
const baud: u32 = 115200;

const Error = error {};

pub export fn _start() void {
    // Enable clock access
    regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOA;

    // PA2 Alternate function mode ([5:4] bit is [1:0])
    regs.GPIOA.MODER &= ~regs.GPIO_MODER_PORT2_0; // 4-th bit
    regs.GPIOA.MODER |=  regs.GPIO_MODER_PORT2_1; // 5-th bit

    // Select alternate function AF7 (0111) for USART2
    regs.GPIOA.AFR0 |=  regs.GPIO_AFR_PORT2_0;
    regs.GPIOA.AFR0 |=  regs.GPIO_AFR_PORT2_1;
    regs.GPIOA.AFR0 |=  regs.GPIO_AFR_PORT2_2;
    regs.GPIOA.AFR0 &= ~regs.GPIO_AFR_PORT2_3;


    // UART
    // Enable clock access
    regs.RCC.APB1ENR |= regs.RCC_APB1ENR_USART2;

    // Configure baud rate
    regs.USART2.BRR = ((freq + (baud/2))/baud);

    // Configure transfer direction
    regs.USART2.CR1 = regs.USART_CR1_TE;

    // Enable UART module
    regs.USART2.CR1 |= regs.USART_CR1_UE;

    // except writer function, method require context and error
    // for both of them use dummy values
    const writer = std.io.Writer(void, Error, write);

    
    const bytes = "Hello World!\n";
    while (true) {
        writer.print(undefined, bytes, .{}) catch unreachable;

        var count: u32 = 1_000_000;
        while (count > 0) : (count -= 1) {
            @import("std").mem.doNotOptimizeAway(count);
        }
    }
}

// write function is passed to standard writer to perform sending throuh USART
// there is possibily for sending context in first argument
// in our case there is no need for this, thats why 'void' is used
fn write(_: void, bytes: []const u8) Error!usize {
    for (bytes) |byte| {
        // wait when transmissino is ready
        while((regs.USART2.SR & regs.USART_SR_TXE) != regs.USART_SR_TXE) {}
        regs.USART2.DR = byte;
    }
    return bytes.len;
}