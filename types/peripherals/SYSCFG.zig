const mmio = @import("mmio");
const types = @import("../../types.zig");

/// System configuration controller
pub const SYSCFG = extern struct {
    /// memory remap register
    /// offset: 0x00
    MEMRM: mmio.Mmio(packed struct(u32) {
        /// Memory mapping selection
        MEM_MODE: u3,
        reserved8: u5 = 0,
        /// Flash bank mode selection
        FB_MODE: u1,
        reserved10: u1 = 0,
        /// FMC memory mapping swap
        SWP_FMC: u2,
        padding: u20 = 0,
    }),
    /// peripheral mode configuration register
    /// offset: 0x04
    PMC: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// ADC1DC2
        ADC1DC2: u1,
        /// ADC2DC2
        ADC2DC2: u1,
        /// ADC3DC2
        ADC3DC2: u1,
        reserved23: u4 = 0,
        /// Ethernet PHY interface selection
        MII_RMII_SEL: u1,
        padding: u8 = 0,
    }),
    /// external interrupt configuration register 1
    /// offset: 0x08
    EXTICR1: mmio.Mmio(packed struct(u32) {
        /// EXTI x configuration (x = 0 to 3)
        EXTI0: u4,
        /// EXTI x configuration (x = 0 to 3)
        EXTI1: u4,
        /// EXTI x configuration (x = 0 to 3)
        EXTI2: u4,
        /// EXTI x configuration (x = 0 to 3)
        EXTI3: u4,
        padding: u16 = 0,
    }),
    /// external interrupt configuration register 2
    /// offset: 0x0c
    EXTICR2: mmio.Mmio(packed struct(u32) {
        /// EXTI x configuration (x = 4 to 7)
        EXTI4: u4,
        /// EXTI x configuration (x = 4 to 7)
        EXTI5: u4,
        /// EXTI x configuration (x = 4 to 7)
        EXTI6: u4,
        /// EXTI x configuration (x = 4 to 7)
        EXTI7: u4,
        padding: u16 = 0,
    }),
    /// external interrupt configuration register 3
    /// offset: 0x10
    EXTICR3: mmio.Mmio(packed struct(u32) {
        /// EXTI x configuration (x = 8 to 11)
        EXTI8: u4,
        /// EXTI x configuration (x = 8 to 11)
        EXTI9: u4,
        /// EXTI10
        EXTI10: u4,
        /// EXTI x configuration (x = 8 to 11)
        EXTI11: u4,
        padding: u16 = 0,
    }),
    /// external interrupt configuration register 4
    /// offset: 0x14
    EXTICR4: mmio.Mmio(packed struct(u32) {
        /// EXTI x configuration (x = 12 to 15)
        EXTI12: u4,
        /// EXTI x configuration (x = 12 to 15)
        EXTI13: u4,
        /// EXTI x configuration (x = 12 to 15)
        EXTI14: u4,
        /// EXTI x configuration (x = 12 to 15)
        EXTI15: u4,
        padding: u16 = 0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// Compensation cell control register
    /// offset: 0x20
    CMPCR: mmio.Mmio(packed struct(u32) {
        /// Compensation cell power-down
        CMP_PD: u1,
        reserved8: u7 = 0,
        /// READY
        READY: u1,
        padding: u23 = 0,
    }),
};
