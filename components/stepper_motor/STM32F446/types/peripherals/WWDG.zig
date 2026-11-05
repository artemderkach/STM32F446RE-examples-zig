const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Window watchdog
pub const WWDG = extern struct {
    /// Control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// 7-bit counter (MSB to LSB)
        T: u7 = 0x7F,
        /// Activation bit
        WDGA: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// Configuration register
    /// offset: 0x04
    CFR: mmio.Mmio(packed struct(u32) {
        /// 7-bit window value
        W: u7 = 0x7F,
        /// Timer base
        WDGTB0: u1 = 0x0,
        /// Timer base
        WDGTB1: u1 = 0x0,
        /// Early wakeup interrupt
        EWI: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// Status register
    /// offset: 0x08
    SR: mmio.Mmio(packed struct(u32) {
        /// Early wakeup interrupt flag
        EWIF: u1 = 0x0,
        padding: u31 = 0,
    }),
};
