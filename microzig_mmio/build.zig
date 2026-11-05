const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("microzig", .{
        .root_source_file = b.path("microzig.zig"),
        .target = target,
        .optimize = optimize,
    });
}
