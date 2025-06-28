const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Nested Vectored Interrupt Controller
pub const NVIC = extern struct {
    /// Interrupt Set-Enable Register
    /// offset: 0x00
    ISER0: mmio.Mmio(packed struct(u32) {
        /// SETENA
        SETENA: u32,
    }),
    /// Interrupt Set-Enable Register
    /// offset: 0x04
    ISER1: mmio.Mmio(packed struct(u32) {
        /// SETENA
        SETENA: u32,
    }),
    /// Interrupt Set-Enable Register
    /// offset: 0x08
    ISER2: mmio.Mmio(packed struct(u32) {
        /// SETENA
        SETENA: u32,
    }),
    /// offset: 0x0c
    reserved12: [116]u8,
    /// Interrupt Clear-Enable Register
    /// offset: 0x80
    ICER0: mmio.Mmio(packed struct(u32) {
        /// CLRENA
        CLRENA: u32,
    }),
    /// Interrupt Clear-Enable Register
    /// offset: 0x84
    ICER1: mmio.Mmio(packed struct(u32) {
        /// CLRENA
        CLRENA: u32,
    }),
    /// Interrupt Clear-Enable Register
    /// offset: 0x88
    ICER2: mmio.Mmio(packed struct(u32) {
        /// CLRENA
        CLRENA: u32,
    }),
    /// offset: 0x8c
    reserved140: [116]u8,
    /// Interrupt Set-Pending Register
    /// offset: 0x100
    ISPR0: mmio.Mmio(packed struct(u32) {
        /// SETPEND
        SETPEND: u32,
    }),
    /// Interrupt Set-Pending Register
    /// offset: 0x104
    ISPR1: mmio.Mmio(packed struct(u32) {
        /// SETPEND
        SETPEND: u32,
    }),
    /// Interrupt Set-Pending Register
    /// offset: 0x108
    ISPR2: mmio.Mmio(packed struct(u32) {
        /// SETPEND
        SETPEND: u32,
    }),
    /// offset: 0x10c
    reserved268: [116]u8,
    /// Interrupt Clear-Pending Register
    /// offset: 0x180
    ICPR0: mmio.Mmio(packed struct(u32) {
        /// CLRPEND
        CLRPEND: u32,
    }),
    /// Interrupt Clear-Pending Register
    /// offset: 0x184
    ICPR1: mmio.Mmio(packed struct(u32) {
        /// CLRPEND
        CLRPEND: u32,
    }),
    /// Interrupt Clear-Pending Register
    /// offset: 0x188
    ICPR2: mmio.Mmio(packed struct(u32) {
        /// CLRPEND
        CLRPEND: u32,
    }),
    /// offset: 0x18c
    reserved396: [116]u8,
    /// Interrupt Active Bit Register
    /// offset: 0x200
    IABR0: mmio.Mmio(packed struct(u32) {
        /// ACTIVE
        ACTIVE: u32,
    }),
    /// Interrupt Active Bit Register
    /// offset: 0x204
    IABR1: mmio.Mmio(packed struct(u32) {
        /// ACTIVE
        ACTIVE: u32,
    }),
    /// Interrupt Active Bit Register
    /// offset: 0x208
    IABR2: mmio.Mmio(packed struct(u32) {
        /// ACTIVE
        ACTIVE: u32,
    }),
    /// offset: 0x20c
    reserved524: [244]u8,
    /// Interrupt Priority Register
    /// offset: 0x300
    IPR0: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x304
    IPR1: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x308
    IPR2: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x30c
    IPR3: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x310
    IPR4: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x314
    IPR5: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x318
    IPR6: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x31c
    IPR7: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x320
    IPR8: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x324
    IPR9: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x328
    IPR10: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x32c
    IPR11: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x330
    IPR12: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x334
    IPR13: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x338
    IPR14: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x33c
    IPR15: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x340
    IPR16: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x344
    IPR17: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x348
    IPR18: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x34c
    IPR19: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
    /// Interrupt Priority Register
    /// offset: 0x350
    IPR20: mmio.Mmio(packed struct(u32) {
        /// IPR_N0
        IPR_N0: u8,
        /// IPR_N1
        IPR_N1: u8,
        /// IPR_N2
        IPR_N2: u8,
        /// IPR_N3
        IPR_N3: u8,
    }),
};
