const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Analog-to-digital converter
pub const ADC1 = extern struct {
    /// status register
    /// offset: 0x00
    SR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog flag
        AWD: u1 = 0x0,
        /// Regular channel end of conversion
        EOC: u1 = 0x0,
        /// Injected channel end of conversion
        JEOC: u1 = 0x0,
        /// Injected channel start flag
        JSTRT: u1 = 0x0,
        /// Regular channel start flag
        STRT: u1 = 0x0,
        /// Overrun
        OVR: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// control register 1
    /// offset: 0x04
    CR1: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog channel select bits
        AWDCH: u5 = 0x0,
        /// Interrupt enable for EOC
        EOCIE: u1 = 0x0,
        /// Analog watchdog interrupt enable
        AWDIE: u1 = 0x0,
        /// Interrupt enable for injected channels
        JEOCIE: u1 = 0x0,
        /// Scan mode
        SCAN: u1 = 0x0,
        /// Enable the watchdog on a single channel in scan mode
        AWDSGL: u1 = 0x0,
        /// Automatic injected group conversion
        JAUTO: u1 = 0x0,
        /// Discontinuous mode on regular channels
        DISCEN: u1 = 0x0,
        /// Discontinuous mode on injected channels
        JDISCEN: u1 = 0x0,
        /// Discontinuous mode channel count
        DISCNUM: u3 = 0x0,
        reserved22: u6 = 0,
        /// Analog watchdog enable on injected channels
        JAWDEN: u1 = 0x0,
        /// Analog watchdog enable on regular channels
        AWDEN: u1 = 0x0,
        /// Resolution
        RES: u2 = 0x0,
        /// Overrun interrupt enable
        OVRIE: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// control register 2
    /// offset: 0x08
    CR2: mmio.Mmio(packed struct(u32) {
        /// A/D Converter ON / OFF
        ADON: u1 = 0x0,
        /// Continuous conversion
        CONT: u1 = 0x0,
        reserved8: u6 = 0,
        /// Direct memory access mode (for single ADC mode)
        DMA: u1 = 0x0,
        /// DMA disable selection (for single ADC mode)
        DDS: u1 = 0x0,
        /// End of conversion selection
        EOCS: u1 = 0x0,
        /// Data alignment
        ALIGN: u1 = 0x0,
        reserved16: u4 = 0,
        /// External event select for injected group
        JEXTSEL: u4 = 0x0,
        /// External trigger enable for injected channels
        JEXTEN: u2 = 0x0,
        /// Start conversion of injected channels
        JSWSTART: u1 = 0x0,
        reserved24: u1 = 0,
        /// External event select for regular group
        EXTSEL: u4 = 0x0,
        /// External trigger enable for regular channels
        EXTEN: u2 = 0x0,
        /// Start conversion of regular channels
        SWSTART: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// sample time register 1
    /// offset: 0x0c
    SMPR1: mmio.Mmio(packed struct(u32) {
        /// Sample time bits
        SMPx_x: u32 = 0x0,
    }),
    /// sample time register 2
    /// offset: 0x10
    SMPR2: mmio.Mmio(packed struct(u32) {
        /// Sample time bits
        SMPx_x: u32 = 0x0,
    }),
    /// injected channel data offset register x
    /// offset: 0x14
    JOFR1: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET1: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x18
    JOFR2: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET2: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x1c
    JOFR3: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET3: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// injected channel data offset register x
    /// offset: 0x20
    JOFR4: mmio.Mmio(packed struct(u32) {
        /// Data offset for injected channel x
        JOFFSET4: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// watchdog higher threshold register
    /// offset: 0x24
    HTR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog higher threshold
        HT: u12 = 0xFFF,
        padding: u20 = 0,
    }),
    /// watchdog lower threshold register
    /// offset: 0x28
    LTR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog lower threshold
        LT: u12 = 0x0,
        padding: u20 = 0,
    }),
    /// regular sequence register 1
    /// offset: 0x2c
    SQR1: mmio.Mmio(packed struct(u32) {
        /// 13th conversion in regular sequence
        SQ13: u5 = 0x0,
        /// 14th conversion in regular sequence
        SQ14: u5 = 0x0,
        /// 15th conversion in regular sequence
        SQ15: u5 = 0x0,
        /// 16th conversion in regular sequence
        SQ16: u5 = 0x0,
        /// Regular channel sequence length
        L: u4 = 0x0,
        padding: u8 = 0,
    }),
    /// regular sequence register 2
    /// offset: 0x30
    SQR2: mmio.Mmio(packed struct(u32) {
        /// 7th conversion in regular sequence
        SQ7: u5 = 0x0,
        /// 8th conversion in regular sequence
        SQ8: u5 = 0x0,
        /// 9th conversion in regular sequence
        SQ9: u5 = 0x0,
        /// 10th conversion in regular sequence
        SQ10: u5 = 0x0,
        /// 11th conversion in regular sequence
        SQ11: u5 = 0x0,
        /// 12th conversion in regular sequence
        SQ12: u5 = 0x0,
        padding: u2 = 0,
    }),
    /// regular sequence register 3
    /// offset: 0x34
    SQR3: mmio.Mmio(packed struct(u32) {
        /// 1st conversion in regular sequence
        SQ1: u5 = 0x0,
        /// 2nd conversion in regular sequence
        SQ2: u5 = 0x0,
        /// 3rd conversion in regular sequence
        SQ3: u5 = 0x0,
        /// 4th conversion in regular sequence
        SQ4: u5 = 0x0,
        /// 5th conversion in regular sequence
        SQ5: u5 = 0x0,
        /// 6th conversion in regular sequence
        SQ6: u5 = 0x0,
        padding: u2 = 0,
    }),
    /// injected sequence register
    /// offset: 0x38
    JSQR: mmio.Mmio(packed struct(u32) {
        /// 1st conversion in injected sequence
        JSQ1: u5 = 0x0,
        /// 2nd conversion in injected sequence
        JSQ2: u5 = 0x0,
        /// 3rd conversion in injected sequence
        JSQ3: u5 = 0x0,
        /// 4th conversion in injected sequence
        JSQ4: u5 = 0x0,
        /// Injected sequence length
        JL: u2 = 0x0,
        padding: u10 = 0,
    }),
    /// injected data register x
    /// offset: 0x3c
    JDR1: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x40
    JDR2: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x44
    JDR3: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// injected data register x
    /// offset: 0x48
    JDR4: mmio.Mmio(packed struct(u32) {
        /// Injected data
        JDATA: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// regular data register
    /// offset: 0x4c
    DR: mmio.Mmio(packed struct(u32) {
        /// Regular data
        DATA: u16 = 0x0,
        padding: u16 = 0,
    }),
};
