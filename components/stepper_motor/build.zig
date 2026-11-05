
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_model = std.Target.Query.CpuModel{
            .explicit = &std.Target.arm.cpu.cortex_m4,
        },
    });

    const microzig_mod = b.dependency("microzig", .{
        .target = target,
    }).module("microzig");

    const mmio_mod = b.addModule("mmio", .{
        .root_source_file = b.path("./STM32F446/STM32F446.zig"),
    });

    const exe = b.addExecutable(.{
        .name = "main.elf",
        .root_module = b.createModule(.{
            .root_source_file = b.path("main.zig"),
            .target = target,
            .optimize = .ReleaseSafe,
            .strip = true,
        }),
    });

    exe.root_module.addImport("microzig", microzig_mod);
    mmio_mod.addImport("microzig", microzig_mod);
    exe.root_module.addImport("mmio", mmio_mod);

    exe.root_module.addAssemblyFile(b.path("startup.s"));
    exe.setLinkerScript(b.path("linker.ld"));
    exe.bundle_compiler_rt = false;


    // a tiny module that plays the role of @import("microzig")
    // const microzig_mod = b.createModule(.{
    //     .root_source_file = b.path("src/microzig_shim.zig"),
    //     .target = target,
    // });

    // give it to everything that uses it

    // mmio_mod.addImport("microzig", microzig_mod);   // the module containing regz output

    // const microzig_dep = b.dependency("microzig", .{});
    // exe.root_module.addImport("microzig", microzig_dep.module("microzig"));

    b.installArtifact(exe);

    const run_cmd = b.addSystemCommand(&[_][]const u8{ "openocd", "-f", "board/st_nucleo_f4.cfg", "-c", "program zig-out/bin/main.elf verify reset exit" });
    b.step("openocd", "runs openocd to flash file into the board").dependOn(&run_cmd.step);
}
