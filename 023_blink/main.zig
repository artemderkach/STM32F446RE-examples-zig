// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const regs = @import("registers.zig");

pub export fn _start() void {
    // Enable clock access
    regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOA;

    // set PA5 as output
    regs.GPIOA.MODER |=  regs.GPIO_MODER_PORT5_0;  // bit 10 to 1
    regs.GPIOA.MODER &= ~regs.GPIO_MODER_PORT5_1;  // bit 11 to 0
    
    // write 1 to port5 to turn on the LED
    regs.GPIOA.ODR |= regs.GPIO_ODR_PORT5;

    var count: u32 = undefined;
    while (true) {
        count = 500_000;
        while (count > 0) : (count -= 1) {
            // prevent loop from compiler optimazation
            @import("std").mem.doNotOptimizeAway(count);
        }
        regs.GPIOA.ODR ^= regs.GPIO_ODR_PORT5; // toggle LED
    }
}
