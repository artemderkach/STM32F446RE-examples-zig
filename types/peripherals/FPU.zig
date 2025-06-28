const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Floting point unit
pub const FPU = extern struct {
    /// Floating-point context control register
    /// offset: 0x00
    FPCCR: mmio.Mmio(packed struct(u32) {
        /// LSPACT
        LSPACT: u1,
        /// USER
        USER: u1,
        reserved3: u1 = 0,
        /// THREAD
        THREAD: u1,
        /// HFRDY
        HFRDY: u1,
        /// MMRDY
        MMRDY: u1,
        /// BFRDY
        BFRDY: u1,
        reserved8: u1 = 0,
        /// MONRDY
        MONRDY: u1,
        reserved30: u21 = 0,
        /// LSPEN
        LSPEN: u1,
        /// ASPEN
        ASPEN: u1,
    }),
    /// Floating-point context address register
    /// offset: 0x04
    FPCAR: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Location of unpopulated floating-point
        ADDRESS: u29,
    }),
    /// Floating-point status control register
    /// offset: 0x08
    FPSCR: mmio.Mmio(packed struct(u32) {
        /// Invalid operation cumulative exception bit
        IOC: u1,
        /// Division by zero cumulative exception bit.
        DZC: u1,
        /// Overflow cumulative exception bit
        OFC: u1,
        /// Underflow cumulative exception bit
        UFC: u1,
        /// Inexact cumulative exception bit
        IXC: u1,
        reserved7: u2 = 0,
        /// Input denormal cumulative exception bit.
        IDC: u1,
        reserved22: u14 = 0,
        /// Rounding Mode control field
        RMode: u2,
        /// Flush-to-zero mode control bit:
        FZ: u1,
        /// Default NaN mode control bit
        DN: u1,
        /// Alternative half-precision control bit
        AHP: u1,
        reserved28: u1 = 0,
        /// Overflow condition code flag
        V: u1,
        /// Carry condition code flag
        C: u1,
        /// Zero condition code flag
        Z: u1,
        /// Negative condition code flag
        N: u1,
    }),
};
