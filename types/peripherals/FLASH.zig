const mmio = @import("mmio");
const types = @import("../../types.zig");

/// FLASH
pub const FLASH = extern struct {
    /// Flash access control register
    /// offset: 0x00
    ACR: mmio.Mmio(packed struct(u32) {
        /// Latency
        LATENCY: u3,
        reserved8: u5 = 0,
        /// Prefetch enable
        PRFTEN: u1,
        /// Instruction cache enable
        ICEN: u1,
        /// Data cache enable
        DCEN: u1,
        /// Instruction cache reset
        ICRST: u1,
        /// Data cache reset
        DCRST: u1,
        padding: u19 = 0,
    }),
    /// Flash key register
    /// offset: 0x04
    KEYR: mmio.Mmio(packed struct(u32) {
        /// FPEC key
        KEY: u32,
    }),
    /// Flash option key register
    /// offset: 0x08
    OPTKEYR: mmio.Mmio(packed struct(u32) {
        /// Option byte key
        OPTKEY: u32,
    }),
    /// Status register
    /// offset: 0x0c
    SR: mmio.Mmio(packed struct(u32) {
        /// End of operation
        EOP: u1,
        /// Operation error
        OPERR: u1,
        reserved4: u2 = 0,
        /// Write protection error
        WRPERR: u1,
        /// Programming alignment error
        PGAERR: u1,
        /// Programming parallelism error
        PGPERR: u1,
        /// Programming sequence error
        PGSERR: u1,
        /// Read Protection Error
        RDERR: u1,
        reserved16: u7 = 0,
        /// Busy
        BSY: u1,
        padding: u15 = 0,
    }),
    /// Control register
    /// offset: 0x10
    CR: mmio.Mmio(packed struct(u32) {
        /// Programming
        PG: u1,
        /// Sector Erase
        SER: u1,
        /// Mass Erase of sectors 0 to 11
        MER: u1,
        /// Sector number
        SNB: u4,
        reserved8: u1 = 0,
        /// Program size
        PSIZE: u2,
        reserved16: u6 = 0,
        /// Start
        STRT: u1,
        reserved24: u7 = 0,
        /// End of operation interrupt enable
        EOPIE: u1,
        /// Error interrupt enable
        ERRIE: u1,
        reserved31: u5 = 0,
        /// Lock
        LOCK: u1,
    }),
    /// Flash option control register
    /// offset: 0x14
    OPTCR: mmio.Mmio(packed struct(u32) {
        /// Option lock
        OPTLOCK: u1,
        /// Option start
        OPTSTRT: u1,
        /// BOR reset Level
        BOR_LEV: u2,
        reserved5: u1 = 0,
        /// WDG_SW User option bytes
        WDG_SW: u1,
        /// nRST_STOP User option bytes
        nRST_STOP: u1,
        /// nRST_STDBY User option bytes
        nRST_STDBY: u1,
        /// Read protect
        RDP: u8,
        /// Not write protect
        nWRP: u8,
        reserved31: u7 = 0,
        /// Selection of Protection Mode of nWPRi bits
        SPRMOD: u1,
    }),
};
