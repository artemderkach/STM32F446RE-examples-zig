const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Controller area network
pub const CAN1 = extern struct {
    /// master control register
    /// offset: 0x00
    MCR: mmio.Mmio(packed struct(u32) {
        /// INRQ
        INRQ: u1 = 0x0,
        /// SLEEP
        SLEEP: u1 = 0x1,
        /// TXFP
        TXFP: u1 = 0x0,
        /// RFLM
        RFLM: u1 = 0x0,
        /// NART
        NART: u1 = 0x0,
        /// AWUM
        AWUM: u1 = 0x0,
        /// ABOM
        ABOM: u1 = 0x0,
        /// TTCM
        TTCM: u1 = 0x0,
        reserved15: u7 = 0,
        /// RESET
        RESET: u1 = 0x0,
        /// DBF
        DBF: u1 = 0x1,
        padding: u15 = 0,
    }),
    /// master status register
    /// offset: 0x04
    MSR: mmio.Mmio(packed struct(u32) {
        /// INAK
        INAK: u1 = 0x0,
        /// SLAK
        SLAK: u1 = 0x1,
        /// ERRI
        ERRI: u1 = 0x0,
        /// WKUI
        WKUI: u1 = 0x0,
        /// SLAKI
        SLAKI: u1 = 0x0,
        reserved8: u3 = 0,
        /// TXM
        TXM: u1 = 0x0,
        /// RXM
        RXM: u1 = 0x0,
        /// SAMP
        SAMP: u1 = 0x1,
        /// RX
        RX: u1 = 0x1,
        padding: u20 = 0,
    }),
    /// transmit status register
    /// offset: 0x08
    TSR: mmio.Mmio(packed struct(u32) {
        /// RQCP0
        RQCP0: u1 = 0x0,
        /// TXOK0
        TXOK0: u1 = 0x0,
        /// ALST0
        ALST0: u1 = 0x0,
        /// TERR0
        TERR0: u1 = 0x0,
        reserved7: u3 = 0,
        /// ABRQ0
        ABRQ0: u1 = 0x0,
        /// RQCP1
        RQCP1: u1 = 0x0,
        /// TXOK1
        TXOK1: u1 = 0x0,
        /// ALST1
        ALST1: u1 = 0x0,
        /// TERR1
        TERR1: u1 = 0x0,
        reserved15: u3 = 0,
        /// ABRQ1
        ABRQ1: u1 = 0x0,
        /// RQCP2
        RQCP2: u1 = 0x0,
        /// TXOK2
        TXOK2: u1 = 0x0,
        /// ALST2
        ALST2: u1 = 0x0,
        /// TERR2
        TERR2: u1 = 0x0,
        reserved23: u3 = 0,
        /// ABRQ2
        ABRQ2: u1 = 0x0,
        /// CODE
        CODE: u2 = 0x0,
        /// Lowest priority flag for mailbox 0
        TME0: u1 = 0x1,
        /// Lowest priority flag for mailbox 1
        TME1: u1 = 0x1,
        /// Lowest priority flag for mailbox 2
        TME2: u1 = 0x1,
        /// Lowest priority flag for mailbox 0
        LOW0: u1 = 0x0,
        /// Lowest priority flag for mailbox 1
        LOW1: u1 = 0x0,
        /// Lowest priority flag for mailbox 2
        LOW2: u1 = 0x0,
    }),
    /// receive FIFO 0 register
    /// offset: 0x0c
    RF0R: mmio.Mmio(packed struct(u32) {
        /// FMP0
        FMP0: u2 = 0x0,
        reserved3: u1 = 0,
        /// FULL0
        FULL0: u1 = 0x0,
        /// FOVR0
        FOVR0: u1 = 0x0,
        /// RFOM0
        RFOM0: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// receive FIFO 1 register
    /// offset: 0x10
    RF1R: mmio.Mmio(packed struct(u32) {
        /// FMP1
        FMP1: u2 = 0x0,
        reserved3: u1 = 0,
        /// FULL1
        FULL1: u1 = 0x0,
        /// FOVR1
        FOVR1: u1 = 0x0,
        /// RFOM1
        RFOM1: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// interrupt enable register
    /// offset: 0x14
    IER: mmio.Mmio(packed struct(u32) {
        /// TMEIE
        TMEIE: u1 = 0x0,
        /// FMPIE0
        FMPIE0: u1 = 0x0,
        /// FFIE0
        FFIE0: u1 = 0x0,
        /// FOVIE0
        FOVIE0: u1 = 0x0,
        /// FMPIE1
        FMPIE1: u1 = 0x0,
        /// FFIE1
        FFIE1: u1 = 0x0,
        /// FOVIE1
        FOVIE1: u1 = 0x0,
        reserved8: u1 = 0,
        /// EWGIE
        EWGIE: u1 = 0x0,
        /// EPVIE
        EPVIE: u1 = 0x0,
        /// BOFIE
        BOFIE: u1 = 0x0,
        /// LECIE
        LECIE: u1 = 0x0,
        reserved15: u3 = 0,
        /// ERRIE
        ERRIE: u1 = 0x0,
        /// WKUIE
        WKUIE: u1 = 0x0,
        /// SLKIE
        SLKIE: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// interrupt enable register
    /// offset: 0x18
    ESR: mmio.Mmio(packed struct(u32) {
        /// EWGF
        EWGF: u1 = 0x0,
        /// EPVF
        EPVF: u1 = 0x0,
        /// BOFF
        BOFF: u1 = 0x0,
        reserved4: u1 = 0,
        /// LEC
        LEC: u3 = 0x0,
        reserved16: u9 = 0,
        /// TEC
        TEC: u8 = 0x0,
        /// REC
        REC: u8 = 0x0,
    }),
    /// bit timing register
    /// offset: 0x1c
    BTR: mmio.Mmio(packed struct(u32) {
        /// BRP
        BRP: u10 = 0x0,
        reserved16: u6 = 0,
        /// TS1
        TS1: u4 = 0x0,
        /// TS2
        TS2: u3 = 0x0,
        reserved24: u1 = 0,
        /// SJW
        SJW: u2 = 0x0,
        reserved30: u4 = 0,
        /// LBKM
        LBKM: u1 = 0x0,
        /// SILM
        SILM: u1 = 0x0,
    }),
    /// offset: 0x20
    reserved32: [352]u8,
    /// TX mailbox identifier register
    /// offset: 0x180
    TI0R: mmio.Mmio(packed struct(u32) {
        /// TXRQ
        TXRQ: u1 = 0x0,
        /// RTR
        RTR: u1 = 0x0,
        /// IDE
        IDE: u1 = 0x0,
        /// EXID
        EXID: u18 = 0x0,
        /// STID
        STID: u11 = 0x0,
    }),
    /// mailbox data length control and time stamp register
    /// offset: 0x184
    TDT0R: mmio.Mmio(packed struct(u32) {
        /// DLC
        DLC: u4 = 0x0,
        reserved8: u4 = 0,
        /// TGT
        TGT: u1 = 0x0,
        reserved16: u7 = 0,
        /// TIME
        TIME: u16 = 0x0,
    }),
    /// mailbox data low register
    /// offset: 0x188
    TDL0R: mmio.Mmio(packed struct(u32) {
        /// DATA0
        DATA0: u8 = 0x0,
        /// DATA1
        DATA1: u8 = 0x0,
        /// DATA2
        DATA2: u8 = 0x0,
        /// DATA3
        DATA3: u8 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x18c
    TDH0R: mmio.Mmio(packed struct(u32) {
        /// DATA4
        DATA4: u8 = 0x0,
        /// DATA5
        DATA5: u8 = 0x0,
        /// DATA6
        DATA6: u8 = 0x0,
        /// DATA7
        DATA7: u8 = 0x0,
    }),
    /// mailbox identifier register
    /// offset: 0x190
    TI1R: mmio.Mmio(packed struct(u32) {
        /// TXRQ
        TXRQ: u1 = 0x0,
        /// RTR
        RTR: u1 = 0x0,
        /// IDE
        IDE: u1 = 0x0,
        /// EXID
        EXID: u18 = 0x0,
        /// STID
        STID: u11 = 0x0,
    }),
    /// mailbox data length control and time stamp register
    /// offset: 0x194
    TDT1R: mmio.Mmio(packed struct(u32) {
        /// DLC
        DLC: u4 = 0x0,
        reserved8: u4 = 0,
        /// TGT
        TGT: u1 = 0x0,
        reserved16: u7 = 0,
        /// TIME
        TIME: u16 = 0x0,
    }),
    /// mailbox data low register
    /// offset: 0x198
    TDL1R: mmio.Mmio(packed struct(u32) {
        /// DATA0
        DATA0: u8 = 0x0,
        /// DATA1
        DATA1: u8 = 0x0,
        /// DATA2
        DATA2: u8 = 0x0,
        /// DATA3
        DATA3: u8 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x19c
    TDH1R: mmio.Mmio(packed struct(u32) {
        /// DATA4
        DATA4: u8 = 0x0,
        /// DATA5
        DATA5: u8 = 0x0,
        /// DATA6
        DATA6: u8 = 0x0,
        /// DATA7
        DATA7: u8 = 0x0,
    }),
    /// mailbox identifier register
    /// offset: 0x1a0
    TI2R: mmio.Mmio(packed struct(u32) {
        /// TXRQ
        TXRQ: u1 = 0x0,
        /// RTR
        RTR: u1 = 0x0,
        /// IDE
        IDE: u1 = 0x0,
        /// EXID
        EXID: u18 = 0x0,
        /// STID
        STID: u11 = 0x0,
    }),
    /// mailbox data length control and time stamp register
    /// offset: 0x1a4
    TDT2R: mmio.Mmio(packed struct(u32) {
        /// DLC
        DLC: u4 = 0x0,
        reserved8: u4 = 0,
        /// TGT
        TGT: u1 = 0x0,
        reserved16: u7 = 0,
        /// TIME
        TIME: u16 = 0x0,
    }),
    /// mailbox data low register
    /// offset: 0x1a8
    TDL2R: mmio.Mmio(packed struct(u32) {
        /// DATA0
        DATA0: u8 = 0x0,
        /// DATA1
        DATA1: u8 = 0x0,
        /// DATA2
        DATA2: u8 = 0x0,
        /// DATA3
        DATA3: u8 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1ac
    TDH2R: mmio.Mmio(packed struct(u32) {
        /// DATA4
        DATA4: u8 = 0x0,
        /// DATA5
        DATA5: u8 = 0x0,
        /// DATA6
        DATA6: u8 = 0x0,
        /// DATA7
        DATA7: u8 = 0x0,
    }),
    /// receive FIFO mailbox identifier register
    /// offset: 0x1b0
    RI0R: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// RTR
        RTR: u1 = 0x0,
        /// IDE
        IDE: u1 = 0x0,
        /// EXID
        EXID: u18 = 0x0,
        /// STID
        STID: u11 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1b4
    RDT0R: mmio.Mmio(packed struct(u32) {
        /// DLC
        DLC: u4 = 0x0,
        reserved8: u4 = 0,
        /// FMI
        FMI: u8 = 0x0,
        /// TIME
        TIME: u16 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1b8
    RDL0R: mmio.Mmio(packed struct(u32) {
        /// DATA0
        DATA0: u8 = 0x0,
        /// DATA1
        DATA1: u8 = 0x0,
        /// DATA2
        DATA2: u8 = 0x0,
        /// DATA3
        DATA3: u8 = 0x0,
    }),
    /// receive FIFO mailbox data high register
    /// offset: 0x1bc
    RDH0R: mmio.Mmio(packed struct(u32) {
        /// DATA4
        DATA4: u8 = 0x0,
        /// DATA5
        DATA5: u8 = 0x0,
        /// DATA6
        DATA6: u8 = 0x0,
        /// DATA7
        DATA7: u8 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1c0
    RI1R: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// RTR
        RTR: u1 = 0x0,
        /// IDE
        IDE: u1 = 0x0,
        /// EXID
        EXID: u18 = 0x0,
        /// STID
        STID: u11 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1c4
    RDT1R: mmio.Mmio(packed struct(u32) {
        /// DLC
        DLC: u4 = 0x0,
        reserved8: u4 = 0,
        /// FMI
        FMI: u8 = 0x0,
        /// TIME
        TIME: u16 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1c8
    RDL1R: mmio.Mmio(packed struct(u32) {
        /// DATA0
        DATA0: u8 = 0x0,
        /// DATA1
        DATA1: u8 = 0x0,
        /// DATA2
        DATA2: u8 = 0x0,
        /// DATA3
        DATA3: u8 = 0x0,
    }),
    /// mailbox data high register
    /// offset: 0x1cc
    RDH1R: mmio.Mmio(packed struct(u32) {
        /// DATA4
        DATA4: u8 = 0x0,
        /// DATA5
        DATA5: u8 = 0x0,
        /// DATA6
        DATA6: u8 = 0x0,
        /// DATA7
        DATA7: u8 = 0x0,
    }),
    /// offset: 0x1d0
    reserved464: [48]u8,
    /// filter master register
    /// offset: 0x200
    FMR: mmio.Mmio(packed struct(u32) {
        /// FINIT
        FINIT: u1 = 0x1,
        reserved8: u7 = 0,
        /// CAN2SB
        CAN2SB: u6 = 0xE,
        padding: u18 = 0,
    }),
    /// filter mode register
    /// offset: 0x204
    FM1R: mmio.Mmio(packed struct(u32) {
        /// Filter mode
        FBM0: u1 = 0x0,
        /// Filter mode
        FBM1: u1 = 0x0,
        /// Filter mode
        FBM2: u1 = 0x0,
        /// Filter mode
        FBM3: u1 = 0x0,
        /// Filter mode
        FBM4: u1 = 0x0,
        /// Filter mode
        FBM5: u1 = 0x0,
        /// Filter mode
        FBM6: u1 = 0x0,
        /// Filter mode
        FBM7: u1 = 0x0,
        /// Filter mode
        FBM8: u1 = 0x0,
        /// Filter mode
        FBM9: u1 = 0x0,
        /// Filter mode
        FBM10: u1 = 0x0,
        /// Filter mode
        FBM11: u1 = 0x0,
        /// Filter mode
        FBM12: u1 = 0x0,
        /// Filter mode
        FBM13: u1 = 0x0,
        /// Filter mode
        FBM14: u1 = 0x0,
        /// Filter mode
        FBM15: u1 = 0x0,
        /// Filter mode
        FBM16: u1 = 0x0,
        /// Filter mode
        FBM17: u1 = 0x0,
        /// Filter mode
        FBM18: u1 = 0x0,
        /// Filter mode
        FBM19: u1 = 0x0,
        /// Filter mode
        FBM20: u1 = 0x0,
        /// Filter mode
        FBM21: u1 = 0x0,
        /// Filter mode
        FBM22: u1 = 0x0,
        /// Filter mode
        FBM23: u1 = 0x0,
        /// Filter mode
        FBM24: u1 = 0x0,
        /// Filter mode
        FBM25: u1 = 0x0,
        /// Filter mode
        FBM26: u1 = 0x0,
        /// Filter mode
        FBM27: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x208
    reserved520: [4]u8,
    /// filter scale register
    /// offset: 0x20c
    FS1R: mmio.Mmio(packed struct(u32) {
        /// Filter scale configuration
        FSC0: u1 = 0x0,
        /// Filter scale configuration
        FSC1: u1 = 0x0,
        /// Filter scale configuration
        FSC2: u1 = 0x0,
        /// Filter scale configuration
        FSC3: u1 = 0x0,
        /// Filter scale configuration
        FSC4: u1 = 0x0,
        /// Filter scale configuration
        FSC5: u1 = 0x0,
        /// Filter scale configuration
        FSC6: u1 = 0x0,
        /// Filter scale configuration
        FSC7: u1 = 0x0,
        /// Filter scale configuration
        FSC8: u1 = 0x0,
        /// Filter scale configuration
        FSC9: u1 = 0x0,
        /// Filter scale configuration
        FSC10: u1 = 0x0,
        /// Filter scale configuration
        FSC11: u1 = 0x0,
        /// Filter scale configuration
        FSC12: u1 = 0x0,
        /// Filter scale configuration
        FSC13: u1 = 0x0,
        /// Filter scale configuration
        FSC14: u1 = 0x0,
        /// Filter scale configuration
        FSC15: u1 = 0x0,
        /// Filter scale configuration
        FSC16: u1 = 0x0,
        /// Filter scale configuration
        FSC17: u1 = 0x0,
        /// Filter scale configuration
        FSC18: u1 = 0x0,
        /// Filter scale configuration
        FSC19: u1 = 0x0,
        /// Filter scale configuration
        FSC20: u1 = 0x0,
        /// Filter scale configuration
        FSC21: u1 = 0x0,
        /// Filter scale configuration
        FSC22: u1 = 0x0,
        /// Filter scale configuration
        FSC23: u1 = 0x0,
        /// Filter scale configuration
        FSC24: u1 = 0x0,
        /// Filter scale configuration
        FSC25: u1 = 0x0,
        /// Filter scale configuration
        FSC26: u1 = 0x0,
        /// Filter scale configuration
        FSC27: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x210
    reserved528: [4]u8,
    /// filter FIFO assignment register
    /// offset: 0x214
    FFA1R: mmio.Mmio(packed struct(u32) {
        /// Filter FIFO assignment for filter 0
        FFA0: u1 = 0x0,
        /// Filter FIFO assignment for filter 1
        FFA1: u1 = 0x0,
        /// Filter FIFO assignment for filter 2
        FFA2: u1 = 0x0,
        /// Filter FIFO assignment for filter 3
        FFA3: u1 = 0x0,
        /// Filter FIFO assignment for filter 4
        FFA4: u1 = 0x0,
        /// Filter FIFO assignment for filter 5
        FFA5: u1 = 0x0,
        /// Filter FIFO assignment for filter 6
        FFA6: u1 = 0x0,
        /// Filter FIFO assignment for filter 7
        FFA7: u1 = 0x0,
        /// Filter FIFO assignment for filter 8
        FFA8: u1 = 0x0,
        /// Filter FIFO assignment for filter 9
        FFA9: u1 = 0x0,
        /// Filter FIFO assignment for filter 10
        FFA10: u1 = 0x0,
        /// Filter FIFO assignment for filter 11
        FFA11: u1 = 0x0,
        /// Filter FIFO assignment for filter 12
        FFA12: u1 = 0x0,
        /// Filter FIFO assignment for filter 13
        FFA13: u1 = 0x0,
        /// Filter FIFO assignment for filter 14
        FFA14: u1 = 0x0,
        /// Filter FIFO assignment for filter 15
        FFA15: u1 = 0x0,
        /// Filter FIFO assignment for filter 16
        FFA16: u1 = 0x0,
        /// Filter FIFO assignment for filter 17
        FFA17: u1 = 0x0,
        /// Filter FIFO assignment for filter 18
        FFA18: u1 = 0x0,
        /// Filter FIFO assignment for filter 19
        FFA19: u1 = 0x0,
        /// Filter FIFO assignment for filter 20
        FFA20: u1 = 0x0,
        /// Filter FIFO assignment for filter 21
        FFA21: u1 = 0x0,
        /// Filter FIFO assignment for filter 22
        FFA22: u1 = 0x0,
        /// Filter FIFO assignment for filter 23
        FFA23: u1 = 0x0,
        /// Filter FIFO assignment for filter 24
        FFA24: u1 = 0x0,
        /// Filter FIFO assignment for filter 25
        FFA25: u1 = 0x0,
        /// Filter FIFO assignment for filter 26
        FFA26: u1 = 0x0,
        /// Filter FIFO assignment for filter 27
        FFA27: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x218
    reserved536: [4]u8,
    /// filter activation register
    /// offset: 0x21c
    FA1R: mmio.Mmio(packed struct(u32) {
        /// Filter active
        FACT0: u1 = 0x0,
        /// Filter active
        FACT1: u1 = 0x0,
        /// Filter active
        FACT2: u1 = 0x0,
        /// Filter active
        FACT3: u1 = 0x0,
        /// Filter active
        FACT4: u1 = 0x0,
        /// Filter active
        FACT5: u1 = 0x0,
        /// Filter active
        FACT6: u1 = 0x0,
        /// Filter active
        FACT7: u1 = 0x0,
        /// Filter active
        FACT8: u1 = 0x0,
        /// Filter active
        FACT9: u1 = 0x0,
        /// Filter active
        FACT10: u1 = 0x0,
        /// Filter active
        FACT11: u1 = 0x0,
        /// Filter active
        FACT12: u1 = 0x0,
        /// Filter active
        FACT13: u1 = 0x0,
        /// Filter active
        FACT14: u1 = 0x0,
        /// Filter active
        FACT15: u1 = 0x0,
        /// Filter active
        FACT16: u1 = 0x0,
        /// Filter active
        FACT17: u1 = 0x0,
        /// Filter active
        FACT18: u1 = 0x0,
        /// Filter active
        FACT19: u1 = 0x0,
        /// Filter active
        FACT20: u1 = 0x0,
        /// Filter active
        FACT21: u1 = 0x0,
        /// Filter active
        FACT22: u1 = 0x0,
        /// Filter active
        FACT23: u1 = 0x0,
        /// Filter active
        FACT24: u1 = 0x0,
        /// Filter active
        FACT25: u1 = 0x0,
        /// Filter active
        FACT26: u1 = 0x0,
        /// Filter active
        FACT27: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// offset: 0x220
    reserved544: [32]u8,
    /// Filter bank 0 register 1
    /// offset: 0x240
    F0R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 0 register 2
    /// offset: 0x244
    F0R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 1 register 1
    /// offset: 0x248
    F1R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 1 register 2
    /// offset: 0x24c
    F1R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 2 register 1
    /// offset: 0x250
    F2R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 2 register 2
    /// offset: 0x254
    F2R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 3 register 1
    /// offset: 0x258
    F3R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 3 register 2
    /// offset: 0x25c
    F3R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 4 register 1
    /// offset: 0x260
    F4R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 4 register 2
    /// offset: 0x264
    F4R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 5 register 1
    /// offset: 0x268
    F5R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 5 register 2
    /// offset: 0x26c
    F5R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 6 register 1
    /// offset: 0x270
    F6R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 6 register 2
    /// offset: 0x274
    F6R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 7 register 1
    /// offset: 0x278
    F7R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 7 register 2
    /// offset: 0x27c
    F7R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 8 register 1
    /// offset: 0x280
    F8R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 8 register 2
    /// offset: 0x284
    F8R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 9 register 1
    /// offset: 0x288
    F9R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 9 register 2
    /// offset: 0x28c
    F9R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 10 register 1
    /// offset: 0x290
    F10R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 10 register 2
    /// offset: 0x294
    F10R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 11 register 1
    /// offset: 0x298
    F11R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 11 register 2
    /// offset: 0x29c
    F11R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 4 register 1
    /// offset: 0x2a0
    F12R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 12 register 2
    /// offset: 0x2a4
    F12R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 13 register 1
    /// offset: 0x2a8
    F13R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 13 register 2
    /// offset: 0x2ac
    F13R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 14 register 1
    /// offset: 0x2b0
    F14R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 14 register 2
    /// offset: 0x2b4
    F14R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 15 register 1
    /// offset: 0x2b8
    F15R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 15 register 2
    /// offset: 0x2bc
    F15R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 16 register 1
    /// offset: 0x2c0
    F16R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 16 register 2
    /// offset: 0x2c4
    F16R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 17 register 1
    /// offset: 0x2c8
    F17R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 17 register 2
    /// offset: 0x2cc
    F17R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 18 register 1
    /// offset: 0x2d0
    F18R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 18 register 2
    /// offset: 0x2d4
    F18R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 19 register 1
    /// offset: 0x2d8
    F19R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 19 register 2
    /// offset: 0x2dc
    F19R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 20 register 1
    /// offset: 0x2e0
    F20R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 20 register 2
    /// offset: 0x2e4
    F20R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 21 register 1
    /// offset: 0x2e8
    F21R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 21 register 2
    /// offset: 0x2ec
    F21R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 22 register 1
    /// offset: 0x2f0
    F22R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 22 register 2
    /// offset: 0x2f4
    F22R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 23 register 1
    /// offset: 0x2f8
    F23R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 23 register 2
    /// offset: 0x2fc
    F23R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 24 register 1
    /// offset: 0x300
    F24R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 24 register 2
    /// offset: 0x304
    F24R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 25 register 1
    /// offset: 0x308
    F25R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 25 register 2
    /// offset: 0x30c
    F25R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 26 register 1
    /// offset: 0x310
    F26R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 26 register 2
    /// offset: 0x314
    F26R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 27 register 1
    /// offset: 0x318
    F27R1: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
    /// Filter bank 27 register 2
    /// offset: 0x31c
    F27R2: mmio.Mmio(packed struct(u32) {
        /// Filter bits
        FB0: u1 = 0x0,
        /// Filter bits
        FB1: u1 = 0x0,
        /// Filter bits
        FB2: u1 = 0x0,
        /// Filter bits
        FB3: u1 = 0x0,
        /// Filter bits
        FB4: u1 = 0x0,
        /// Filter bits
        FB5: u1 = 0x0,
        /// Filter bits
        FB6: u1 = 0x0,
        /// Filter bits
        FB7: u1 = 0x0,
        /// Filter bits
        FB8: u1 = 0x0,
        /// Filter bits
        FB9: u1 = 0x0,
        /// Filter bits
        FB10: u1 = 0x0,
        /// Filter bits
        FB11: u1 = 0x0,
        /// Filter bits
        FB12: u1 = 0x0,
        /// Filter bits
        FB13: u1 = 0x0,
        /// Filter bits
        FB14: u1 = 0x0,
        /// Filter bits
        FB15: u1 = 0x0,
        /// Filter bits
        FB16: u1 = 0x0,
        /// Filter bits
        FB17: u1 = 0x0,
        /// Filter bits
        FB18: u1 = 0x0,
        /// Filter bits
        FB19: u1 = 0x0,
        /// Filter bits
        FB20: u1 = 0x0,
        /// Filter bits
        FB21: u1 = 0x0,
        /// Filter bits
        FB22: u1 = 0x0,
        /// Filter bits
        FB23: u1 = 0x0,
        /// Filter bits
        FB24: u1 = 0x0,
        /// Filter bits
        FB25: u1 = 0x0,
        /// Filter bits
        FB26: u1 = 0x0,
        /// Filter bits
        FB27: u1 = 0x0,
        /// Filter bits
        FB28: u1 = 0x0,
        /// Filter bits
        FB29: u1 = 0x0,
        /// Filter bits
        FB30: u1 = 0x0,
        /// Filter bits
        FB31: u1 = 0x0,
    }),
};
