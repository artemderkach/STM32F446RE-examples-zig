const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go full speed
pub const OTG_FS_DEVICE = extern struct {
    /// OTG_FS device configuration register (OTG_FS_DCFG)
    /// offset: 0x00
    FS_DCFG: mmio.Mmio(packed struct(u32) {
        /// Device speed
        DSPD: u2 = 0x0,
        /// Non-zero-length status OUT handshake
        NZLSOHSK: u1 = 0x0,
        reserved4: u1 = 0,
        /// Device address
        DAD: u7 = 0x0,
        /// Periodic frame interval
        PFIVL: u2 = 0x0,
        padding: u19 = 0,
    }),
    /// OTG_FS device control register (OTG_FS_DCTL)
    /// offset: 0x04
    FS_DCTL: mmio.Mmio(packed struct(u32) {
        /// Remote wakeup signaling
        RWUSIG: u1 = 0x0,
        /// Soft disconnect
        SDIS: u1 = 0x0,
        /// Global IN NAK status
        GINSTS: u1 = 0x0,
        /// Global OUT NAK status
        GONSTS: u1 = 0x0,
        /// Test control
        TCTL: u3 = 0x0,
        /// Set global IN NAK
        SGINAK: u1 = 0x0,
        /// Clear global IN NAK
        CGINAK: u1 = 0x0,
        /// Set global OUT NAK
        SGONAK: u1 = 0x0,
        /// Clear global OUT NAK
        CGONAK: u1 = 0x0,
        /// Power-on programming done
        POPRGDNE: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// OTG_FS device status register (OTG_FS_DSTS)
    /// offset: 0x08
    FS_DSTS: mmio.Mmio(packed struct(u32) {
        /// Suspend status
        SUSPSTS: u1 = 0x0,
        /// Enumerated speed
        ENUMSPD: u2 = 0x0,
        /// Erratic error
        EERR: u1 = 0x0,
        reserved8: u4 = 0,
        /// Frame number of the received SOF
        FNSOF: u14 = 0x0,
        padding: u10 = 0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// OTG_FS device IN endpoint common interrupt mask register (OTG_FS_DIEPMSK)
    /// offset: 0x10
    FS_DIEPMSK: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition mask (Non-isochronous endpoints)
        TOM: u1 = 0x0,
        /// IN token received when TxFIFO empty mask
        ITTXFEMSK: u1 = 0x0,
        /// IN token received with EP mismatch mask
        INEPNMM: u1 = 0x0,
        /// IN endpoint NAK effective mask
        INEPNEM: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// OTG_FS device OUT endpoint common interrupt mask register (OTG_FS_DOEPMSK)
    /// offset: 0x14
    FS_DOEPMSK: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done mask
        STUPM: u1 = 0x0,
        /// OUT token received when endpoint disabled mask
        OTEPDM: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// OTG_FS device all endpoints interrupt register (OTG_FS_DAINT)
    /// offset: 0x18
    FS_DAINT: mmio.Mmio(packed struct(u32) {
        /// IN endpoint interrupt bits
        IEPINT: u16 = 0x0,
        /// OUT endpoint interrupt bits
        OEPINT: u16 = 0x0,
    }),
    /// OTG_FS all endpoints interrupt mask register (OTG_FS_DAINTMSK)
    /// offset: 0x1c
    FS_DAINTMSK: mmio.Mmio(packed struct(u32) {
        /// IN EP interrupt mask bits
        IEPM: u16 = 0x0,
        /// OUT endpoint interrupt bits
        OEPINT: u16 = 0x0,
    }),
    /// offset: 0x20
    reserved32: [8]u8,
    /// OTG_FS device VBUS discharge time register
    /// offset: 0x28
    DVBUSDIS: mmio.Mmio(packed struct(u32) {
        /// Device VBUS discharge time
        VBUSDT: u16 = 0x17D7,
        padding: u16 = 0,
    }),
    /// OTG_FS device VBUS pulsing time register
    /// offset: 0x2c
    DVBUSPULSE: mmio.Mmio(packed struct(u32) {
        /// Device VBUS pulsing time
        DVBUSP: u12 = 0x5B8,
        padding: u20 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// OTG_FS device IN endpoint FIFO empty interrupt mask register
    /// offset: 0x34
    DIEPEMPMSK: mmio.Mmio(packed struct(u32) {
        /// IN EP Tx FIFO empty interrupt mask bits
        INEPTXFEM: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x38
    reserved56: [200]u8,
    /// OTG_FS device control IN endpoint 0 control register (OTG_FS_DIEPCTL0)
    /// offset: 0x100
    FS_DIEPCTL0: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u2 = 0x0,
        reserved15: u13 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        reserved17: u1 = 0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        STALL: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        reserved30: u2 = 0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x104
    reserved260: [4]u8,
    /// device endpoint-x interrupt register
    /// offset: 0x108
    DIEPINT0: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// TOC
        TOC: u1 = 0x0,
        /// ITTXFE
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// INEPNE
        INEPNE: u1 = 0x0,
        /// TXFE
        TXFE: u1 = 0x1,
        padding: u24 = 0,
    }),
    /// offset: 0x10c
    reserved268: [4]u8,
    /// device endpoint-0 transfer size register
    /// offset: 0x110
    DIEPTSIZ0: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u7 = 0x0,
        reserved19: u12 = 0,
        /// Packet count
        PKTCNT: u2 = 0x0,
        padding: u11 = 0,
    }),
    /// offset: 0x114
    reserved276: [4]u8,
    /// OTG_FS device IN endpoint transmit FIFO status register
    /// offset: 0x118
    DTXFSTS0: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space available
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x11c
    reserved284: [4]u8,
    /// OTG device endpoint-1 control register
    /// offset: 0x120
    DIEPCTL1: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// Stall
        Stall: u1 = 0x0,
        /// TXFNUM
        TXFNUM: u4 = 0x0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM/SD1PID
        SODDFRM_SD1PID: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x124
    reserved292: [4]u8,
    /// device endpoint-1 interrupt register
    /// offset: 0x128
    DIEPINT1: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// TOC
        TOC: u1 = 0x0,
        /// ITTXFE
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// INEPNE
        INEPNE: u1 = 0x0,
        /// TXFE
        TXFE: u1 = 0x1,
        padding: u24 = 0,
    }),
    /// offset: 0x12c
    reserved300: [4]u8,
    /// device endpoint-1 transfer size register
    /// offset: 0x130
    DIEPTSIZ1: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x134
    reserved308: [4]u8,
    /// OTG_FS device IN endpoint transmit FIFO status register
    /// offset: 0x138
    DTXFSTS1: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space available
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x13c
    reserved316: [4]u8,
    /// OTG device endpoint-2 control register
    /// offset: 0x140
    DIEPCTL2: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// Stall
        Stall: u1 = 0x0,
        /// TXFNUM
        TXFNUM: u4 = 0x0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM
        SODDFRM: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x144
    reserved324: [4]u8,
    /// device endpoint-2 interrupt register
    /// offset: 0x148
    DIEPINT2: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// TOC
        TOC: u1 = 0x0,
        /// ITTXFE
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// INEPNE
        INEPNE: u1 = 0x0,
        /// TXFE
        TXFE: u1 = 0x1,
        padding: u24 = 0,
    }),
    /// offset: 0x14c
    reserved332: [4]u8,
    /// device endpoint-2 transfer size register
    /// offset: 0x150
    DIEPTSIZ2: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x154
    reserved340: [4]u8,
    /// OTG_FS device IN endpoint transmit FIFO status register
    /// offset: 0x158
    DTXFSTS2: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space available
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x15c
    reserved348: [4]u8,
    /// OTG device endpoint-3 control register
    /// offset: 0x160
    DIEPCTL3: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// Stall
        Stall: u1 = 0x0,
        /// TXFNUM
        TXFNUM: u4 = 0x0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM
        SODDFRM: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x164
    reserved356: [4]u8,
    /// device endpoint-3 interrupt register
    /// offset: 0x168
    DIEPINT3: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// TOC
        TOC: u1 = 0x0,
        /// ITTXFE
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// INEPNE
        INEPNE: u1 = 0x0,
        /// TXFE
        TXFE: u1 = 0x1,
        padding: u24 = 0,
    }),
    /// offset: 0x16c
    reserved364: [4]u8,
    /// device endpoint-3 transfer size register
    /// offset: 0x170
    DIEPTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x174
    reserved372: [4]u8,
    /// OTG_FS device IN endpoint transmit FIFO status register
    /// offset: 0x178
    DTXFSTS3: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space available
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x17c
    reserved380: [388]u8,
    /// device endpoint-0 control register
    /// offset: 0x300
    DOEPCTL0: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u2 = 0x0,
        reserved15: u13 = 0,
        /// USBAEP
        USBAEP: u1 = 0x1,
        reserved17: u1 = 0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        /// SNPM
        SNPM: u1 = 0x0,
        /// Stall
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        reserved30: u2 = 0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x304
    reserved772: [4]u8,
    /// device endpoint-0 interrupt register
    /// offset: 0x308
    DOEPINT0: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// STUP
        STUP: u1 = 0x0,
        /// OTEPDIS
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// B2BSTUP
        B2BSTUP: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// offset: 0x30c
    reserved780: [4]u8,
    /// device OUT endpoint-0 transfer size register
    /// offset: 0x310
    DOEPTSIZ0: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u7 = 0x0,
        reserved19: u12 = 0,
        /// Packet count
        PKTCNT: u1 = 0x0,
        reserved29: u9 = 0,
        /// SETUP packet count
        STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x314
    reserved788: [12]u8,
    /// device endpoint-1 control register
    /// offset: 0x320
    DOEPCTL1: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        /// SNPM
        SNPM: u1 = 0x0,
        /// Stall
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM
        SODDFRM: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x324
    reserved804: [4]u8,
    /// device endpoint-1 interrupt register
    /// offset: 0x328
    DOEPINT1: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// STUP
        STUP: u1 = 0x0,
        /// OTEPDIS
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// B2BSTUP
        B2BSTUP: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// offset: 0x32c
    reserved812: [4]u8,
    /// device OUT endpoint-1 transfer size register
    /// offset: 0x330
    DOEPTSIZ1: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Received data PID/SETUP packet count
        RXDPID_STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x334
    reserved820: [12]u8,
    /// device endpoint-2 control register
    /// offset: 0x340
    DOEPCTL2: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        /// SNPM
        SNPM: u1 = 0x0,
        /// Stall
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM
        SODDFRM: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x344
    reserved836: [4]u8,
    /// device endpoint-2 interrupt register
    /// offset: 0x348
    DOEPINT2: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// STUP
        STUP: u1 = 0x0,
        /// OTEPDIS
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// B2BSTUP
        B2BSTUP: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// offset: 0x34c
    reserved844: [4]u8,
    /// device OUT endpoint-2 transfer size register
    /// offset: 0x350
    DOEPTSIZ2: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Received data PID/SETUP packet count
        RXDPID_STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x354
    reserved852: [12]u8,
    /// device endpoint-3 control register
    /// offset: 0x360
    DOEPCTL3: mmio.Mmio(packed struct(u32) {
        /// MPSIZ
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USBAEP
        USBAEP: u1 = 0x0,
        /// EONUM/DPID
        EONUM_DPID: u1 = 0x0,
        /// NAKSTS
        NAKSTS: u1 = 0x0,
        /// EPTYP
        EPTYP: u2 = 0x0,
        /// SNPM
        SNPM: u1 = 0x0,
        /// Stall
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// CNAK
        CNAK: u1 = 0x0,
        /// SNAK
        SNAK: u1 = 0x0,
        /// SD0PID/SEVNFRM
        SD0PID_SEVNFRM: u1 = 0x0,
        /// SODDFRM
        SODDFRM: u1 = 0x0,
        /// EPDIS
        EPDIS: u1 = 0x0,
        /// EPENA
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x364
    reserved868: [4]u8,
    /// device endpoint-3 interrupt register
    /// offset: 0x368
    DOEPINT3: mmio.Mmio(packed struct(u32) {
        /// XFRC
        XFRC: u1 = 0x0,
        /// EPDISD
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// STUP
        STUP: u1 = 0x0,
        /// OTEPDIS
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// B2BSTUP
        B2BSTUP: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// offset: 0x36c
    reserved876: [4]u8,
    /// device OUT endpoint-3 transfer size register
    /// offset: 0x370
    DOEPTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Received data PID/SETUP packet count
        RXDPID_STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
};
