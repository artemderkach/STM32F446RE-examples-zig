// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const std = @import("std");

extern var _heap_start: u32;
extern var _heap_end: u32;

const types = @import("mmio").types;
const periph = @import("mmio").devices.STM32F446.peripherals;
const protobuf = @import("protobuf");
const schema = @import("schema.pb.zig");

const Error = error{};
const freq: u32 = 16000000;
const baud: u32 = 115200;

pub export fn _start() void {
    const base: [*]u8 = @ptrFromInt(_heap_start);
    const heap = base[0 .. _heap_end - _heap_start];

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

    // except writer function, method require context and error
    // for both of them use dummy values
    // const writer = std.io.Writer(void, Error, write);

    // const bytes = "Hello World!\n";

    const req = schema.SearchRequest{
        .page_number = 1111,
        .query = protobuf.ManagedString{.Const = "qq"},
        .results_per_page = 4,
    };
    const bytes = protobuf.pb_encode(req, allocator) catch unreachable;
    

    while (true) {
        // writer.write
        // writer.print(undefined, &bytes, .{}) catch unreachable;
        for (bytes) |byte| {
            // wait when transmissino is ready
            while (periph.USART2.SR.read().TXE == 0) {}
            periph.USART2.DR.modify(.{ .DR = byte });
        }
        
        var count: u32 = 1_000_000;
        while (count > 0) : (count -= 1) {
            @import("std").mem.doNotOptimizeAway(count);
        }

        // allocator.free();
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
    }
    return bytes.len;
}
