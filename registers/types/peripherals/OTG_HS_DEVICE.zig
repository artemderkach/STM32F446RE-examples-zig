const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go high speed
pub const OTG_HS_DEVICE = extern struct {
    /// OTG_HS device configuration register
    /// offset: 0x00
    OTG_HS_DCFG: mmio.Mmio(packed struct(u32) {
        /// Device speed
        DSPD: u2 = 0x0,
        /// Nonzero-length status OUT handshake
        NZLSOHSK: u1 = 0x0,
        reserved4: u1 = 0,
        /// Device address
        DAD: u7 = 0x0,
        /// Periodic (micro)frame interval
        PFIVL: u2 = 0x0,
        reserved24: u11 = 0,
        /// Periodic scheduling interval
        PERSCHIVL: u2 = 0x2,
        padding: u6 = 0,
    }),
    /// OTG_HS device control register
    /// offset: 0x04
    OTG_HS_DCTL: mmio.Mmio(packed struct(u32) {
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
    /// OTG_HS device status register
    /// offset: 0x08
    OTG_HS_DSTS: mmio.Mmio(packed struct(u32) {
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
    /// OTG_HS device IN endpoint common interrupt mask register
    /// offset: 0x10
    OTG_HS_DIEPMSK: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition mask (nonisochronous endpoints)
        TOM: u1 = 0x0,
        /// IN token received when TxFIFO empty mask
        ITTXFEMSK: u1 = 0x0,
        /// IN token received with EP mismatch mask
        INEPNMM: u1 = 0x0,
        /// IN endpoint NAK effective mask
        INEPNEM: u1 = 0x0,
        reserved8: u1 = 0,
        /// FIFO underrun mask
        TXFURM: u1 = 0x0,
        /// BNA interrupt mask
        BIM: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// OTG_HS device OUT endpoint common interrupt mask register
    /// offset: 0x14
    OTG_HS_DOEPMSK: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done mask
        STUPM: u1 = 0x0,
        /// OUT token received when endpoint disabled mask
        OTEPDM: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received mask
        B2BSTUP: u1 = 0x0,
        reserved8: u1 = 0,
        /// OUT packet error mask
        OPEM: u1 = 0x0,
        /// BNA interrupt mask
        BOIM: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// OTG_HS device all endpoints interrupt register
    /// offset: 0x18
    OTG_HS_DAINT: mmio.Mmio(packed struct(u32) {
        /// IN endpoint interrupt bits
        IEPINT: u16 = 0x0,
        /// OUT endpoint interrupt bits
        OEPINT: u16 = 0x0,
    }),
    /// OTG_HS all endpoints interrupt mask register
    /// offset: 0x1c
    OTG_HS_DAINTMSK: mmio.Mmio(packed struct(u32) {
        /// IN EP interrupt mask bits
        IEPM: u16 = 0x0,
        /// OUT EP interrupt mask bits
        OEPM: u16 = 0x0,
    }),
    /// offset: 0x20
    reserved32: [8]u8,
    /// OTG_HS device VBUS discharge time register
    /// offset: 0x28
    OTG_HS_DVBUSDIS: mmio.Mmio(packed struct(u32) {
        /// Device VBUS discharge time
        VBUSDT: u16 = 0x17D7,
        padding: u16 = 0,
    }),
    /// OTG_HS device VBUS pulsing time register
    /// offset: 0x2c
    OTG_HS_DVBUSPULSE: mmio.Mmio(packed struct(u32) {
        /// Device VBUS pulsing time
        DVBUSP: u12 = 0x5B8,
        padding: u20 = 0,
    }),
    /// OTG_HS Device threshold control register
    /// offset: 0x30
    OTG_HS_DTHRCTL: mmio.Mmio(packed struct(u32) {
        /// Nonisochronous IN endpoints threshold enable
        NONISOTHREN: u1 = 0x0,
        /// ISO IN endpoint threshold enable
        ISOTHREN: u1 = 0x0,
        /// Transmit threshold length
        TXTHRLEN: u9 = 0x0,
        reserved16: u5 = 0,
        /// Receive threshold enable
        RXTHREN: u1 = 0x0,
        /// Receive threshold length
        RXTHRLEN: u9 = 0x0,
        reserved27: u1 = 0,
        /// Arbiter parking enable
        ARPEN: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// OTG_HS device IN endpoint FIFO empty interrupt mask register
    /// offset: 0x34
    OTG_HS_DIEPEMPMSK: mmio.Mmio(packed struct(u32) {
        /// IN EP Tx FIFO empty interrupt mask bits
        INEPTXFEM: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// OTG_HS device each endpoint interrupt register
    /// offset: 0x38
    OTG_HS_DEACHINT: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// IN endpoint 1interrupt bit
        IEP1INT: u1 = 0x0,
        reserved17: u15 = 0,
        /// OUT endpoint 1 interrupt bit
        OEP1INT: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// OTG_HS device each endpoint interrupt register mask
    /// offset: 0x3c
    OTG_HS_DEACHINTMSK: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// IN Endpoint 1 interrupt mask bit
        IEP1INTM: u1 = 0x0,
        reserved17: u15 = 0,
        /// OUT Endpoint 1 interrupt mask bit
        OEP1INTM: u1 = 0x0,
        padding: u14 = 0,
    }),
    /// OTG_HS device each in endpoint-1 interrupt register
    /// offset: 0x40
    OTG_HS_DIEPEACHMSK1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition mask (nonisochronous endpoints)
        TOM: u1 = 0x0,
        /// IN token received when TxFIFO empty mask
        ITTXFEMSK: u1 = 0x0,
        /// IN token received with EP mismatch mask
        INEPNMM: u1 = 0x0,
        /// IN endpoint NAK effective mask
        INEPNEM: u1 = 0x0,
        reserved8: u1 = 0,
        /// FIFO underrun mask
        TXFURM: u1 = 0x0,
        /// BNA interrupt mask
        BIM: u1 = 0x0,
        reserved13: u3 = 0,
        /// NAK interrupt mask
        NAKM: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x44
    reserved68: [60]u8,
    /// OTG_HS device each OUT endpoint-1 interrupt register
    /// offset: 0x80
    OTG_HS_DOEPEACHMSK1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt mask
        XFRCM: u1 = 0x0,
        /// Endpoint disabled interrupt mask
        EPDM: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition mask
        TOM: u1 = 0x0,
        /// IN token received when TxFIFO empty mask
        ITTXFEMSK: u1 = 0x0,
        /// IN token received with EP mismatch mask
        INEPNMM: u1 = 0x0,
        /// IN endpoint NAK effective mask
        INEPNEM: u1 = 0x0,
        reserved8: u1 = 0,
        /// OUT packet error mask
        TXFURM: u1 = 0x0,
        /// BNA interrupt mask
        BIM: u1 = 0x0,
        reserved12: u2 = 0,
        /// Bubble error interrupt mask
        BERRM: u1 = 0x0,
        /// NAK interrupt mask
        NAKM: u1 = 0x0,
        /// NYET interrupt mask
        NYETM: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x84
    reserved132: [124]u8,
    /// OTG device endpoint-0 control register
    /// offset: 0x100
    OTG_HS_DIEPCTL0: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x104
    reserved260: [4]u8,
    /// OTG device endpoint-0 interrupt register
    /// offset: 0x108
    OTG_HS_DIEPINT0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x1,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x10c
    reserved268: [4]u8,
    /// OTG_HS device IN endpoint 0 transfer size register
    /// offset: 0x110
    OTG_HS_DIEPTSIZ0: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u7 = 0x0,
        reserved19: u12 = 0,
        /// Packet count
        PKTCNT: u2 = 0x0,
        padding: u11 = 0,
    }),
    /// OTG_HS device endpoint-1 DMA address register
    /// offset: 0x114
    OTG_HS_DIEPDMA1: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x118
    OTG_HS_DTXFSTS0: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x11c
    reserved284: [4]u8,
    /// OTG device endpoint-1 control register
    /// offset: 0x120
    OTG_HS_DIEPCTL1: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x124
    reserved292: [4]u8,
    /// OTG device endpoint-1 interrupt register
    /// offset: 0x128
    OTG_HS_DIEPINT1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x12c
    reserved300: [4]u8,
    /// OTG_HS device endpoint transfer size register
    /// offset: 0x130
    OTG_HS_DIEPTSIZ1: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS device endpoint-2 DMA address register
    /// offset: 0x134
    OTG_HS_DIEPDMA2: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x138
    OTG_HS_DTXFSTS1: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x13c
    reserved316: [4]u8,
    /// OTG device endpoint-2 control register
    /// offset: 0x140
    OTG_HS_DIEPCTL2: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x144
    reserved324: [4]u8,
    /// OTG device endpoint-2 interrupt register
    /// offset: 0x148
    OTG_HS_DIEPINT2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x14c
    reserved332: [4]u8,
    /// OTG_HS device endpoint transfer size register
    /// offset: 0x150
    OTG_HS_DIEPTSIZ2: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS device endpoint-3 DMA address register
    /// offset: 0x154
    OTG_HS_DIEPDMA3: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x158
    OTG_HS_DTXFSTS2: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x15c
    reserved348: [4]u8,
    /// OTG device endpoint-3 control register
    /// offset: 0x160
    OTG_HS_DIEPCTL3: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x164
    reserved356: [4]u8,
    /// OTG device endpoint-3 interrupt register
    /// offset: 0x168
    OTG_HS_DIEPINT3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x16c
    reserved364: [4]u8,
    /// OTG_HS device endpoint transfer size register
    /// offset: 0x170
    OTG_HS_DIEPTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS device endpoint-4 DMA address register
    /// offset: 0x174
    OTG_HS_DIEPDMA4: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x178
    OTG_HS_DTXFSTS3: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x17c
    reserved380: [4]u8,
    /// OTG device endpoint-4 control register
    /// offset: 0x180
    OTG_HS_DIEPCTL4: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x184
    reserved388: [4]u8,
    /// OTG device endpoint-4 interrupt register
    /// offset: 0x188
    OTG_HS_DIEPINT4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x18c
    reserved396: [4]u8,
    /// OTG_HS device endpoint transfer size register
    /// offset: 0x190
    OTG_HS_DIEPTSIZ4: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS device endpoint-5 DMA address register
    /// offset: 0x194
    OTG_HS_DIEPDMA5: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x198
    OTG_HS_DTXFSTS4: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x19c
    reserved412: [4]u8,
    /// OTG device endpoint-5 control register
    /// offset: 0x1a0
    OTG_HS_DIEPCTL5: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x1a4
    reserved420: [4]u8,
    /// OTG device endpoint-5 interrupt register
    /// offset: 0x1a8
    OTG_HS_DIEPINT5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x1ac
    reserved428: [4]u8,
    /// OTG_HS device endpoint transfer size register
    /// offset: 0x1b0
    OTG_HS_DIEPTSIZ5: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Multi count
        MCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x1b4
    reserved436: [4]u8,
    /// OTG_HS device IN endpoint transmit FIFO status register
    /// offset: 0x1b8
    OTG_HS_DTXFSTS5: mmio.Mmio(packed struct(u32) {
        /// IN endpoint TxFIFO space avail
        INEPTFSAV: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x1bc
    reserved444: [4]u8,
    /// OTG device endpoint-6 control register
    /// offset: 0x1c0
    OTG_HS_DIEPCTL6: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x1c4
    reserved452: [4]u8,
    /// OTG device endpoint-6 interrupt register
    /// offset: 0x1c8
    OTG_HS_DIEPINT6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x1cc
    reserved460: [20]u8,
    /// OTG device endpoint-7 control register
    /// offset: 0x1e0
    OTG_HS_DIEPCTL7: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even/odd frame
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        reserved21: u1 = 0,
        /// STALL handshake
        Stall: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u4 = 0x0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x1e4
    reserved484: [4]u8,
    /// OTG device endpoint-7 interrupt register
    /// offset: 0x1e8
    OTG_HS_DIEPINT7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// Timeout condition
        TOC: u1 = 0x0,
        /// IN token received when TxFIFO is empty
        ITTXFE: u1 = 0x0,
        reserved6: u1 = 0,
        /// IN endpoint NAK effective
        INEPNE: u1 = 0x0,
        /// Transmit FIFO empty
        TXFE: u1 = 0x0,
        /// Transmit Fifo Underrun
        TXFIFOUDRN: u1 = 0x0,
        /// Buffer not available interrupt
        BNA: u1 = 0x0,
        reserved11: u1 = 0,
        /// Packet dropped status
        PKTDRPSTS: u1 = 0x0,
        /// Babble error interrupt
        BERR: u1 = 0x0,
        /// NAK interrupt
        NAK: u1 = 0x0,
        padding: u18 = 0,
    }),
    /// offset: 0x1ec
    reserved492: [276]u8,
    /// OTG_HS device control OUT endpoint 0 control register
    /// offset: 0x300
    OTG_HS_DOEPCTL0: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u2 = 0x0,
        reserved15: u13 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x1,
        reserved17: u1 = 0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Snoop mode
        SNPM: u1 = 0x0,
        /// STALL handshake
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
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
    /// offset: 0x304
    reserved772: [4]u8,
    /// OTG_HS device endpoint-0 interrupt register
    /// offset: 0x308
    OTG_HS_DOEPINT0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x30c
    reserved780: [4]u8,
    /// OTG_HS device endpoint-1 transfer size register
    /// offset: 0x310
    OTG_HS_DOEPTSIZ0: mmio.Mmio(packed struct(u32) {
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
    /// OTG device endpoint-1 control register
    /// offset: 0x320
    OTG_HS_DOEPCTL1: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even odd frame/Endpoint data PID
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Snoop mode
        SNPM: u1 = 0x0,
        /// STALL handshake
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID/Set even frame
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x324
    reserved804: [4]u8,
    /// OTG_HS device endpoint-1 interrupt register
    /// offset: 0x328
    OTG_HS_DOEPINT1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x32c
    reserved812: [4]u8,
    /// OTG_HS device endpoint-2 transfer size register
    /// offset: 0x330
    OTG_HS_DOEPTSIZ1: mmio.Mmio(packed struct(u32) {
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
    /// OTG device endpoint-2 control register
    /// offset: 0x340
    OTG_HS_DOEPCTL2: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even odd frame/Endpoint data PID
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Snoop mode
        SNPM: u1 = 0x0,
        /// STALL handshake
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID/Set even frame
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x344
    reserved836: [4]u8,
    /// OTG_HS device endpoint-2 interrupt register
    /// offset: 0x348
    OTG_HS_DOEPINT2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x34c
    reserved844: [4]u8,
    /// OTG_HS device endpoint-3 transfer size register
    /// offset: 0x350
    OTG_HS_DOEPTSIZ2: mmio.Mmio(packed struct(u32) {
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
    /// OTG device endpoint-3 control register
    /// offset: 0x360
    OTG_HS_DOEPCTL3: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        reserved15: u4 = 0,
        /// USB active endpoint
        USBAEP: u1 = 0x0,
        /// Even odd frame/Endpoint data PID
        EONUM_DPID: u1 = 0x0,
        /// NAK status
        NAKSTS: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Snoop mode
        SNPM: u1 = 0x0,
        /// STALL handshake
        Stall: u1 = 0x0,
        reserved26: u4 = 0,
        /// Clear NAK
        CNAK: u1 = 0x0,
        /// Set NAK
        SNAK: u1 = 0x0,
        /// Set DATA0 PID/Set even frame
        SD0PID_SEVNFRM: u1 = 0x0,
        /// Set odd frame
        SODDFRM: u1 = 0x0,
        /// Endpoint disable
        EPDIS: u1 = 0x0,
        /// Endpoint enable
        EPENA: u1 = 0x0,
    }),
    /// offset: 0x364
    reserved868: [4]u8,
    /// OTG_HS device endpoint-3 interrupt register
    /// offset: 0x368
    OTG_HS_DOEPINT3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x36c
    reserved876: [4]u8,
    /// OTG_HS device endpoint-4 transfer size register
    /// offset: 0x370
    OTG_HS_DOEPTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Received data PID/SETUP packet count
        RXDPID_STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x374
    reserved884: [20]u8,
    /// OTG_HS device endpoint-4 interrupt register
    /// offset: 0x388
    OTG_HS_DOEPINT4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x38c
    reserved908: [4]u8,
    /// OTG_HS device endpoint-5 transfer size register
    /// offset: 0x390
    OTG_HS_DOEPTSIZ4: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Received data PID/SETUP packet count
        RXDPID_STUPCNT: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x394
    reserved916: [20]u8,
    /// OTG_HS device endpoint-5 interrupt register
    /// offset: 0x3a8
    OTG_HS_DOEPINT5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x3ac
    reserved940: [28]u8,
    /// OTG_HS device endpoint-6 interrupt register
    /// offset: 0x3c8
    OTG_HS_DOEPINT6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// offset: 0x3cc
    reserved972: [28]u8,
    /// OTG_HS device endpoint-7 interrupt register
    /// offset: 0x3e8
    OTG_HS_DOEPINT7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed interrupt
        XFRC: u1 = 0x0,
        /// Endpoint disabled interrupt
        EPDISD: u1 = 0x0,
        reserved3: u1 = 0,
        /// SETUP phase done
        STUP: u1 = 0x0,
        /// OUT token received when endpoint disabled
        OTEPDIS: u1 = 0x0,
        reserved6: u1 = 0,
        /// Back-to-back SETUP packets received
        B2BSTUP: u1 = 0x0,
        reserved14: u7 = 0,
        /// NYET interrupt
        NYET: u1 = 0x0,
        padding: u17 = 0,
    }),
};
