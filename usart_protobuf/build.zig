const std = @import("std");
const protobuf = @import("protobuf");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    // const optimize = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "main",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = .Debug,
    });

    const serial = b.dependency("serial", .{}).module("serial");
    exe.root_module.addImport("serial", serial);

    const protobuf_dep = b.dependency("protobuf", .{});
    exe.root_module.addImport("protobuf", protobuf_dep.module("protobuf"));

    // add 'cobs' as module
    const cobs_mod = b.addModule("cobs", .{
        .root_source_file = b.path("../libs/cobs.zig"),
    });
    exe.root_module.addImport("cobs", cobs_mod);

    // add protobuf generation commmand
    const gen_proto = b.step("gen-proto", "generates zig files from protocol buffer definitions");
    const protoc_step = protobuf.RunProtocStep.create(b, protobuf_dep.builder, target, .{
        // out directory for the generated zig files
        .destination_directory = b.path("."),
        .source_files = &.{
            "../protobuf/simple/simple.proto",
        },
        .include_directories = &.{"../protobuf/simple"},
    });

    gen_proto.dependOn(&protoc_step.step);

    b.installArtifact(exe);
}
