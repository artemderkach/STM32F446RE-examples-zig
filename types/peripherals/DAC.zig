const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Digital-to-analog converter
pub const DAC = extern struct {
    /// control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 enable
        EN1: u1,
        /// DAC channel1 output buffer disable
        BOFF1: u1,
        /// DAC channel1 trigger enable
        TEN1: u1,
        /// DAC channel1 trigger selection
        TSEL1: u3,
        /// DAC channel1 noise/triangle wave generation enable
        WAVE1: u2,
        /// DAC channel1 mask/amplitude selector
        MAMP1: u4,
        /// DAC channel1 DMA enable
        DMAEN1: u1,
        /// DAC channel1 DMA Underrun Interrupt enable
        DMAUDRIE1: u1,
        reserved16: u2 = 0,
        /// DAC channel2 enable
        EN2: u1,
        /// DAC channel2 output buffer disable
        BOFF2: u1,
        /// DAC channel2 trigger enable
        TEN2: u1,
        /// DAC channel2 trigger selection
        TSEL2: u3,
        /// DAC channel2 noise/triangle wave generation enable
        WAVE2: u2,
        /// DAC channel2 mask/amplitude selector
        MAMP2: u4,
        /// DAC channel2 DMA enable
        DMAEN2: u1,
        /// DAC channel2 DMA underrun interrupt enable
        DMAUDRIE2: u1,
        padding: u2 = 0,
    }),
    /// software trigger register
    /// offset: 0x04
    SWTRIGR: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 software trigger
        SWTRIG1: u1,
        /// DAC channel2 software trigger
        SWTRIG2: u1,
        padding: u30 = 0,
    }),
    /// channel1 12-bit right-aligned data holding register
    /// offset: 0x08
    DHR12R1: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 12-bit right-aligned data
        DACC1DHR: u12,
        padding: u20 = 0,
    }),
    /// channel1 12-bit left aligned data holding register
    /// offset: 0x0c
    DHR12L1: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// DAC channel1 12-bit left-aligned data
        DACC1DHR: u12,
        padding: u16 = 0,
    }),
    /// channel1 8-bit right aligned data holding register
    /// offset: 0x10
    DHR8R1: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 8-bit right-aligned data
        DACC1DHR: u8,
        padding: u24 = 0,
    }),
    /// channel2 12-bit right aligned data holding register
    /// offset: 0x14
    DHR12R2: mmio.Mmio(packed struct(u32) {
        /// DAC channel2 12-bit right-aligned data
        DACC2DHR: u12,
        padding: u20 = 0,
    }),
    /// channel2 12-bit left aligned data holding register
    /// offset: 0x18
    DHR12L2: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// DAC channel2 12-bit left-aligned data
        DACC2DHR: u12,
        padding: u16 = 0,
    }),
    /// channel2 8-bit right-aligned data holding register
    /// offset: 0x1c
    DHR8R2: mmio.Mmio(packed struct(u32) {
        /// DAC channel2 8-bit right-aligned data
        DACC2DHR: u8,
        padding: u24 = 0,
    }),
    /// Dual DAC 12-bit right-aligned data holding register
    /// offset: 0x20
    DHR12RD: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 12-bit right-aligned data
        DACC1DHR: u12,
        reserved16: u4 = 0,
        /// DAC channel2 12-bit right-aligned data
        DACC2DHR: u12,
        padding: u4 = 0,
    }),
    /// DUAL DAC 12-bit left aligned data holding register
    /// offset: 0x24
    DHR12LD: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// DAC channel1 12-bit left-aligned data
        DACC1DHR: u12,
        reserved20: u4 = 0,
        /// DAC channel2 12-bit left-aligned data
        DACC2DHR: u12,
    }),
    /// DUAL DAC 8-bit right aligned data holding register
    /// offset: 0x28
    DHR8RD: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 8-bit right-aligned data
        DACC1DHR: u8,
        /// DAC channel2 8-bit right-aligned data
        DACC2DHR: u8,
        padding: u16 = 0,
    }),
    /// channel1 data output register
    /// offset: 0x2c
    DOR1: mmio.Mmio(packed struct(u32) {
        /// DAC channel1 data output
        DACC1DOR: u12,
        padding: u20 = 0,
    }),
    /// channel2 data output register
    /// offset: 0x30
    DOR2: mmio.Mmio(packed struct(u32) {
        /// DAC channel2 data output
        DACC2DOR: u12,
        padding: u20 = 0,
    }),
    /// status register
    /// offset: 0x34
    SR: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// DAC channel1 DMA underrun flag
        DMAUDR1: u1,
        reserved29: u15 = 0,
        /// DAC channel2 DMA underrun flag
        DMAUDR2: u1,
        padding: u2 = 0,
    }),
};
