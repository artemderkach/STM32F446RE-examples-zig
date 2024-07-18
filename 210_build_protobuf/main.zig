const std = @import("std");

const types = @import("mmio").types;
const periph = @import("mmio").devices.STM32F446.peripherals;
const protobuf = @import("protobuf");
const schema = @import("simple.pb.zig");
const cobs = @import("cobs");

extern var _heap_start: anyopaque;
extern var _heap_size: anyopaque;

const Error = error{};
const freq: u32 = 16000000;
const baud: u32 = 115200;

pub export fn _start() void {
    const heap_start = @intFromPtr(&_heap_start);
    const heap_size = @intFromPtr(&_heap_size);

    const base: [*]u8 = @ptrFromInt(heap_start);
    const heap = base[0..heap_size];

    var fba = std.heap.FixedBufferAllocator.init(heap);
    const allocator = fba.allocator();

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

    const req = schema.Request{
        .number = 5,
    };

    const bytes = protobuf.pb_encode(req, allocator) catch unreachable;
    var b: [256]u8 = undefined;
    const res = cobs.encode_len(bytes, &b) catch unreachable;

    while (true) {
        for (res) |byte| {
            // wait when transmissino is ready
            while (periph.USART2.SR.read().TXE == 0) {}
            periph.USART2.DR.modify(.{ .DR = byte });
        }

        // reset allocated memory
        fba.reset();

        var count: u32 = 1_000_000;
        while (count > 0) : (count -= 1) {
            @import("std").mem.doNotOptimizeAway(count);
        }
    }
}
