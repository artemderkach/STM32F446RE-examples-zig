const std = @import("std");
const serial = @import("serial");
const protobuf = @import("protobuf");
const schema = @import("simple.pb.zig");
const cobs = @import("cobs");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var port = try std.fs.cwd().openFile("/dev/ttyACM0", .{ .mode = .read_write });
    defer port.close();

    try serial.configureSerialPort(port, serial.SerialConfig{
        .baud_rate = 115200,
        .word_size = .seven,
        .parity = .none,
        .stop_bits = .one,
        .handshake = .none,
    });
    var buf: [256]u8 = undefined;
    const reader = port.reader().any();

    while (true) {
        const bytes = cobs.decode_len(reader, &buf) catch &.{};
        std.debug.print("--> {any}\n", .{bytes});
        _ = protobuf.pb_decode(schema.Request, bytes, allocator) catch &.{};
    }
}
