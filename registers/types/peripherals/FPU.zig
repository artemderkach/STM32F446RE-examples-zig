const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Floting point unit
pub const FPU = extern struct {
    /// Floating-point context control register
    /// offset: 0x00
    FPCCR: mmio.Mmio(packed struct(u32) {
        /// LSPACT
        LSPACT: u1 = 0x0,
        /// USER
        USER: u1 = 0x0,
        reserved3: u1 = 0,
        /// THREAD
        THREAD: u1 = 0x0,
        /// HFRDY
        HFRDY: u1 = 0x0,
        /// MMRDY
        MMRDY: u1 = 0x0,
        /// BFRDY
        BFRDY: u1 = 0x0,
        reserved8: u1 = 0,
        /// MONRDY
        MONRDY: u1 = 0x0,
        reserved30: u21 = 0,
        /// LSPEN
        LSPEN: u1 = 0x0,
        /// ASPEN
        ASPEN: u1 = 0x0,
    }),
    /// Floating-point context address register
    /// offset: 0x04
    FPCAR: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Location of unpopulated floating-point
        ADDRESS: u29 = 0x0,
    }),
    /// Floating-point status control register
    /// offset: 0x08
    FPSCR: mmio.Mmio(packed struct(u32) {
        /// Invalid operation cumulative exception bit
        IOC: u1 = 0x0,
        /// Division by zero cumulative exception bit.
        DZC: u1 = 0x0,
        /// Overflow cumulative exception bit
        OFC: u1 = 0x0,
        /// Underflow cumulative exception bit
        UFC: u1 = 0x0,
        /// Inexact cumulative exception bit
        IXC: u1 = 0x0,
        reserved7: u2 = 0,
        /// Input denormal cumulative exception bit.
        IDC: u1 = 0x0,
        reserved22: u14 = 0,
        /// Rounding Mode control field
        RMode: u2 = 0x0,
        /// Flush-to-zero mode control bit:
        FZ: u1 = 0x0,
        /// Default NaN mode control bit
        DN: u1 = 0x0,
        /// Alternative half-precision control bit
        AHP: u1 = 0x0,
        reserved28: u1 = 0,
        /// Overflow condition code flag
        V: u1 = 0x0,
        /// Carry condition code flag
        C: u1 = 0x0,
        /// Zero condition code flag
        Z: u1 = 0x0,
        /// Negative condition code flag
        N: u1 = 0x0,
    }),
};
