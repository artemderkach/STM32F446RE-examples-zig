// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"
const std = @import("std");

const types = @import("STM32F446.zig").types;
const periph = @import("STM32F446.zig").devices.STM32F446.peripherals;
const regs = @import("registers.zig");

const Error = error{};
const freq: u32 = 16000000;
const baud: u32 = 115200;

pub export fn _start() void {
    // Enable clock access
    periph.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });

    // PA2 Alternate function mode ([5:4] bit is [1:0])
    periph.GPIOA.MODER.modify(.{ .MODER2 = 0b10 });

    // Select alternate function AF7 (0111) for USART2
    periph.GPIOA.AFRL.modify(.{ .AFRL2 = 0b0111 });

    // UART
    // Enable clock access
    periph.RCC.APB1ENR.modify(.{ .USART2EN = 1 });

    // Configure baud rate
    const mantissa = ((freq + (baud / 2)) / baud);
    periph.USART2.BRR.write_raw(mantissa);

    // Configure transfer direction
    periph.USART2.CR1.modify(.{ .TE = 1 });

    // Enable UART module
    periph.USART2.CR1.modify(.{ .UE = 1 });

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
        while (periph.USART2.SR.read().TXE == 0) {}
        periph.USART2.DR.modify(.{ .DR = byte });
        // while((regs.USART2.SR & regs.USART_SR_TXE) != regs.USART_SR_TXE) {}
        // regs.USART2.DR = byte;
    }
    return bytes.len;
}
