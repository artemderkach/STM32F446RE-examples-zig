const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Floating point unit CPACR
pub const FPU_CPACR = extern struct {
    /// Coprocessor access control register
    /// offset: 0x00
    CPACR: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// CP
        CP: u4,
        padding: u8 = 0,
    }),
};
