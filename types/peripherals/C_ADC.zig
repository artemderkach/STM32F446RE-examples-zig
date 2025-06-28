const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Common ADC registers
pub const C_ADC = extern struct {
    /// ADC Common status register
    /// offset: 0x00
    CSR: mmio.Mmio(packed struct(u32) {
        /// Analog watchdog flag of ADC 1
        AWD1: u1,
        /// End of conversion of ADC 1
        EOC1: u1,
        /// Injected channel end of conversion of ADC 1
        JEOC1: u1,
        /// Injected channel Start flag of ADC 1
        JSTRT1: u1,
        /// Regular channel Start flag of ADC 1
        STRT1: u1,
        /// Overrun flag of ADC 1
        OVR1: u1,
        reserved8: u2 = 0,
        /// Analog watchdog flag of ADC 2
        AWD2: u1,
        /// End of conversion of ADC 2
        EOC2: u1,
        /// Injected channel end of conversion of ADC 2
        JEOC2: u1,
        /// Injected channel Start flag of ADC 2
        JSTRT2: u1,
        /// Regular channel Start flag of ADC 2
        STRT2: u1,
        /// Overrun flag of ADC 2
        OVR2: u1,
        reserved16: u2 = 0,
        /// Analog watchdog flag of ADC 3
        AWD3: u1,
        /// End of conversion of ADC 3
        EOC3: u1,
        /// Injected channel end of conversion of ADC 3
        JEOC3: u1,
        /// Injected channel Start flag of ADC 3
        JSTRT3: u1,
        /// Regular channel Start flag of ADC 3
        STRT3: u1,
        /// Overrun flag of ADC3
        OVR3: u1,
        padding: u10 = 0,
    }),
    /// ADC common control register
    /// offset: 0x04
    CCR: mmio.Mmio(packed struct(u32) {
        /// Multi ADC mode selection
        MULT: u5,
        reserved8: u3 = 0,
        /// Delay between 2 sampling phases
        DELAY: u4,
        reserved13: u1 = 0,
        /// DMA disable selection for multi-ADC mode
        DDS: u1,
        /// Direct memory access mode for multi ADC mode
        DMA: u2,
        /// ADC prescaler
        ADCPRE: u2,
        reserved22: u4 = 0,
        /// VBAT enable
        VBATE: u1,
        /// Temperature sensor and VREFINT enable
        TSVREFE: u1,
        padding: u8 = 0,
    }),
    /// ADC common regular data register for dual and triple modes
    /// offset: 0x08
    CDR: mmio.Mmio(packed struct(u32) {
        /// 1st data item of a pair of regular conversions
        DATA1: u16,
        /// 2nd data item of a pair of regular conversions
        DATA2: u16,
    }),
};
