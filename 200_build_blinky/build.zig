// openocd -f board/st_nucleo_f4.cfg -c "program zig-out/bin/main.elf verify reset exit"

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_model = std.zig.CrossTarget.CpuModel{
            .explicit = &std.Target.arm.cpu.cortex_m4,
        },
    });

    const exe = b.addExecutable(.{
        .name = "main.elf",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = .ReleaseSafe,
        .strip = true,
    });

    exe.addAssemblyFile(b.path("startup.s"));
    exe.setLinkerScript(b.path("linker.ld"));
    exe.bundle_compiler_rt = false;

    b.installArtifact(exe);
}
