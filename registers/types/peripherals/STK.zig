const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// SysTick timer
pub const STK = extern struct {
    /// SysTick control and status register
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Counter enable
        ENABLE: u1 = 0x0,
        /// SysTick exception request enable
        TICKINT: u1 = 0x0,
        /// Clock source selection
        CLKSOURCE: u1 = 0x0,
        reserved16: u13 = 0,
        /// COUNTFLAG
        COUNTFLAG: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// SysTick reload value register
    /// offset: 0x04
    LOAD: mmio.Mmio(packed struct(u32) {
        /// RELOAD value
        RELOAD: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// SysTick current value register
    /// offset: 0x08
    VAL: mmio.Mmio(packed struct(u32) {
        /// Current counter value
        CURRENT: u24 = 0x0,
        padding: u8 = 0,
    }),
    /// SysTick calibration value register
    /// offset: 0x0c
    CALIB: mmio.Mmio(packed struct(u32) {
        /// Calibration value
        TENMS: u24 = 0x0,
        reserved30: u6 = 0,
        /// SKEW flag: Indicates whether the TENMS value is exact
        SKEW: u1 = 0x0,
        /// NOREF flag. Reads as zero
        NOREF: u1 = 0x0,
    }),
};
