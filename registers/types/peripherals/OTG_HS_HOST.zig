const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go high speed
pub const OTG_HS_HOST = extern struct {
    /// OTG_HS host configuration register
    /// offset: 0x00
    OTG_HS_HCFG: mmio.Mmio(packed struct(u32) {
        /// FS/LS PHY clock select
        FSLSPCS: u2 = 0x0,
        /// FS- and LS-only support
        FSLSS: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// OTG_HS Host frame interval register
    /// offset: 0x04
    OTG_HS_HFIR: mmio.Mmio(packed struct(u32) {
        /// Frame interval
        FRIVL: u16 = 0xEA60,
        padding: u16 = 0,
    }),
    /// OTG_HS host frame number/frame time remaining register
    /// offset: 0x08
    OTG_HS_HFNUM: mmio.Mmio(packed struct(u32) {
        /// Frame number
        FRNUM: u16 = 0x3FFF,
        /// Frame time remaining
        FTREM: u16 = 0x0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// OTG_HS_Host periodic transmit FIFO/queue status register
    /// offset: 0x10
    OTG_HS_HPTXSTS: mmio.Mmio(packed struct(u32) {
        /// Periodic transmit data FIFO space available
        PTXFSAVL: u16 = 0x100,
        /// Periodic transmit request queue space available
        PTXQSAV: u8 = 0x8,
        /// Top of the periodic transmit request queue
        PTXQTOP: u8 = 0x0,
    }),
    /// OTG_HS Host all channels interrupt register
    /// offset: 0x14
    OTG_HS_HAINT: mmio.Mmio(packed struct(u32) {
        /// Channel interrupts
        HAINT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// OTG_HS host all channels interrupt mask register
    /// offset: 0x18
    OTG_HS_HAINTMSK: mmio.Mmio(packed struct(u32) {
        /// Channel interrupt mask
        HAINTM: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x1c
    reserved28: [36]u8,
    /// OTG_HS host port control and status register
    /// offset: 0x40
    OTG_HS_HPRT: mmio.Mmio(packed struct(u32) {
        /// Port connect status
        PCSTS: u1 = 0x0,
        /// Port connect detected
        PCDET: u1 = 0x0,
        /// Port enable
        PENA: u1 = 0x0,
        /// Port enable/disable change
        PENCHNG: u1 = 0x0,
        /// Port overcurrent active
        POCA: u1 = 0x0,
        /// Port overcurrent change
        POCCHNG: u1 = 0x0,
        /// Port resume
        PRES: u1 = 0x0,
        /// Port suspend
        PSUSP: u1 = 0x0,
        /// Port reset
        PRST: u1 = 0x0,
        reserved10: u1 = 0,
        /// Port line status
        PLSTS: u2 = 0x0,
        /// Port power
        PPWR: u1 = 0x0,
        /// Port test control
        PTCTL: u4 = 0x0,
        /// Port speed
        PSPD: u2 = 0x0,
        padding: u13 = 0,
    }),
    /// offset: 0x44
    reserved68: [188]u8,
    /// OTG_HS host channel-0 characteristics register
    /// offset: 0x100
    OTG_HS_HCCHAR0: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-0 split control register
    /// offset: 0x104
    OTG_HS_HCSPLT0: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-11 interrupt register
    /// offset: 0x108
    OTG_HS_HCINT0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-11 interrupt mask register
    /// offset: 0x10c
    OTG_HS_HCINTMSK0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-11 transfer size register
    /// offset: 0x110
    OTG_HS_HCTSIZ0: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-0 DMA address register
    /// offset: 0x114
    OTG_HS_HCDMA0: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x118
    reserved280: [8]u8,
    /// OTG_HS host channel-1 characteristics register
    /// offset: 0x120
    OTG_HS_HCCHAR1: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-1 split control register
    /// offset: 0x124
    OTG_HS_HCSPLT1: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-1 interrupt register
    /// offset: 0x128
    OTG_HS_HCINT1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-1 interrupt mask register
    /// offset: 0x12c
    OTG_HS_HCINTMSK1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-1 transfer size register
    /// offset: 0x130
    OTG_HS_HCTSIZ1: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-1 DMA address register
    /// offset: 0x134
    OTG_HS_HCDMA1: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x138
    reserved312: [8]u8,
    /// OTG_HS host channel-2 characteristics register
    /// offset: 0x140
    OTG_HS_HCCHAR2: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-2 split control register
    /// offset: 0x144
    OTG_HS_HCSPLT2: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-2 interrupt register
    /// offset: 0x148
    OTG_HS_HCINT2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-2 interrupt mask register
    /// offset: 0x14c
    OTG_HS_HCINTMSK2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-2 transfer size register
    /// offset: 0x150
    OTG_HS_HCTSIZ2: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-2 DMA address register
    /// offset: 0x154
    OTG_HS_HCDMA2: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x158
    reserved344: [8]u8,
    /// OTG_HS host channel-3 characteristics register
    /// offset: 0x160
    OTG_HS_HCCHAR3: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-3 split control register
    /// offset: 0x164
    OTG_HS_HCSPLT3: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-3 interrupt register
    /// offset: 0x168
    OTG_HS_HCINT3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-3 interrupt mask register
    /// offset: 0x16c
    OTG_HS_HCINTMSK3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-3 transfer size register
    /// offset: 0x170
    OTG_HS_HCTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-3 DMA address register
    /// offset: 0x174
    OTG_HS_HCDMA3: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x178
    reserved376: [8]u8,
    /// OTG_HS host channel-4 characteristics register
    /// offset: 0x180
    OTG_HS_HCCHAR4: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-4 split control register
    /// offset: 0x184
    OTG_HS_HCSPLT4: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-4 interrupt register
    /// offset: 0x188
    OTG_HS_HCINT4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-4 interrupt mask register
    /// offset: 0x18c
    OTG_HS_HCINTMSK4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-4 transfer size register
    /// offset: 0x190
    OTG_HS_HCTSIZ4: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-4 DMA address register
    /// offset: 0x194
    OTG_HS_HCDMA4: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x198
    reserved408: [8]u8,
    /// OTG_HS host channel-5 characteristics register
    /// offset: 0x1a0
    OTG_HS_HCCHAR5: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-5 split control register
    /// offset: 0x1a4
    OTG_HS_HCSPLT5: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-5 interrupt register
    /// offset: 0x1a8
    OTG_HS_HCINT5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-5 interrupt mask register
    /// offset: 0x1ac
    OTG_HS_HCINTMSK5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-5 transfer size register
    /// offset: 0x1b0
    OTG_HS_HCTSIZ5: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-5 DMA address register
    /// offset: 0x1b4
    OTG_HS_HCDMA5: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x1b8
    reserved440: [8]u8,
    /// OTG_HS host channel-6 characteristics register
    /// offset: 0x1c0
    OTG_HS_HCCHAR6: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-6 split control register
    /// offset: 0x1c4
    OTG_HS_HCSPLT6: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-6 interrupt register
    /// offset: 0x1c8
    OTG_HS_HCINT6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-6 interrupt mask register
    /// offset: 0x1cc
    OTG_HS_HCINTMSK6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-6 transfer size register
    /// offset: 0x1d0
    OTG_HS_HCTSIZ6: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-6 DMA address register
    /// offset: 0x1d4
    OTG_HS_HCDMA6: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x1d8
    reserved472: [8]u8,
    /// OTG_HS host channel-7 characteristics register
    /// offset: 0x1e0
    OTG_HS_HCCHAR7: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-7 split control register
    /// offset: 0x1e4
    OTG_HS_HCSPLT7: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-7 interrupt register
    /// offset: 0x1e8
    OTG_HS_HCINT7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-7 interrupt mask register
    /// offset: 0x1ec
    OTG_HS_HCINTMSK7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-7 transfer size register
    /// offset: 0x1f0
    OTG_HS_HCTSIZ7: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-7 DMA address register
    /// offset: 0x1f4
    OTG_HS_HCDMA7: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x1f8
    reserved504: [8]u8,
    /// OTG_HS host channel-8 characteristics register
    /// offset: 0x200
    OTG_HS_HCCHAR8: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-8 split control register
    /// offset: 0x204
    OTG_HS_HCSPLT8: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-8 interrupt register
    /// offset: 0x208
    OTG_HS_HCINT8: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-8 interrupt mask register
    /// offset: 0x20c
    OTG_HS_HCINTMSK8: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-8 transfer size register
    /// offset: 0x210
    OTG_HS_HCTSIZ8: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-8 DMA address register
    /// offset: 0x214
    OTG_HS_HCDMA8: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x218
    reserved536: [8]u8,
    /// OTG_HS host channel-9 characteristics register
    /// offset: 0x220
    OTG_HS_HCCHAR9: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-9 split control register
    /// offset: 0x224
    OTG_HS_HCSPLT9: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-9 interrupt register
    /// offset: 0x228
    OTG_HS_HCINT9: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-9 interrupt mask register
    /// offset: 0x22c
    OTG_HS_HCINTMSK9: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-9 transfer size register
    /// offset: 0x230
    OTG_HS_HCTSIZ9: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-9 DMA address register
    /// offset: 0x234
    OTG_HS_HCDMA9: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x238
    reserved568: [8]u8,
    /// OTG_HS host channel-10 characteristics register
    /// offset: 0x240
    OTG_HS_HCCHAR10: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-10 split control register
    /// offset: 0x244
    OTG_HS_HCSPLT10: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-10 interrupt register
    /// offset: 0x248
    OTG_HS_HCINT10: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-10 interrupt mask register
    /// offset: 0x24c
    OTG_HS_HCINTMSK10: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-10 transfer size register
    /// offset: 0x250
    OTG_HS_HCTSIZ10: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-10 DMA address register
    /// offset: 0x254
    OTG_HS_HCDMA10: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
    /// offset: 0x258
    reserved600: [8]u8,
    /// OTG_HS host channel-11 characteristics register
    /// offset: 0x260
    OTG_HS_HCCHAR11: mmio.Mmio(packed struct(u32) {
        /// Maximum packet size
        MPSIZ: u11 = 0x0,
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Endpoint direction
        EPDIR: u1 = 0x0,
        reserved17: u1 = 0,
        /// Low-speed device
        LSDEV: u1 = 0x0,
        /// Endpoint type
        EPTYP: u2 = 0x0,
        /// Multi Count (MC) / Error Count (EC)
        MC: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// OTG_HS host channel-11 split control register
    /// offset: 0x264
    OTG_HS_HCSPLT11: mmio.Mmio(packed struct(u32) {
        /// Port address
        PRTADDR: u7 = 0x0,
        /// Hub address
        HUBADDR: u7 = 0x0,
        /// XACTPOS
        XACTPOS: u2 = 0x0,
        /// Do complete split
        COMPLSPLT: u1 = 0x0,
        reserved31: u14 = 0,
        /// Split enable
        SPLITEN: u1 = 0x0,
    }),
    /// OTG_HS host channel-11 interrupt register
    /// offset: 0x268
    OTG_HS_HCINT11: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        /// Response received interrupt
        NYET: u1 = 0x0,
        /// Transaction error
        TXERR: u1 = 0x0,
        /// Babble error
        BBERR: u1 = 0x0,
        /// Frame overrun
        FRMOR: u1 = 0x0,
        /// Data toggle error
        DTERR: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-11 interrupt mask register
    /// offset: 0x26c
    OTG_HS_HCINTMSK11: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        /// AHB error
        AHBERR: u1 = 0x0,
        /// STALL response received interrupt mask
        STALLM: u1 = 0x0,
        /// NAK response received interrupt mask
        NAKM: u1 = 0x0,
        /// ACK response received/transmitted interrupt mask
        ACKM: u1 = 0x0,
        /// response received interrupt mask
        NYET: u1 = 0x0,
        /// Transaction error mask
        TXERRM: u1 = 0x0,
        /// Babble error mask
        BBERRM: u1 = 0x0,
        /// Frame overrun mask
        FRMORM: u1 = 0x0,
        /// Data toggle error mask
        DTERRM: u1 = 0x0,
        padding: u21 = 0,
    }),
    /// OTG_HS host channel-11 transfer size register
    /// offset: 0x270
    OTG_HS_HCTSIZ11: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// OTG_HS host channel-11 DMA address register
    /// offset: 0x274
    OTG_HS_HCDMA11: mmio.Mmio(packed struct(u32) {
        /// DMA address
        DMAADDR: u32 = 0x0,
    }),
};
