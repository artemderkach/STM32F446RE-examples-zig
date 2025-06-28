// openocd -f board/st_nucleo_f4.cfg -c "program zig-out/bin/main.elf verify reset exit"

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

    const exe = b.addExecutable(.{
        .name = "main.elf",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = .ReleaseSmall,
        .strip = true,
    });

    const mmio_mod = b.addModule("mmio", .{
        .root_source_file = b.path("../mmio.zig"),
    });
    exe.root_module.addImport("mmio", mmio_mod);

    const mmio_mod_2 = b.addModule("mm", .{
        .root_source_file = b.path("../STM32F446.zig"),
    });
    mmio_mod_2.addImport("mmio", mmio_mod);
    exe.root_module.addImport("mm", mmio_mod_2);

    exe.addAssemblyFile(b.path("startup.s"));
    exe.setLinkerScript(b.path("linker.ld"));
    exe.bundle_compiler_rt = false;

    const cmd_opeoncd = b.addSystemCommand(&[_][]const u8{ "openocd", "-f", "board/st_nucleo_f4.cfg", "-c", "program zig-out/bin/main.elf verify reset exit" });
    b.step("openocd", "runs openocd to flash file into the board").dependOn(&cmd_opeoncd.step);

    b.installArtifact(exe);
}
