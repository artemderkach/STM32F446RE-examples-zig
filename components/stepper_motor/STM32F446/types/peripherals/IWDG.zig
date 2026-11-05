const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Independent watchdog
pub const IWDG = extern struct {
    /// Key register
    /// offset: 0x00
    KR: mmio.Mmio(packed struct(u32) {
        /// Key value (write only, read 0000h)
        KEY: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// Prescaler register
    /// offset: 0x04
    PR: mmio.Mmio(packed struct(u32) {
        /// Prescaler divider
        PR: u3 = 0x0,
        padding: u29 = 0,
    }),
    /// Reload register
    /// offset: 0x08
    RLR: mmio.Mmio(packed struct(u32) {
        /// Watchdog counter reload value
        RL: u12 = 0xFFF,
        padding: u20 = 0,
    }),
    /// Status register
    /// offset: 0x0c
    SR: mmio.Mmio(packed struct(u32) {
        /// Watchdog prescaler value update
        PVU: u1 = 0x0,
        /// Watchdog counter reload value update
        RVU: u1 = 0x0,
        padding: u30 = 0,
    }),
};
