const mmio = @import("mmio");
const types = @import("../../types.zig");

/// General-purpose-timers
pub const TIM10 = extern struct {
    /// control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Counter enable
        CEN: u1,
        /// Update disable
        UDIS: u1,
        /// Update request source
        URS: u1,
        reserved7: u4 = 0,
        /// Auto-reload preload enable
        ARPE: u1,
        /// Clock division
        CKD: u2,
        padding: u22 = 0,
    }),
    /// offset: 0x04
    reserved4: [8]u8,
    /// DMA/Interrupt enable register
    /// offset: 0x0c
    DIER: mmio.Mmio(packed struct(u32) {
        /// Update interrupt enable
        UIE: u1,
        /// Capture/Compare 1 interrupt enable
        CC1IE: u1,
        padding: u30 = 0,
    }),
    /// status register
    /// offset: 0x10
    SR: mmio.Mmio(packed struct(u32) {
        /// Update interrupt flag
        UIF: u1,
        /// Capture/compare 1 interrupt flag
        CC1IF: u1,
        reserved9: u7 = 0,
        /// Capture/Compare 1 overcapture flag
        CC1OF: u1,
        padding: u22 = 0,
    }),
    /// event generation register
    /// offset: 0x14
    EGR: mmio.Mmio(packed struct(u32) {
        /// Update generation
        UG: u1,
        /// Capture/compare 1 generation
        CC1G: u1,
        padding: u30 = 0,
    }),
    /// capture/compare mode register 1 (output mode)
    /// offset: 0x18
    CCMR1_Output: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 selection
        CC1S: u2,
        /// Output Compare 1 fast enable
        OC1FE: u1,
        /// Output Compare 1 preload enable
        OC1PE: u1,
        /// Output Compare 1 mode
        OC1M: u3,
        padding: u25 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// capture/compare enable register
    /// offset: 0x20
    CCER: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 output enable
        CC1E: u1,
        /// Capture/Compare 1 output Polarity
        CC1P: u1,
        reserved3: u1 = 0,
        /// Capture/Compare 1 output Polarity
        CC1NP: u1,
        padding: u28 = 0,
    }),
    /// counter
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// counter value
        CNT: u16,
        padding: u16 = 0,
    }),
    /// prescaler
    /// offset: 0x28
    PSC: mmio.Mmio(packed struct(u32) {
        /// Prescaler value
        PSC: u16,
        padding: u16 = 0,
    }),
    /// auto-reload register
    /// offset: 0x2c
    ARR: mmio.Mmio(packed struct(u32) {
        /// Auto-reload value
        ARR: u16,
        padding: u16 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// capture/compare register 1
    /// offset: 0x34
    CCR1: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 value
        CCR1: u16,
        padding: u16 = 0,
    }),
};
