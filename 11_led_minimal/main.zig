pub export fn _start() void {
    // Enable clock access
    @intToPtr(*volatile u32, 0x40023830).* |= 0x1;

    // set PA5 as output pin
    @intToPtr(*volatile u32, 0x40020000).* |=  (1<<10); // 10 pin to 1
    @intToPtr(*volatile u32, 0x40020000).* &= ~@as(u32, 1<<11); // 11 pin to 0

    // write 1 to pin5 to turn on the LED
    @intToPtr(*volatile u32, 0x40020014).* |= (1<<5);
}