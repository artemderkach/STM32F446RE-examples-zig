const mmio = @import("mmio");
const types = @import("../../types.zig");

/// System control block ACTLR
pub const SCB_ACTRL = extern struct {
    /// Auxiliary control register
    /// offset: 0x00
    ACTRL: mmio.Mmio(packed struct(u32) {
        /// DISMCYCINT
        DISMCYCINT: u1,
        /// DISDEFWBUF
        DISDEFWBUF: u1,
        /// DISFOLD
        DISFOLD: u1,
        reserved8: u5 = 0,
        /// DISFPCA
        DISFPCA: u1,
        /// DISOOFP
        DISOOFP: u1,
        padding: u22 = 0,
    }),
};
