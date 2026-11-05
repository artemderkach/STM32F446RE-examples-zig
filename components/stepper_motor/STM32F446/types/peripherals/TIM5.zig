const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// General-purpose-timers
pub const TIM5 = extern struct {
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
        /// Direction
        DIR: u1 = 0x0,
        /// Center-aligned mode selection
        CMS: u2 = 0x0,
        /// Auto-reload preload enable
        ARPE: u1 = 0x0,
        /// Clock division
        CKD: u2 = 0x0,
        padding: u22 = 0,
    }),
    /// control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Capture/compare DMA selection
        CCDS: u1 = 0x0,
        /// Master mode selection
        MMS: u3 = 0x0,
        /// TI1 selection
        TI1S: u1 = 0x0,
        padding: u24 = 0,
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
        /// External trigger filter
        ETF: u4 = 0x0,
        /// External trigger prescaler
        ETPS: u2 = 0x0,
        /// External clock enable
        ECE: u1 = 0x0,
        /// External trigger polarity
        ETP: u1 = 0x0,
        padding: u16 = 0,
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
        /// Capture/Compare 3 interrupt enable
        CC3IE: u1 = 0x0,
        /// Capture/Compare 4 interrupt enable
        CC4IE: u1 = 0x0,
        reserved6: u1 = 0,
        /// Trigger interrupt enable
        TIE: u1 = 0x0,
        reserved8: u1 = 0,
        /// Update DMA request enable
        UDE: u1 = 0x0,
        /// Capture/Compare 1 DMA request enable
        CC1DE: u1 = 0x0,
        /// Capture/Compare 2 DMA request enable
        CC2DE: u1 = 0x0,
        /// Capture/Compare 3 DMA request enable
        CC3DE: u1 = 0x0,
        /// Capture/Compare 4 DMA request enable
        CC4DE: u1 = 0x0,
        reserved14: u1 = 0,
        /// Trigger DMA request enable
        TDE: u1 = 0x0,
        padding: u17 = 0,
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
        /// Capture/Compare 3 interrupt flag
        CC3IF: u1 = 0x0,
        /// Capture/Compare 4 interrupt flag
        CC4IF: u1 = 0x0,
        reserved6: u1 = 0,
        /// Trigger interrupt flag
        TIF: u1 = 0x0,
        reserved9: u2 = 0,
        /// Capture/Compare 1 overcapture flag
        CC1OF: u1 = 0x0,
        /// Capture/compare 2 overcapture flag
        CC2OF: u1 = 0x0,
        /// Capture/Compare 3 overcapture flag
        CC3OF: u1 = 0x0,
        /// Capture/Compare 4 overcapture flag
        CC4OF: u1 = 0x0,
        padding: u19 = 0,
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
        /// Capture/compare 3 generation
        CC3G: u1 = 0x0,
        /// Capture/compare 4 generation
        CC4G: u1 = 0x0,
        reserved6: u1 = 0,
        /// Trigger generation
        TG: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// capture/compare mode register 1 (output mode)
    /// offset: 0x18
    CCMR1_Output: mmio.Mmio(packed struct(u32) {
        /// CC1S
        CC1S: u2 = 0x0,
        /// OC1FE
        OC1FE: u1 = 0x0,
        /// OC1PE
        OC1PE: u1 = 0x0,
        /// OC1M
        OC1M: u3 = 0x0,
        /// OC1CE
        OC1CE: u1 = 0x0,
        /// CC2S
        CC2S: u2 = 0x0,
        /// OC2FE
        OC2FE: u1 = 0x0,
        /// OC2PE
        OC2PE: u1 = 0x0,
        /// OC2M
        OC2M: u3 = 0x0,
        /// OC2CE
        OC2CE: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// capture/compare mode register 2 (output mode)
    /// offset: 0x1c
    CCMR2_Output: mmio.Mmio(packed struct(u32) {
        /// CC3S
        CC3S: u2 = 0x0,
        /// OC3FE
        OC3FE: u1 = 0x0,
        /// OC3PE
        OC3PE: u1 = 0x0,
        /// OC3M
        OC3M: u3 = 0x0,
        /// OC3CE
        OC3CE: u1 = 0x0,
        /// CC4S
        CC4S: u2 = 0x0,
        /// OC4FE
        OC4FE: u1 = 0x0,
        /// OC4PE
        OC4PE: u1 = 0x0,
        /// OC4M
        OC4M: u3 = 0x0,
        /// O24CE
        O24CE: u1 = 0x0,
        padding: u16 = 0,
    }),
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
        /// Capture/Compare 3 output enable
        CC3E: u1 = 0x0,
        /// Capture/Compare 3 output Polarity
        CC3P: u1 = 0x0,
        reserved11: u1 = 0,
        /// Capture/Compare 3 output Polarity
        CC3NP: u1 = 0x0,
        /// Capture/Compare 4 output enable
        CC4E: u1 = 0x0,
        /// Capture/Compare 3 output Polarity
        CC4P: u1 = 0x0,
        reserved15: u1 = 0,
        /// Capture/Compare 4 output Polarity
        CC4NP: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// counter
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// Low counter value
        CNT_L: u16 = 0x0,
        /// High counter value
        CNT_H: u16 = 0x0,
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
        /// Low Auto-reload value
        ARR_L: u16 = 0x0,
        /// High Auto-reload value
        ARR_H: u16 = 0x0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// capture/compare register 1
    /// offset: 0x34
    CCR1: mmio.Mmio(packed struct(u32) {
        /// Low Capture/Compare 1 value
        CCR1_L: u16 = 0x0,
        /// High Capture/Compare 1 value
        CCR1_H: u16 = 0x0,
    }),
    /// capture/compare register 2
    /// offset: 0x38
    CCR2: mmio.Mmio(packed struct(u32) {
        /// Low Capture/Compare 2 value
        CCR2_L: u16 = 0x0,
        /// High Capture/Compare 2 value
        CCR2_H: u16 = 0x0,
    }),
    /// capture/compare register 3
    /// offset: 0x3c
    CCR3: mmio.Mmio(packed struct(u32) {
        /// Low Capture/Compare value
        CCR3_L: u16 = 0x0,
        /// High Capture/Compare value
        CCR3_H: u16 = 0x0,
    }),
    /// capture/compare register 4
    /// offset: 0x40
    CCR4: mmio.Mmio(packed struct(u32) {
        /// Low Capture/Compare value
        CCR4_L: u16 = 0x0,
        /// High Capture/Compare value
        CCR4_H: u16 = 0x0,
    }),
    /// offset: 0x44
    reserved68: [4]u8,
    /// DMA control register
    /// offset: 0x48
    DCR: mmio.Mmio(packed struct(u32) {
        /// DMA base address
        DBA: u5 = 0x0,
        reserved8: u3 = 0,
        /// DMA burst length
        DBL: u5 = 0x0,
        padding: u19 = 0,
    }),
    /// DMA address for full transfer
    /// offset: 0x4c
    DMAR: mmio.Mmio(packed struct(u32) {
        /// DMA register for burst accesses
        DMAB: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// TIM5 option register
    /// offset: 0x50
    OR: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// Timer Input 4 remap
        IT4_RMP: u2 = 0x0,
        padding: u24 = 0,
    }),
};
