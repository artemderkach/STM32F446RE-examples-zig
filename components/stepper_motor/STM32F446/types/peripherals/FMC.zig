const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Flexible memory controller
pub const FMC = extern struct {
    /// SRAM/NOR-Flash chip-select control register 1
    /// offset: 0x00
    BCR1: mmio.Mmio(packed struct(u32) {
        /// MBKEN
        MBKEN: u1 = 0x0,
        /// MUXEN
        MUXEN: u1 = 0x0,
        /// MTYP
        MTYP: u2 = 0x0,
        /// MWID
        MWID: u2 = 0x1,
        /// FACCEN
        FACCEN: u1 = 0x1,
        reserved8: u1 = 0,
        /// BURSTEN
        BURSTEN: u1 = 0x0,
        /// WAITPOL
        WAITPOL: u1 = 0x0,
        reserved11: u1 = 0,
        /// WAITCFG
        WAITCFG: u1 = 0x0,
        /// WREN
        WREN: u1 = 0x1,
        /// WAITEN
        WAITEN: u1 = 0x1,
        /// EXTMOD
        EXTMOD: u1 = 0x0,
        /// ASYNCWAIT
        ASYNCWAIT: u1 = 0x0,
        reserved19: u3 = 0,
        /// CBURSTRW
        CBURSTRW: u1 = 0x0,
        /// CCLKEN
        CCLKEN: u1 = 0x0,
        padding: u11 = 0,
    }),
    /// SRAM/NOR-Flash chip-select timing register 1
    /// offset: 0x04
    BTR1: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        /// BUSTURN
        BUSTURN: u4 = 0xF,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x3,
        padding: u2 = 0,
    }),
    /// SRAM/NOR-Flash chip-select control register 2
    /// offset: 0x08
    BCR2: mmio.Mmio(packed struct(u32) {
        /// MBKEN
        MBKEN: u1 = 0x0,
        /// MUXEN
        MUXEN: u1 = 0x0,
        /// MTYP
        MTYP: u2 = 0x0,
        /// MWID
        MWID: u2 = 0x1,
        /// FACCEN
        FACCEN: u1 = 0x1,
        reserved8: u1 = 0,
        /// BURSTEN
        BURSTEN: u1 = 0x0,
        /// WAITPOL
        WAITPOL: u1 = 0x0,
        /// WRAPMOD
        WRAPMOD: u1 = 0x0,
        /// WAITCFG
        WAITCFG: u1 = 0x0,
        /// WREN
        WREN: u1 = 0x1,
        /// WAITEN
        WAITEN: u1 = 0x1,
        /// EXTMOD
        EXTMOD: u1 = 0x0,
        /// ASYNCWAIT
        ASYNCWAIT: u1 = 0x0,
        reserved19: u3 = 0,
        /// CBURSTRW
        CBURSTRW: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// SRAM/NOR-Flash chip-select timing register 2
    /// offset: 0x0c
    BTR2: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        /// BUSTURN
        BUSTURN: u4 = 0xF,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x3,
        padding: u2 = 0,
    }),
    /// SRAM/NOR-Flash chip-select control register 3
    /// offset: 0x10
    BCR3: mmio.Mmio(packed struct(u32) {
        /// MBKEN
        MBKEN: u1 = 0x0,
        /// MUXEN
        MUXEN: u1 = 0x0,
        /// MTYP
        MTYP: u2 = 0x0,
        /// MWID
        MWID: u2 = 0x1,
        /// FACCEN
        FACCEN: u1 = 0x1,
        reserved8: u1 = 0,
        /// BURSTEN
        BURSTEN: u1 = 0x0,
        /// WAITPOL
        WAITPOL: u1 = 0x0,
        /// WRAPMOD
        WRAPMOD: u1 = 0x0,
        /// WAITCFG
        WAITCFG: u1 = 0x0,
        /// WREN
        WREN: u1 = 0x1,
        /// WAITEN
        WAITEN: u1 = 0x1,
        /// EXTMOD
        EXTMOD: u1 = 0x0,
        /// ASYNCWAIT
        ASYNCWAIT: u1 = 0x0,
        reserved19: u3 = 0,
        /// CBURSTRW
        CBURSTRW: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// SRAM/NOR-Flash chip-select timing register 3
    /// offset: 0x14
    BTR3: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        /// BUSTURN
        BUSTURN: u4 = 0xF,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x3,
        padding: u2 = 0,
    }),
    /// SRAM/NOR-Flash chip-select control register 4
    /// offset: 0x18
    BCR4: mmio.Mmio(packed struct(u32) {
        /// MBKEN
        MBKEN: u1 = 0x0,
        /// MUXEN
        MUXEN: u1 = 0x0,
        /// MTYP
        MTYP: u2 = 0x0,
        /// MWID
        MWID: u2 = 0x1,
        /// FACCEN
        FACCEN: u1 = 0x1,
        reserved8: u1 = 0,
        /// BURSTEN
        BURSTEN: u1 = 0x0,
        /// WAITPOL
        WAITPOL: u1 = 0x0,
        /// WRAPMOD
        WRAPMOD: u1 = 0x0,
        /// WAITCFG
        WAITCFG: u1 = 0x0,
        /// WREN
        WREN: u1 = 0x1,
        /// WAITEN
        WAITEN: u1 = 0x1,
        /// EXTMOD
        EXTMOD: u1 = 0x0,
        /// ASYNCWAIT
        ASYNCWAIT: u1 = 0x0,
        reserved19: u3 = 0,
        /// CBURSTRW
        CBURSTRW: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// SRAM/NOR-Flash chip-select timing register 4
    /// offset: 0x1c
    BTR4: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        /// BUSTURN
        BUSTURN: u4 = 0xF,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x3,
        padding: u2 = 0,
    }),
    /// offset: 0x20
    reserved32: [64]u8,
    /// PC Card/NAND Flash control register 2
    /// offset: 0x60
    PCR2: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// PWAITEN
        PWAITEN: u1 = 0x0,
        /// PBKEN
        PBKEN: u1 = 0x0,
        /// PTYP
        PTYP: u1 = 0x1,
        /// PWID
        PWID: u2 = 0x1,
        /// ECCEN
        ECCEN: u1 = 0x0,
        reserved9: u2 = 0,
        /// TCLR
        TCLR: u4 = 0x0,
        /// TAR
        TAR: u4 = 0x0,
        /// ECCPS
        ECCPS: u3 = 0x0,
        padding: u12 = 0,
    }),
    /// FIFO status and interrupt register 2
    /// offset: 0x64
    SR2: mmio.Mmio(packed struct(u32) {
        /// IRS
        IRS: u1 = 0x0,
        /// ILS
        ILS: u1 = 0x0,
        /// IFS
        IFS: u1 = 0x0,
        /// IREN
        IREN: u1 = 0x0,
        /// ILEN
        ILEN: u1 = 0x0,
        /// IFEN
        IFEN: u1 = 0x0,
        /// FEMPT
        FEMPT: u1 = 0x1,
        padding: u25 = 0,
    }),
    /// Common memory space timing register 2
    /// offset: 0x68
    PMEM2: mmio.Mmio(packed struct(u32) {
        /// MEMSETx
        MEMSETx: u8 = 0xFC,
        /// MEMWAITx
        MEMWAITx: u8 = 0xFC,
        /// MEMHOLDx
        MEMHOLDx: u8 = 0xFC,
        /// MEMHIZx
        MEMHIZx: u8 = 0xFC,
    }),
    /// Attribute memory space timing register 2
    /// offset: 0x6c
    PATT2: mmio.Mmio(packed struct(u32) {
        /// ATTSETx
        ATTSETx: u8 = 0xFC,
        /// ATTWAITx
        ATTWAITx: u8 = 0xFC,
        /// ATTHOLDx
        ATTHOLDx: u8 = 0xFC,
        /// ATTHIZx
        ATTHIZx: u8 = 0xFC,
    }),
    /// offset: 0x70
    reserved112: [4]u8,
    /// ECC result register 2
    /// offset: 0x74
    ECCR2: mmio.Mmio(packed struct(u32) {
        /// ECCx
        ECCx: u32 = 0x0,
    }),
    /// offset: 0x78
    reserved120: [8]u8,
    /// PC Card/NAND Flash control register 3
    /// offset: 0x80
    PCR3: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// PWAITEN
        PWAITEN: u1 = 0x0,
        /// PBKEN
        PBKEN: u1 = 0x0,
        /// PTYP
        PTYP: u1 = 0x1,
        /// PWID
        PWID: u2 = 0x1,
        /// ECCEN
        ECCEN: u1 = 0x0,
        reserved9: u2 = 0,
        /// TCLR
        TCLR: u4 = 0x0,
        /// TAR
        TAR: u4 = 0x0,
        /// ECCPS
        ECCPS: u3 = 0x0,
        padding: u12 = 0,
    }),
    /// FIFO status and interrupt register 3
    /// offset: 0x84
    SR3: mmio.Mmio(packed struct(u32) {
        /// IRS
        IRS: u1 = 0x0,
        /// ILS
        ILS: u1 = 0x0,
        /// IFS
        IFS: u1 = 0x0,
        /// IREN
        IREN: u1 = 0x0,
        /// ILEN
        ILEN: u1 = 0x0,
        /// IFEN
        IFEN: u1 = 0x0,
        /// FEMPT
        FEMPT: u1 = 0x1,
        padding: u25 = 0,
    }),
    /// Common memory space timing register 3
    /// offset: 0x88
    PMEM3: mmio.Mmio(packed struct(u32) {
        /// MEMSETx
        MEMSETx: u8 = 0xFC,
        /// MEMWAITx
        MEMWAITx: u8 = 0xFC,
        /// MEMHOLDx
        MEMHOLDx: u8 = 0xFC,
        /// MEMHIZx
        MEMHIZx: u8 = 0xFC,
    }),
    /// Attribute memory space timing register 3
    /// offset: 0x8c
    PATT3: mmio.Mmio(packed struct(u32) {
        /// ATTSETx
        ATTSETx: u8 = 0xFC,
        /// ATTWAITx
        ATTWAITx: u8 = 0xFC,
        /// ATTHOLDx
        ATTHOLDx: u8 = 0xFC,
        /// ATTHIZx
        ATTHIZx: u8 = 0xFC,
    }),
    /// offset: 0x90
    reserved144: [4]u8,
    /// ECC result register 3
    /// offset: 0x94
    ECCR3: mmio.Mmio(packed struct(u32) {
        /// ECCx
        ECCx: u32 = 0x0,
    }),
    /// offset: 0x98
    reserved152: [8]u8,
    /// PC Card/NAND Flash control register 4
    /// offset: 0xa0
    PCR4: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// PWAITEN
        PWAITEN: u1 = 0x0,
        /// PBKEN
        PBKEN: u1 = 0x0,
        /// PTYP
        PTYP: u1 = 0x1,
        /// PWID
        PWID: u2 = 0x1,
        /// ECCEN
        ECCEN: u1 = 0x0,
        reserved9: u2 = 0,
        /// TCLR
        TCLR: u4 = 0x0,
        /// TAR
        TAR: u4 = 0x0,
        /// ECCPS
        ECCPS: u3 = 0x0,
        padding: u12 = 0,
    }),
    /// FIFO status and interrupt register 4
    /// offset: 0xa4
    SR4: mmio.Mmio(packed struct(u32) {
        /// IRS
        IRS: u1 = 0x0,
        /// ILS
        ILS: u1 = 0x0,
        /// IFS
        IFS: u1 = 0x0,
        /// IREN
        IREN: u1 = 0x0,
        /// ILEN
        ILEN: u1 = 0x0,
        /// IFEN
        IFEN: u1 = 0x0,
        /// FEMPT
        FEMPT: u1 = 0x1,
        padding: u25 = 0,
    }),
    /// Common memory space timing register 4
    /// offset: 0xa8
    PMEM4: mmio.Mmio(packed struct(u32) {
        /// MEMSETx
        MEMSETx: u8 = 0xFC,
        /// MEMWAITx
        MEMWAITx: u8 = 0xFC,
        /// MEMHOLDx
        MEMHOLDx: u8 = 0xFC,
        /// MEMHIZx
        MEMHIZx: u8 = 0xFC,
    }),
    /// Attribute memory space timing register 4
    /// offset: 0xac
    PATT4: mmio.Mmio(packed struct(u32) {
        /// ATTSETx
        ATTSETx: u8 = 0xFC,
        /// ATTWAITx
        ATTWAITx: u8 = 0xFC,
        /// ATTHOLDx
        ATTHOLDx: u8 = 0xFC,
        /// ATTHIZx
        ATTHIZx: u8 = 0xFC,
    }),
    /// I/O space timing register 4
    /// offset: 0xb0
    PIO4: mmio.Mmio(packed struct(u32) {
        /// IOSETx
        IOSETx: u8 = 0xFC,
        /// IOWAITx
        IOWAITx: u8 = 0xFC,
        /// IOHOLDx
        IOHOLDx: u8 = 0xFC,
        /// IOHIZx
        IOHIZx: u8 = 0xFC,
    }),
    /// offset: 0xb4
    reserved180: [80]u8,
    /// SRAM/NOR-Flash write timing registers 1
    /// offset: 0x104
    BWTR1: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        reserved20: u4 = 0,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x108
    reserved264: [4]u8,
    /// SRAM/NOR-Flash write timing registers 2
    /// offset: 0x10c
    BWTR2: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        reserved20: u4 = 0,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x110
    reserved272: [4]u8,
    /// SRAM/NOR-Flash write timing registers 3
    /// offset: 0x114
    BWTR3: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        reserved20: u4 = 0,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x118
    reserved280: [4]u8,
    /// SRAM/NOR-Flash write timing registers 4
    /// offset: 0x11c
    BWTR4: mmio.Mmio(packed struct(u32) {
        /// ADDSET
        ADDSET: u4 = 0xF,
        /// ADDHLD
        ADDHLD: u4 = 0xF,
        /// DATAST
        DATAST: u8 = 0xFF,
        reserved20: u4 = 0,
        /// CLKDIV
        CLKDIV: u4 = 0xF,
        /// DATLAT
        DATLAT: u4 = 0xF,
        /// ACCMOD
        ACCMOD: u2 = 0x0,
        padding: u2 = 0,
    }),
    /// offset: 0x120
    reserved288: [32]u8,
    /// SDRAM Control Register 1
    /// offset: 0x140
    SDCR1: mmio.Mmio(packed struct(u32) {
        /// Number of column address bits
        NC: u2 = 0x0,
        /// Number of row address bits
        NR: u2 = 0x0,
        /// Memory data bus width
        MWID: u2 = 0x1,
        /// Number of internal banks
        NB: u1 = 0x1,
        /// CAS latency
        CAS: u2 = 0x1,
        /// Write protection
        WP: u1 = 0x1,
        /// SDRAM clock configuration
        SDCLK: u2 = 0x0,
        /// Burst read
        RBURST: u1 = 0x0,
        /// Read pipe
        RPIPE: u2 = 0x0,
        padding: u17 = 0,
    }),
    /// SDRAM Control Register 2
    /// offset: 0x144
    SDCR2: mmio.Mmio(packed struct(u32) {
        /// Number of column address bits
        NC: u2 = 0x0,
        /// Number of row address bits
        NR: u2 = 0x0,
        /// Memory data bus width
        MWID: u2 = 0x1,
        /// Number of internal banks
        NB: u1 = 0x1,
        /// CAS latency
        CAS: u2 = 0x1,
        /// Write protection
        WP: u1 = 0x1,
        /// SDRAM clock configuration
        SDCLK: u2 = 0x0,
        /// Burst read
        RBURST: u1 = 0x0,
        /// Read pipe
        RPIPE: u2 = 0x0,
        padding: u17 = 0,
    }),
    /// SDRAM Timing register 1
    /// offset: 0x148
    SDTR1: mmio.Mmio(packed struct(u32) {
        /// Load Mode Register to Active
        TMRD: u4 = 0xF,
        /// Exit self-refresh delay
        TXSR: u4 = 0xF,
        /// Self refresh time
        TRAS: u4 = 0xF,
        /// Row cycle delay
        TRC: u4 = 0xF,
        /// Recovery delay
        TWR: u4 = 0xF,
        /// Row precharge delay
        TRP: u4 = 0xF,
        /// Row to column delay
        TRCD: u4 = 0xF,
        padding: u4 = 0,
    }),
    /// SDRAM Timing register 2
    /// offset: 0x14c
    SDTR2: mmio.Mmio(packed struct(u32) {
        /// Load Mode Register to Active
        TMRD: u4 = 0xF,
        /// Exit self-refresh delay
        TXSR: u4 = 0xF,
        /// Self refresh time
        TRAS: u4 = 0xF,
        /// Row cycle delay
        TRC: u4 = 0xF,
        /// Recovery delay
        TWR: u4 = 0xF,
        /// Row precharge delay
        TRP: u4 = 0xF,
        /// Row to column delay
        TRCD: u4 = 0xF,
        padding: u4 = 0,
    }),
    /// SDRAM Command Mode register
    /// offset: 0x150
    SDCMR: mmio.Mmio(packed struct(u32) {
        /// Command mode
        MODE: u3 = 0x0,
        /// Command target bank 2
        CTB2: u1 = 0x0,
        /// Command target bank 1
        CTB1: u1 = 0x0,
        /// Number of Auto-refresh
        NRFS: u4 = 0x0,
        /// Mode Register definition
        MRD: u13 = 0x0,
        padding: u10 = 0,
    }),
    /// SDRAM Refresh Timer register
    /// offset: 0x154
    SDRTR: mmio.Mmio(packed struct(u32) {
        /// Clear Refresh error flag
        CRE: u1 = 0x0,
        /// Refresh Timer Count
        COUNT: u13 = 0x0,
        /// RES Interrupt Enable
        REIE: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// SDRAM Status register
    /// offset: 0x158
    SDSR: mmio.Mmio(packed struct(u32) {
        /// Refresh error flag
        RE: u1 = 0x0,
        /// Status Mode for Bank 1
        MODES1: u2 = 0x0,
        /// Status Mode for Bank 2
        MODES2: u2 = 0x0,
        /// Busy status
        BUSY: u1 = 0x0,
        padding: u26 = 0,
    }),
};
