// openocd -f board/st_nucleo_f4.cfg -c "program zig-out/bin/main.elf verify reset exit"

const std = @import("std");
const protobuf = @import("protobuf");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_model = std.zig.CrossTarget.CpuModel{
            .explicit = &std.Target.arm.cpu.cortex_m4,
        },
    });
    const optimize = std.builtin.Mode.ReleaseSafe;

    const exe = b.addExecutable(.{
        .name = "main.elf",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
        // .strip = true,
    });

    exe.addAssemblyFile(b.path("startup.s"));
    exe.setLinkerScript(b.path("linker.ld"));
    // exe.bundle_compiler_rt = false;

    // add 'mmio' as module
    const mmio_mod = b.addModule("mmio", .{
        .root_source_file = b.path("../STM32F446.zig"),
    });
    exe.root_module.addImport("mmio", mmio_mod);

    // add 'cobs' as module
    const cobs_mod = b.addModule("cobs", .{
        .root_source_file = b.path("../libs/cobs.zig"),
    });
    exe.root_module.addImport("cobs", cobs_mod);

    // make 'protobuf' dependency as a module
    const protobuf_dep = b.dependency("protobuf", .{
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("protobuf", protobuf_dep.module("protobuf"));

    // add protobuf generation commmand
    const gen_proto = b.step("gen-proto", "generates zig files from protocol buffer definitions");
    const protoc_step = protobuf.RunProtocStep.create(b, protobuf_dep.builder, b.standardTargetOptions(.{}), .{
        // out directory for the generated zig files
        .destination_directory = b.path("."),
        .source_files = &.{
            "../protobuf/simple/simple.proto",
        },
        .include_directories = &.{"../protobuf/simple"},
    });
    gen_proto.dependOn(&protoc_step.step);

    b.installArtifact(exe);

    // flash program to the board
    const cmd_opeoncd = b.addSystemCommand(&[_][]const u8{ "openocd", "-f", "board/st_nucleo_f4.cfg", "-c", "program zig-out/bin/main.elf verify reset exit" });
    b.step("openocd", "runs openocd to flash file into the board").dependOn(&cmd_opeoncd.step);
}
