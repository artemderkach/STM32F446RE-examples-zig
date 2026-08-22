const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Cryptographic processor
pub const CRC = extern struct {
    /// Data register
    /// offset: 0x00
    DR: mmio.Mmio(packed struct(u32) {
        /// Data Register
        DR: u32 = 0xFFFFFFFF,
    }),
    /// Independent Data register
    /// offset: 0x04
    IDR: mmio.Mmio(packed struct(u32) {
        /// Independent Data register
        IDR: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// Control register
    /// offset: 0x08
    CR: mmio.Mmio(packed struct(u32) {
        /// Control regidter
        CR: u1 = 0x0,
        padding: u31 = 0,
    }),
};
