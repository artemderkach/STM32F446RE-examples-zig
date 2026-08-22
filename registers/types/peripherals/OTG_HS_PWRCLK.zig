const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go high speed
pub const OTG_HS_PWRCLK = extern struct {
    /// Power and clock gating control register
    /// offset: 0x00
    OTG_HS_PCGCR: mmio.Mmio(packed struct(u32) {
        /// Stop PHY clock
        STPPCLK: u1 = 0x0,
        /// Gate HCLK
        GATEHCLK: u1 = 0x0,
        reserved4: u2 = 0,
        /// PHY suspended
        PHYSUSP: u1 = 0x0,
        padding: u27 = 0,
    }),
};
