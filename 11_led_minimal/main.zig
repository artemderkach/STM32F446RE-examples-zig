// buid and flash program:
// zig build-exe main.zig startup_stm32f446xx.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -TSTM32F446RETx.ld --name main.elf --verbose-link --verbose-cc --strip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

pub export fn _start() void {
    // Enable clock access
    @intToPtr(*volatile u32, 0x40023830).* |= 0x1;

    // set PA5 as output pin
    @intToPtr(*volatile u32, 0x40020000).* |=  (1<<10); // 10 pin to 1
    @intToPtr(*volatile u32, 0x40020000).* &= ~@as(u32, 1<<11); // 11 pin to 0

    // write 1 to pin5 to turn on the LED
    @intToPtr(*volatile u32, 0x40020014).* |= (1<<5);
}