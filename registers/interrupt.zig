const builtin = @import("builtin");

// defined for regz
pub const Handler = extern union {
    naked: *const fn () callconv(.naked) void,
    c: *const fn () callconv(.c) void,
};

// defined for regz
pub const unhandled: Handler = .{
    .c = struct {
        pub fn unhandled() callconv(.c) void {
            @panic("unhandled interrupt");
        }
    }.unhandled,
};

