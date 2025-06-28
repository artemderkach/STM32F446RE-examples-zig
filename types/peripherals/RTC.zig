const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Real-time clock
pub const RTC = extern struct {
    /// time register
    /// offset: 0x00
    TR: mmio.Mmio(packed struct(u32) {
        /// Second units in BCD format
        SU: u4,
        /// Second tens in BCD format
        ST: u3,
        reserved8: u1 = 0,
        /// Minute units in BCD format
        MNU: u4,
        /// Minute tens in BCD format
        MNT: u3,
        reserved16: u1 = 0,
        /// Hour units in BCD format
        HU: u4,
        /// Hour tens in BCD format
        HT: u2,
        /// AM/PM notation
        PM: u1,
        padding: u9 = 0,
    }),
    /// date register
    /// offset: 0x04
    DR: mmio.Mmio(packed struct(u32) {
        /// Date units in BCD format
        DU: u4,
        /// Date tens in BCD format
        DT: u2,
        reserved8: u2 = 0,
        /// Month units in BCD format
        MU: u4,
        /// Month tens in BCD format
        MT: u1,
        /// Week day units
        WDU: u3,
        /// Year units in BCD format
        YU: u4,
        /// Year tens in BCD format
        YT: u4,
        padding: u8 = 0,
    }),
    /// control register
    /// offset: 0x08
    CR: mmio.Mmio(packed struct(u32) {
        /// Wakeup clock selection
        WCKSEL: u3,
        /// Time-stamp event active edge
        TSEDGE: u1,
        /// Reference clock detection enable (50 or 60 Hz)
        REFCKON: u1,
        reserved6: u1 = 0,
        /// Hour format
        FMT: u1,
        /// Coarse digital calibration enable
        DCE: u1,
        /// Alarm A enable
        ALRAE: u1,
        /// Alarm B enable
        ALRBE: u1,
        /// Wakeup timer enable
        WUTE: u1,
        /// Time stamp enable
        TSE: u1,
        /// Alarm A interrupt enable
        ALRAIE: u1,
        /// Alarm B interrupt enable
        ALRBIE: u1,
        /// Wakeup timer interrupt enable
        WUTIE: u1,
        /// Time-stamp interrupt enable
        TSIE: u1,
        /// Add 1 hour (summer time change)
        ADD1H: u1,
        /// Subtract 1 hour (winter time change)
        SUB1H: u1,
        /// Backup
        BKP: u1,
        reserved20: u1 = 0,
        /// Output polarity
        POL: u1,
        /// Output selection
        OSEL: u2,
        /// Calibration output enable
        COE: u1,
        padding: u8 = 0,
    }),
    /// initialization and status register
    /// offset: 0x0c
    ISR: mmio.Mmio(packed struct(u32) {
        /// Alarm A write flag
        ALRAWF: u1,
        /// Alarm B write flag
        ALRBWF: u1,
        /// Wakeup timer write flag
        WUTWF: u1,
        /// Shift operation pending
        SHPF: u1,
        /// Initialization status flag
        INITS: u1,
        /// Registers synchronization flag
        RSF: u1,
        /// Initialization flag
        INITF: u1,
        /// Initialization mode
        INIT: u1,
        /// Alarm A flag
        ALRAF: u1,
        /// Alarm B flag
        ALRBF: u1,
        /// Wakeup timer flag
        WUTF: u1,
        /// Time-stamp flag
        TSF: u1,
        /// Time-stamp overflow flag
        TSOVF: u1,
        /// Tamper detection flag
        TAMP1F: u1,
        /// TAMPER2 detection flag
        TAMP2F: u1,
        reserved16: u1 = 0,
        /// Recalibration pending Flag
        RECALPF: u1,
        padding: u15 = 0,
    }),
    /// prescaler register
    /// offset: 0x10
    PRER: mmio.Mmio(packed struct(u32) {
        /// Synchronous prescaler factor
        PREDIV_S: u15,
        reserved16: u1 = 0,
        /// Asynchronous prescaler factor
        PREDIV_A: u7,
        padding: u9 = 0,
    }),
    /// wakeup timer register
    /// offset: 0x14
    WUTR: mmio.Mmio(packed struct(u32) {
        /// Wakeup auto-reload value bits
        WUT: u16,
        padding: u16 = 0,
    }),
    /// calibration register
    /// offset: 0x18
    CALIBR: mmio.Mmio(packed struct(u32) {
        /// Digital calibration
        DC: u5,
        reserved7: u2 = 0,
        /// Digital calibration sign
        DCS: u1,
        padding: u24 = 0,
    }),
    /// alarm A register
    /// offset: 0x1c
    ALRMAR: mmio.Mmio(packed struct(u32) {
        /// Second units in BCD format
        SU: u4,
        /// Second tens in BCD format
        ST: u3,
        /// Alarm A seconds mask
        MSK1: u1,
        /// Minute units in BCD format
        MNU: u4,
        /// Minute tens in BCD format
        MNT: u3,
        /// Alarm A minutes mask
        MSK2: u1,
        /// Hour units in BCD format
        HU: u4,
        /// Hour tens in BCD format
        HT: u2,
        /// AM/PM notation
        PM: u1,
        /// Alarm A hours mask
        MSK3: u1,
        /// Date units or day in BCD format
        DU: u4,
        /// Date tens in BCD format
        DT: u2,
        /// Week day selection
        WDSEL: u1,
        /// Alarm A date mask
        MSK4: u1,
    }),
    /// alarm B register
    /// offset: 0x20
    ALRMBR: mmio.Mmio(packed struct(u32) {
        /// Second units in BCD format
        SU: u4,
        /// Second tens in BCD format
        ST: u3,
        /// Alarm B seconds mask
        MSK1: u1,
        /// Minute units in BCD format
        MNU: u4,
        /// Minute tens in BCD format
        MNT: u3,
        /// Alarm B minutes mask
        MSK2: u1,
        /// Hour units in BCD format
        HU: u4,
        /// Hour tens in BCD format
        HT: u2,
        /// AM/PM notation
        PM: u1,
        /// Alarm B hours mask
        MSK3: u1,
        /// Date units or day in BCD format
        DU: u4,
        /// Date tens in BCD format
        DT: u2,
        /// Week day selection
        WDSEL: u1,
        /// Alarm B date mask
        MSK4: u1,
    }),
    /// write protection register
    /// offset: 0x24
    WPR: mmio.Mmio(packed struct(u32) {
        /// Write protection key
        KEY: u8,
        padding: u24 = 0,
    }),
    /// sub second register
    /// offset: 0x28
    SSR: mmio.Mmio(packed struct(u32) {
        /// Sub second value
        SS: u16,
        padding: u16 = 0,
    }),
    /// shift control register
    /// offset: 0x2c
    SHIFTR: mmio.Mmio(packed struct(u32) {
        /// Subtract a fraction of a second
        SUBFS: u15,
        reserved31: u16 = 0,
        /// Add one second
        ADD1S: u1,
    }),
    /// time stamp time register
    /// offset: 0x30
    TSTR: mmio.Mmio(packed struct(u32) {
        /// Tamper 1 detection enable
        TAMP1E: u1,
        /// Active level for tamper 1
        TAMP1TRG: u1,
        /// Tamper interrupt enable
        TAMPIE: u1,
        reserved16: u13 = 0,
        /// TAMPER1 mapping
        TAMP1INSEL: u1,
        /// TIMESTAMP mapping
        TSINSEL: u1,
        /// AFO_ALARM output type
        ALARMOUTTYPE: u1,
        padding: u13 = 0,
    }),
    /// time stamp date register
    /// offset: 0x34
    TSDR: mmio.Mmio(packed struct(u32) {
        /// Date units in BCD format
        DU: u4,
        /// Date tens in BCD format
        DT: u2,
        reserved8: u2 = 0,
        /// Month units in BCD format
        MU: u4,
        /// Month tens in BCD format
        MT: u1,
        /// Week day units
        WDU: u3,
        padding: u16 = 0,
    }),
    /// timestamp sub second register
    /// offset: 0x38
    TSSSR: mmio.Mmio(packed struct(u32) {
        /// Sub second value
        SS: u16,
        padding: u16 = 0,
    }),
    /// calibration register
    /// offset: 0x3c
    CALR: mmio.Mmio(packed struct(u32) {
        /// Calibration minus
        CALM: u9,
        reserved13: u4 = 0,
        /// Use a 16-second calibration cycle period
        CALW16: u1,
        /// Use an 8-second calibration cycle period
        CALW8: u1,
        /// Increase frequency of RTC by 488.5 ppm
        CALP: u1,
        padding: u16 = 0,
    }),
    /// tamper and alternate function configuration register
    /// offset: 0x40
    TAFCR: mmio.Mmio(packed struct(u32) {
        /// Tamper 1 detection enable
        TAMP1E: u1,
        /// Active level for tamper 1
        TAMP1TRG: u1,
        /// Tamper interrupt enable
        TAMPIE: u1,
        /// Tamper 2 detection enable
        TAMP2E: u1,
        /// Active level for tamper 2
        TAMP2TRG: u1,
        reserved7: u2 = 0,
        /// Activate timestamp on tamper detection event
        TAMPTS: u1,
        /// Tamper sampling frequency
        TAMPFREQ: u3,
        /// Tamper filter count
        TAMPFLT: u2,
        /// Tamper precharge duration
        TAMPPRCH: u2,
        /// TAMPER pull-up disable
        TAMPPUDIS: u1,
        /// TAMPER1 mapping
        TAMP1INSEL: u1,
        /// TIMESTAMP mapping
        TSINSEL: u1,
        /// AFO_ALARM output type
        ALARMOUTTYPE: u1,
        padding: u13 = 0,
    }),
    /// alarm A sub second register
    /// offset: 0x44
    ALRMASSR: mmio.Mmio(packed struct(u32) {
        /// Sub seconds value
        SS: u15,
        reserved24: u9 = 0,
        /// Mask the most-significant bits starting at this bit
        MASKSS: u4,
        padding: u4 = 0,
    }),
    /// alarm B sub second register
    /// offset: 0x48
    ALRMBSSR: mmio.Mmio(packed struct(u32) {
        /// Sub seconds value
        SS: u15,
        reserved24: u9 = 0,
        /// Mask the most-significant bits starting at this bit
        MASKSS: u4,
        padding: u4 = 0,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// backup register
    /// offset: 0x50
    BKP0R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x54
    BKP1R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x58
    BKP2R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x5c
    BKP3R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x60
    BKP4R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x64
    BKP5R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x68
    BKP6R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x6c
    BKP7R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x70
    BKP8R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x74
    BKP9R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x78
    BKP10R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x7c
    BKP11R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x80
    BKP12R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x84
    BKP13R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x88
    BKP14R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x8c
    BKP15R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x90
    BKP16R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x94
    BKP17R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x98
    BKP18R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
    /// backup register
    /// offset: 0x9c
    BKP19R: mmio.Mmio(packed struct(u32) {
        /// BKP
        BKP: u32,
    }),
};
