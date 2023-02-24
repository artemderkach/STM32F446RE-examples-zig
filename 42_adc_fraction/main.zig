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


    // Enable clock access to GPIOA
    regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOA;

    // set PA1 in analog mode [3:2] [1:1]
    regs.GPIOA.MODER |= regs.GPIO_MODER_PORT1_0;  // bit 2 to 1
    regs.GPIOA.MODER |= regs.GPIO_MODER_PORT1_1;  // bit 3 to 1
    

    // Enable clock access to ADC
    regs.RCC.APB2ENR |= regs.RCC_APB2ENR_ADC1;

    // conversion sequence start
    regs.ADC1.SQR3 |=  regs.ADC_SQR3_SQ1_0;
    regs.ADC1.SQR3 &= ~regs.ADC_SQR3_SQ1_1;
    regs.ADC1.SQR3 &= ~regs.ADC_SQR3_SQ1_2;
    regs.ADC1.SQR3 &= ~regs.ADC_SQR3_SQ1_3;

    // conversion sequence length (1 conversion)
    regs.ADC1.SQR1 |=  regs.ADC_SQR1_L_0;
    regs.ADC1.SQR1 &= ~regs.ADC_SQR1_L_1;
    regs.ADC1.SQR1 &= ~regs.ADC_SQR1_L_2;
    regs.ADC1.SQR1 &= ~regs.ADC_SQR1_L_3;

    // enable ADC module
    regs.ADC1.CR2 |= regs.ADC_CR2_ADON;

    const writer = std.io.Writer(void, Error, write);

    while (true) {

        // start conversion
        regs.ADC1.CR2 |= regs.ADC_CR2_SWSTART;

        // wait for conversion to be complete
        while ((regs.ADC1.SR & regs.ADC_SR_EOC) != regs.ADC_SR_EOC) {}

        writer.print(undefined, "value: {d}\n\r", .{regs.ADC1.DR * 1000 / 4095}) catch unreachable;

        // wailt not to spam too much
        var count: u32 = 1_000_000;
        while (count > 0) : (count -= 1) {
            @import("std").mem.doNotOptimizeAway(count);
        }
    }
}


const Error = error {};
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