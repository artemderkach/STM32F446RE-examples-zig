const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// FLASH
pub const FLASH = extern struct {
    /// Flash access control register
    /// offset: 0x00
    ACR: mmio.Mmio(packed struct(u32) {
        /// Latency
        LATENCY: u3 = 0x0,
        reserved8: u5 = 0,
        /// Prefetch enable
        PRFTEN: u1 = 0x0,
        /// Instruction cache enable
        ICEN: u1 = 0x0,
        /// Data cache enable
        DCEN: u1 = 0x0,
        /// Instruction cache reset
        ICRST: u1 = 0x0,
        /// Data cache reset
        DCRST: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// Flash key register
    /// offset: 0x04
    KEYR: mmio.Mmio(packed struct(u32) {
        /// FPEC key
        KEY: u32 = 0x0,
    }),
    /// Flash option key register
    /// offset: 0x08
    OPTKEYR: mmio.Mmio(packed struct(u32) {
        /// Option byte key
        OPTKEY: u32 = 0x0,
    }),
    /// Status register
    /// offset: 0x0c
    SR: mmio.Mmio(packed struct(u32) {
        /// End of operation
        EOP: u1 = 0x0,
        /// Operation error
        OPERR: u1 = 0x0,
        reserved4: u2 = 0,
        /// Write protection error
        WRPERR: u1 = 0x0,
        /// Programming alignment error
        PGAERR: u1 = 0x0,
        /// Programming parallelism error
        PGPERR: u1 = 0x0,
        /// Programming sequence error
        PGSERR: u1 = 0x0,
        /// Read Protection Error
        RDERR: u1 = 0x0,
        reserved16: u7 = 0,
        /// Busy
        BSY: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// Control register
    /// offset: 0x10
    CR: mmio.Mmio(packed struct(u32) {
        /// Programming
        PG: u1 = 0x0,
        /// Sector Erase
        SER: u1 = 0x0,
        /// Mass Erase of sectors 0 to 11
        MER: u1 = 0x0,
        /// Sector number
        SNB: u4 = 0x0,
        reserved8: u1 = 0,
        /// Program size
        PSIZE: u2 = 0x0,
        reserved16: u6 = 0,
        /// Start
        STRT: u1 = 0x0,
        reserved24: u7 = 0,
        /// End of operation interrupt enable
        EOPIE: u1 = 0x0,
        /// Error interrupt enable
        ERRIE: u1 = 0x0,
        reserved31: u5 = 0,
        /// Lock
        LOCK: u1 = 0x1,
    }),
    /// Flash option control register
    /// offset: 0x14
    OPTCR: mmio.Mmio(packed struct(u32) {
        /// Option lock
        OPTLOCK: u1 = 0x1,
        /// Option start
        OPTSTRT: u1 = 0x0,
        /// BOR reset Level
        BOR_LEV: u2 = 0x3,
        reserved5: u1 = 0,
        /// WDG_SW User option bytes
        WDG_SW: u1 = 0x1,
        /// nRST_STOP User option bytes
        nRST_STOP: u1 = 0x1,
        /// nRST_STDBY User option bytes
        nRST_STDBY: u1 = 0x1,
        /// Read protect
        RDP: u8 = 0xAA,
        /// Not write protect
        nWRP: u8 = 0xFF,
        reserved31: u7 = 0,
        /// Selection of Protection Mode of nWPRi bits
        SPRMOD: u1 = 0x0,
    }),
};
