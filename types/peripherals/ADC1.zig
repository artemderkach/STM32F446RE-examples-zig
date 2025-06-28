const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Analog-to-digital converter
pub const ADC1 = extern struct {
    /// status register
    /// offset: 0x00
    SR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog flag
        AWD: u1,
        /// Regular channel end of conversion
        EOC: u1,
        /// Injected channel end of conversion
        JEOC: u1,
        /// Injected channel start flag
        JSTRT: u1,
        /// Regular channel start flag
        STRT: u1,
        /// Overrun
        OVR: u1,
        padding: u26 = 0,
    }),
    /// control register 1
    /// offset: 0x04
    CR1: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog channel select bits
        AWDCH: u5,
        /// Interrupt enable for EOC
        EOCIE: u1,
        /// Analog watchdog interrupt enable
        AWDIE: u1,
        /// Interrupt enable for injected channels
        JEOCIE: u1,
        /// Scan mode
        SCAN: u1,
        /// Enable the watchdog on a single channel in scan mode
        AWDSGL: u1,
        /// Automatic injected group conversion
        JAUTO: u1,
        /// Discontinuous mode on regular channels
        DISCEN: u1,
        /// Discontinuous mode on injected channels
        JDISCEN: u1,
        /// Discontinuous mode channel count
        DISCNUM: u3,
        reserved22: u6 = 0,
        /// Analog watchdog enable on injected channels
        JAWDEN: u1,
        /// Analog watchdog enable on regular channels
        AWDEN: u1,
        /// Resolution
        RES: u2,
        /// Overrun interrupt enable
        OVRIE: u1,
        padding: u5 = 0,
    }),
    /// control register 2
    /// offset: 0x08
    CR2: mmio.Mmio(packed struct(u32) {
        /// A/D Converter ON / OFF
        ADON: u1,
        /// Continuous conversion
        CONT: u1,
        reserved8: u6 = 0,
        /// Direct memory access mode (for single ADC mode)
        DMA: u1,
        /// DMA disable selection (for single ADC mode)
        DDS: u1,
        /// End of conversion selection
        EOCS: u1,
        /// Data alignment
        ALIGN: u1,
        reserved16: u4 = 0,
        /// External event select for injected group
        JEXTSEL: u4,
        /// External trigger enable for injected channels
        JEXTEN: u2,
        /// Start conversion of injected channels
        JSWSTART: u1,
        reserved24: u1 = 0,
        /// External event select for regular group
        EXTSEL: u4,
        /// External trigger enable for regular channels
        EXTEN: u2,
        /// Start conversion of regular channels
        SWSTART: u1,
        padding: u1 = 0,
    }),
    /// sample time register 1
    /// offset: 0x0c
    SMPR1: mmio.Mmio(packed struct(u32) {
        /// Sample time bits
        SMPx_x: u32,
    }),
    /// sample time register 2
    /// offset: 0x10
    SMPR2: mmio.Mmio(packed struct(u32) {
        /// Sample time bits
        SMPx_x: u32,
    }),
    /// injected channel data offset register x
    /// offset: 0x14
    JOFR1: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET1: u12,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x18
    JOFR2: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET2: u12,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x1c
    JOFR3: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET3: u12,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x20
    JOFR4: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET4: u12,
        padding: u20 = 0,
    }),
    /// watchdog higher threshold register
    /// offset: 0x24
    HTR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog higher threshold
        HT: u12,
        padding: u20 = 0,
    }),
    /// watchdog lower threshold register
    /// offset: 0x28
    LTR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog lower threshold
        LT: u12,
        padding: u20 = 0,
    }),
    /// regular sequence register 1
    /// offset: 0x2c
    SQR1: mmio.Mmio(packed struct(u32) {
        /// 13th conversion in regular sequence
        SQ13: u5,
        /// 14th conversion in regular sequence
        SQ14: u5,
        /// 15th conversion in regular sequence
        SQ15: u5,
        /// 16th conversion in regular sequence
        SQ16: u5,
        /// Regular channel sequence length
        L: u4,
        padding: u8 = 0,
    }),
    /// regular sequence register 2
    /// offset: 0x30
    SQR2: mmio.Mmio(packed struct(u32) {
        /// 7th conversion in regular sequence
        SQ7: u5,
        /// 8th conversion in regular sequence
        SQ8: u5,
        /// 9th conversion in regular sequence
        SQ9: u5,
        /// 10th conversion in regular sequence
        SQ10: u5,
        /// 11th conversion in regular sequence
        SQ11: u5,
        /// 12th conversion in regular sequence
        SQ12: u5,
        padding: u2 = 0,
    }),
    /// regular sequence register 3
    /// offset: 0x34
    SQR3: mmio.Mmio(packed struct(u32) {
        /// 1st conversion in regular sequence
        SQ1: u5,
        /// 2nd conversion in regular sequence
        SQ2: u5,
        /// 3rd conversion in regular sequence
        SQ3: u5,
        /// 4th conversion in regular sequence
        SQ4: u5,
        /// 5th conversion in regular sequence
        SQ5: u5,
        /// 6th conversion in regular sequence
        SQ6: u5,
        padding: u2 = 0,
    }),
    /// injected sequence register
    /// offset: 0x38
    JSQR: mmio.Mmio(packed struct(u32) {
        /// 1st conversion in injected sequence
        JSQ1: u5,
        /// 2nd conversion in injected sequence
        JSQ2: u5,
        /// 3rd conversion in injected sequence
        JSQ3: u5,
        /// 4th conversion in injected sequence
        JSQ4: u5,
        /// Injected sequence length
        JL: u2,
        padding: u10 = 0,
    }),
    /// injected data register x
    /// offset: 0x3c
    JDR1: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x40
    JDR2: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x44
    JDR3: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x48
    JDR4: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16,
        padding: u16 = 0,
    }),
    /// regular data register
    /// offset: 0x4c
    DR: mmio.Mmio(packed struct(u32) {
        /// Regular data
        DATA: u16,
        padding: u16 = 0,
    }),
};
