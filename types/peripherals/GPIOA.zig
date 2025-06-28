const mmio = @import("mmio");
const types = @import("../../types.zig");

/// General-purpose I/Os
pub const GPIOA = extern struct {
    /// GPIO port mode register
    /// offset: 0x00
    MODER: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        MODER0: u2,
        /// Port x configuration bits (y = 0..15)
        MODER1: u2,
        /// Port x configuration bits (y = 0..15)
        MODER2: u2,
        /// Port x configuration bits (y = 0..15)
        MODER3: u2,
        /// Port x configuration bits (y = 0..15)
        MODER4: u2,
        /// Port x configuration bits (y = 0..15)
        MODER5: u2,
        /// Port x configuration bits (y = 0..15)
        MODER6: u2,
        /// Port x configuration bits (y = 0..15)
        MODER7: u2,
        /// Port x configuration bits (y = 0..15)
        MODER8: u2,
        /// Port x configuration bits (y = 0..15)
        MODER9: u2,
        /// Port x configuration bits (y = 0..15)
        MODER10: u2,
        /// Port x configuration bits (y = 0..15)
        MODER11: u2,
        /// Port x configuration bits (y = 0..15)
        MODER12: u2,
        /// Port x configuration bits (y = 0..15)
        MODER13: u2,
        /// Port x configuration bits (y = 0..15)
        MODER14: u2,
        /// Port x configuration bits (y = 0..15)
        MODER15: u2,
    }),
    /// GPIO port output type register
    /// offset: 0x04
    OTYPER: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        OT0: u1,
        /// Port x configuration bits (y = 0..15)
        OT1: u1,
        /// Port x configuration bits (y = 0..15)
        OT2: u1,
        /// Port x configuration bits (y = 0..15)
        OT3: u1,
        /// Port x configuration bits (y = 0..15)
        OT4: u1,
        /// Port x configuration bits (y = 0..15)
        OT5: u1,
        /// Port x configuration bits (y = 0..15)
        OT6: u1,
        /// Port x configuration bits (y = 0..15)
        OT7: u1,
        /// Port x configuration bits (y = 0..15)
        OT8: u1,
        /// Port x configuration bits (y = 0..15)
        OT9: u1,
        /// Port x configuration bits (y = 0..15)
        OT10: u1,
        /// Port x configuration bits (y = 0..15)
        OT11: u1,
        /// Port x configuration bits (y = 0..15)
        OT12: u1,
        /// Port x configuration bits (y = 0..15)
        OT13: u1,
        /// Port x configuration bits (y = 0..15)
        OT14: u1,
        /// Port x configuration bits (y = 0..15)
        OT15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port output speed register
    /// offset: 0x08
    OSPEEDR: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        OSPEEDR0: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR1: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR2: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR3: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR4: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR5: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR6: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR7: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR8: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR9: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR10: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR11: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR12: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR13: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR14: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEEDR15: u2,
    }),
    /// GPIO port pull-up/pull-down register
    /// offset: 0x0c
    PUPDR: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        PUPDR0: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR1: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR2: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR3: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR4: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR5: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR6: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR7: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR8: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR9: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR10: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR11: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR12: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR13: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR14: u2,
        /// Port x configuration bits (y = 0..15)
        PUPDR15: u2,
    }),
    /// GPIO port input data register
    /// offset: 0x10
    IDR: mmio.Mmio(packed struct(u32) {
        /// Port input data (y = 0..15)
        IDR0: u1,
        /// Port input data (y = 0..15)
        IDR1: u1,
        /// Port input data (y = 0..15)
        IDR2: u1,
        /// Port input data (y = 0..15)
        IDR3: u1,
        /// Port input data (y = 0..15)
        IDR4: u1,
        /// Port input data (y = 0..15)
        IDR5: u1,
        /// Port input data (y = 0..15)
        IDR6: u1,
        /// Port input data (y = 0..15)
        IDR7: u1,
        /// Port input data (y = 0..15)
        IDR8: u1,
        /// Port input data (y = 0..15)
        IDR9: u1,
        /// Port input data (y = 0..15)
        IDR10: u1,
        /// Port input data (y = 0..15)
        IDR11: u1,
        /// Port input data (y = 0..15)
        IDR12: u1,
        /// Port input data (y = 0..15)
        IDR13: u1,
        /// Port input data (y = 0..15)
        IDR14: u1,
        /// Port input data (y = 0..15)
        IDR15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port output data register
    /// offset: 0x14
    ODR: mmio.Mmio(packed struct(u32) {
        /// Port output data (y = 0..15)
        ODR0: u1,
        /// Port output data (y = 0..15)
        ODR1: u1,
        /// Port output data (y = 0..15)
        ODR2: u1,
        /// Port output data (y = 0..15)
        ODR3: u1,
        /// Port output data (y = 0..15)
        ODR4: u1,
        /// Port output data (y = 0..15)
        ODR5: u1,
        /// Port output data (y = 0..15)
        ODR6: u1,
        /// Port output data (y = 0..15)
        ODR7: u1,
        /// Port output data (y = 0..15)
        ODR8: u1,
        /// Port output data (y = 0..15)
        ODR9: u1,
        /// Port output data (y = 0..15)
        ODR10: u1,
        /// Port output data (y = 0..15)
        ODR11: u1,
        /// Port output data (y = 0..15)
        ODR12: u1,
        /// Port output data (y = 0..15)
        ODR13: u1,
        /// Port output data (y = 0..15)
        ODR14: u1,
        /// Port output data (y = 0..15)
        ODR15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port bit set/reset register
    /// offset: 0x18
    BSRR: mmio.Mmio(packed struct(u32) {
        /// Port x set bit y (y= 0..15)
        BS0: u1,
        /// Port x set bit y (y= 0..15)
        BS1: u1,
        /// Port x set bit y (y= 0..15)
        BS2: u1,
        /// Port x set bit y (y= 0..15)
        BS3: u1,
        /// Port x set bit y (y= 0..15)
        BS4: u1,
        /// Port x set bit y (y= 0..15)
        BS5: u1,
        /// Port x set bit y (y= 0..15)
        BS6: u1,
        /// Port x set bit y (y= 0..15)
        BS7: u1,
        /// Port x set bit y (y= 0..15)
        BS8: u1,
        /// Port x set bit y (y= 0..15)
        BS9: u1,
        /// Port x set bit y (y= 0..15)
        BS10: u1,
        /// Port x set bit y (y= 0..15)
        BS11: u1,
        /// Port x set bit y (y= 0..15)
        BS12: u1,
        /// Port x set bit y (y= 0..15)
        BS13: u1,
        /// Port x set bit y (y= 0..15)
        BS14: u1,
        /// Port x set bit y (y= 0..15)
        BS15: u1,
        /// Port x set bit y (y= 0..15)
        BR0: u1,
        /// Port x reset bit y (y = 0..15)
        BR1: u1,
        /// Port x reset bit y (y = 0..15)
        BR2: u1,
        /// Port x reset bit y (y = 0..15)
        BR3: u1,
        /// Port x reset bit y (y = 0..15)
        BR4: u1,
        /// Port x reset bit y (y = 0..15)
        BR5: u1,
        /// Port x reset bit y (y = 0..15)
        BR6: u1,
        /// Port x reset bit y (y = 0..15)
        BR7: u1,
        /// Port x reset bit y (y = 0..15)
        BR8: u1,
        /// Port x reset bit y (y = 0..15)
        BR9: u1,
        /// Port x reset bit y (y = 0..15)
        BR10: u1,
        /// Port x reset bit y (y = 0..15)
        BR11: u1,
        /// Port x reset bit y (y = 0..15)
        BR12: u1,
        /// Port x reset bit y (y = 0..15)
        BR13: u1,
        /// Port x reset bit y (y = 0..15)
        BR14: u1,
        /// Port x reset bit y (y = 0..15)
        BR15: u1,
    }),
    /// GPIO port configuration lock register
    /// offset: 0x1c
    LCKR: mmio.Mmio(packed struct(u32) {
        /// Port x lock bit y (y= 0..15)
        LCK0: u1,
        /// Port x lock bit y (y= 0..15)
        LCK1: u1,
        /// Port x lock bit y (y= 0..15)
        LCK2: u1,
        /// Port x lock bit y (y= 0..15)
        LCK3: u1,
        /// Port x lock bit y (y= 0..15)
        LCK4: u1,
        /// Port x lock bit y (y= 0..15)
        LCK5: u1,
        /// Port x lock bit y (y= 0..15)
        LCK6: u1,
        /// Port x lock bit y (y= 0..15)
        LCK7: u1,
        /// Port x lock bit y (y= 0..15)
        LCK8: u1,
        /// Port x lock bit y (y= 0..15)
        LCK9: u1,
        /// Port x lock bit y (y= 0..15)
        LCK10: u1,
        /// Port x lock bit y (y= 0..15)
        LCK11: u1,
        /// Port x lock bit y (y= 0..15)
        LCK12: u1,
        /// Port x lock bit y (y= 0..15)
        LCK13: u1,
        /// Port x lock bit y (y= 0..15)
        LCK14: u1,
        /// Port x lock bit y (y= 0..15)
        LCK15: u1,
        /// Port x lock bit y (y= 0..15)
        LCKK: u1,
        padding: u15 = 0,
    }),
    /// GPIO alternate function low register
    /// offset: 0x20
    AFRL: mmio.Mmio(packed struct(u32) {
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL0: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL1: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL2: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL3: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL4: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL5: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL6: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFRL7: u4,
    }),
    /// GPIO alternate function high register
    /// offset: 0x24
    AFRH: mmio.Mmio(packed struct(u32) {
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH8: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH9: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH10: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH11: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH12: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH13: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH14: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFRH15: u4,
    }),
};
