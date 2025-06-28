const mmio = @import("mmio");
const types = @import("../../types.zig");

/// USB on the go high speed
pub const OTG_HS_PWRCLK = extern struct {
    /// Power and clock gating control register
    /// offset: 0x00
    OTG_HS_PCGCR: mmio.Mmio(packed struct(u32) {
        /// Stop PHY clock
        STPPCLK: u1,
        /// Gate HCLK
        GATEHCLK: u1,
        reserved4: u2 = 0,
        /// PHY suspended
        PHYSUSP: u1,
        padding: u27 = 0,
    }),
};
