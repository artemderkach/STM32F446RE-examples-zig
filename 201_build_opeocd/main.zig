pub export fn _start() void {
    // Enable clock access
    (@as(*volatile u32, @ptrFromInt(0x40023830))).* |= 0x1;

    // set PA5 as output pin
    (@as(*volatile u32, @ptrFromInt(0x40020000))).* |=  (1<<10); // 10 pin to 1
    (@as(*volatile u32, @ptrFromInt(0x40020000))).* &= ~@as(u32, 1<<11); // 11 pin to 0

    // write 1 to pin5 to turn on the LED
    (@as(*volatile u32, @ptrFromInt(0x40020014))).* |= (1<<5);

    var count: u32 = undefined;
    while (true) {
        count = 500_000;
        while (count > 0) : (count -= 1) {
            // prevent loop from compiler optimazation
            @import("std").mem.doNotOptimizeAway(count);
        }
        // toggle LED
        (@as(*volatile u32, @ptrFromInt(0x40020014))).* ^= (1<<5);
    }
}