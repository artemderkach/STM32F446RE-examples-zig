// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const regs = @import("registers.zig");

pub export fn _start() void {
    // Enable clock access
    regs.RCC.AHB1ENR |= 0x1;

    // set PA5 as output pin
    regs.GPIOA.MODER.MODER1 |= (1 << 2);           // 10 pin to 1
    regs.GPIOA.MODER.MODER1 &= ~@as(u8, 1 << 3);  // 11 pin to 0
    
    // write 1 to pin5 to turn on the LED
    regs.GPIOA.ODR |= (1 << 5);
}
