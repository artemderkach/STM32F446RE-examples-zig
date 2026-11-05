const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Nested vectored interrupt controller
pub const NVIC_STIR = extern struct {
    /// Software trigger interrupt register
    /// offset: 0x00
    STIR: mmio.Mmio(packed struct(u32) {
        /// Software generated interrupt ID
        INTID: u9 = 0x0,
        padding: u23 = 0,
    }),
};
