const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// General purpose timers
pub const TIM9 = extern struct {
    /// control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Counter enable
        CEN: u1 = 0x0,
        /// Update disable
        UDIS: u1 = 0x0,
        /// Update request source
        URS: u1 = 0x0,
        /// One-pulse mode
        OPM: u1 = 0x0,
        reserved7: u3 = 0,
        /// Auto-reload preload enable
        ARPE: u1 = 0x0,
        /// Clock division
        CKD: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// Master mode selection
        MMS: u3 = 0x0,
        padding: u25 = 0,
    }),
    /// slave mode control register
    /// offset: 0x08
    SMCR: mmio.Mmio(packed struct(u32) {
        /// Slave mode selection
        SMS: u3 = 0x0,
        reserved4: u1 = 0,
        /// Trigger selection
        TS: u3 = 0x0,
        /// Master/Slave mode
        MSM: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// DMA/Interrupt enable register
    /// offset: 0x0c
    DIER: mmio.Mmio(packed struct(u32) {
        /// Update interrupt enable
        UIE: u1 = 0x0,
        /// Capture/Compare 1 interrupt enable
        CC1IE: u1 = 0x0,
        /// Capture/Compare 2 interrupt enable
        CC2IE: u1 = 0x0,
        reserved6: u3 = 0,
        /// Trigger interrupt enable
        TIE: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// status register
    /// offset: 0x10
    SR: mmio.Mmio(packed struct(u32) {
        /// Update interrupt flag
        UIF: u1 = 0x0,
        /// Capture/compare 1 interrupt flag
        CC1IF: u1 = 0x0,
        /// Capture/Compare 2 interrupt flag
        CC2IF: u1 = 0x0,
        reserved6: u3 = 0,
        /// Trigger interrupt flag
        TIF: u1 = 0x0,
        reserved9: u2 = 0,
        /// Capture/Compare 1 overcapture flag
        CC1OF: u1 = 0x0,
        /// Capture/compare 2 overcapture flag
        CC2OF: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// event generation register
    /// offset: 0x14
    EGR: mmio.Mmio(packed struct(u32) {
        /// Update generation
        UG: u1 = 0x0,
        /// Capture/compare 1 generation
        CC1G: u1 = 0x0,
        /// Capture/compare 2 generation
        CC2G: u1 = 0x0,
        reserved6: u3 = 0,
        /// Trigger generation
        TG: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// capture/compare mode register 1 (output mode)
    /// offset: 0x18
    CCMR1_Output: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 selection
        CC1S: u2 = 0x0,
        /// Output Compare 1 fast enable
        OC1FE: u1 = 0x0,
        /// Output Compare 1 preload enable
        OC1PE: u1 = 0x0,
        /// Output Compare 1 mode
        OC1M: u3 = 0x0,
        reserved8: u1 = 0,
        /// Capture/Compare 2 selection
        CC2S: u2 = 0x0,
        /// Output Compare 2 fast enable
        OC2FE: u1 = 0x0,
        /// Output Compare 2 preload enable
        OC2PE: u1 = 0x0,
        /// Output Compare 2 mode
        OC2M: u3 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// capture/compare enable register
    /// offset: 0x20
    CCER: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 output enable
        CC1E: u1 = 0x0,
        /// Capture/Compare 1 output Polarity
        CC1P: u1 = 0x0,
        reserved3: u1 = 0,
        /// Capture/Compare 1 output Polarity
        CC1NP: u1 = 0x0,
        /// Capture/Compare 2 output enable
        CC2E: u1 = 0x0,
        /// Capture/Compare 2 output Polarity
        CC2P: u1 = 0x0,
        reserved7: u1 = 0,
        /// Capture/Compare 2 output Polarity
        CC2NP: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// counter
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// counter value
        CNT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// prescaler
    /// offset: 0x28
    PSC: mmio.Mmio(packed struct(u32) {
        /// Prescaler value
        PSC: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// auto-reload register
    /// offset: 0x2c
    ARR: mmio.Mmio(packed struct(u32) {
        /// Auto-reload value
        ARR: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// capture/compare register 1
    /// offset: 0x34
    CCR1: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 1 value
        CCR1: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// capture/compare register 2
    /// offset: 0x38
    CCR2: mmio.Mmio(packed struct(u32) {
        /// Capture/Compare 2 value
        CCR2: u16 = 0x0,
        padding: u16 = 0,
    }),
};
