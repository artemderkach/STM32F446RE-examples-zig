const mmio = @import("mmio");
const types = @import("../../types.zig");

/// USB on the go full speed
pub const OTG_FS_PWRCLK = extern struct {
    /// OTG_FS power and clock gating control register (OTG_FS_PCGCCTL)
    /// offset: 0x00
    FS_PCGCCTL: mmio.Mmio(packed struct(u32) {
        /// Stop PHY clock
        STPPCLK: u1,
        /// Gate HCLK
        GATEHCLK: u1,
        reserved4: u2 = 0,
        /// PHY Suspended
        PHYSUSP: u1,
        padding: u27 = 0,
    }),
};
