const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// System control block ACTLR
pub const SCB_ACTRL = extern struct {
    /// Auxiliary control register
    /// offset: 0x00
    ACTRL: mmio.Mmio(packed struct(u32) {
        /// DISMCYCINT
        DISMCYCINT: u1 = 0x0,
        /// DISDEFWBUF
        DISDEFWBUF: u1 = 0x0,
        /// DISFOLD
        DISFOLD: u1 = 0x0,
        reserved8: u5 = 0,
        /// DISFPCA
        DISFPCA: u1 = 0x0,
        /// DISOOFP
        DISOOFP: u1 = 0x0,
        padding: u22 = 0,
    }),
};
