// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const types = @import("mmio").types;
const periph = @import("mmio").devices.STM32F446.peripherals;

pub export fn _start() void {
    // Enable clock access
    periph.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });

    // set PA5 as output
    periph.GPIOA.MODER.modify(.{ .MODER5 = 0b01 });

    // write 1 to port5 to turn on the LED
    periph.GPIOA.ODR.modify(.{ .ODR5 = 0b1 });

    var count: u32 = undefined;
    while (true) {
        count = 500_000;
        while (count > 0) : (count -= 1) {
            // prevent loop from compiler optimazation
            @import("std").mem.doNotOptimizeAway(count);
        }
        periph.GPIOA.ODR.toggle(.{.ODR5});
    }
}
