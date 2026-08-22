const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go full speed
pub const OTG_FS_HOST = extern struct {
    /// OTG_FS host configuration register (OTG_FS_HCFG)
    /// offset: 0x00
    FS_HCFG: mmio.Mmio(packed struct(u32) {
        /// FS/LS PHY clock select
        FSLSPCS: u2 = 0x0,
        /// FS- and LS-only support
        FSLSS: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// OTG_FS Host frame interval register
    /// offset: 0x04
    HFIR: mmio.Mmio(packed struct(u32) {
        /// Frame interval
        FRIVL: u16 = 0xEA60,
        padding: u16 = 0,
    }),
    /// OTG_FS host frame number/frame time remaining register (OTG_FS_HFNUM)
    /// offset: 0x08
    FS_HFNUM: mmio.Mmio(packed struct(u32) {
        /// Frame number
        FRNUM: u16 = 0x3FFF,
        /// Frame time remaining
        FTREM: u16 = 0x0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// OTG_FS_Host periodic transmit FIFO/queue status register (OTG_FS_HPTXSTS)
    /// offset: 0x10
    FS_HPTXSTS: mmio.Mmio(packed struct(u32) {
        /// Periodic transmit data FIFO space available
        PTXFSAVL: u16 = 0x100,
        /// Periodic transmit request queue space available
        PTXQSAV: u8 = 0x8,
        /// Top of the periodic transmit request queue
        PTXQTOP: u8 = 0x0,
    }),
    /// OTG_FS Host all channels interrupt register
    /// offset: 0x14
    HAINT: mmio.Mmio(packed struct(u32) {
        /// Channel interrupts
        HAINT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// OTG_FS host all channels interrupt mask register
    /// offset: 0x18
    HAINTMSK: mmio.Mmio(packed struct(u32) {
        /// Channel interrupt mask
        HAINTM: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// offset: 0x1c
    reserved28: [36]u8,
    /// OTG_FS host port control and status register (OTG_FS_HPRT)
    /// offset: 0x40
    FS_HPRT: mmio.Mmio(packed struct(u32) {
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
    /// OTG_FS host channel-0 characteristics register (OTG_FS_HCCHAR0)
    /// offset: 0x100
    FS_HCCHAR0: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x104
    reserved260: [4]u8,
    /// OTG_FS host channel-0 interrupt register (OTG_FS_HCINT0)
    /// offset: 0x108
    FS_HCINT0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-0 mask register (OTG_FS_HCINTMSK0)
    /// offset: 0x10c
    FS_HCINTMSK0: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-0 transfer size register
    /// offset: 0x110
    FS_HCTSIZ0: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x114
    reserved276: [12]u8,
    /// OTG_FS host channel-1 characteristics register (OTG_FS_HCCHAR1)
    /// offset: 0x120
    FS_HCCHAR1: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x124
    reserved292: [4]u8,
    /// OTG_FS host channel-1 interrupt register (OTG_FS_HCINT1)
    /// offset: 0x128
    FS_HCINT1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-1 mask register (OTG_FS_HCINTMSK1)
    /// offset: 0x12c
    FS_HCINTMSK1: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-1 transfer size register
    /// offset: 0x130
    FS_HCTSIZ1: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x134
    reserved308: [12]u8,
    /// OTG_FS host channel-2 characteristics register (OTG_FS_HCCHAR2)
    /// offset: 0x140
    FS_HCCHAR2: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x144
    reserved324: [4]u8,
    /// OTG_FS host channel-2 interrupt register (OTG_FS_HCINT2)
    /// offset: 0x148
    FS_HCINT2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-2 mask register (OTG_FS_HCINTMSK2)
    /// offset: 0x14c
    FS_HCINTMSK2: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-2 transfer size register
    /// offset: 0x150
    FS_HCTSIZ2: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x154
    reserved340: [12]u8,
    /// OTG_FS host channel-3 characteristics register (OTG_FS_HCCHAR3)
    /// offset: 0x160
    FS_HCCHAR3: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x164
    reserved356: [4]u8,
    /// OTG_FS host channel-3 interrupt register (OTG_FS_HCINT3)
    /// offset: 0x168
    FS_HCINT3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-3 mask register (OTG_FS_HCINTMSK3)
    /// offset: 0x16c
    FS_HCINTMSK3: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-3 transfer size register
    /// offset: 0x170
    FS_HCTSIZ3: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x174
    reserved372: [12]u8,
    /// OTG_FS host channel-4 characteristics register (OTG_FS_HCCHAR4)
    /// offset: 0x180
    FS_HCCHAR4: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x184
    reserved388: [4]u8,
    /// OTG_FS host channel-4 interrupt register (OTG_FS_HCINT4)
    /// offset: 0x188
    FS_HCINT4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-4 mask register (OTG_FS_HCINTMSK4)
    /// offset: 0x18c
    FS_HCINTMSK4: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-x transfer size register
    /// offset: 0x190
    FS_HCTSIZ4: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x194
    reserved404: [12]u8,
    /// OTG_FS host channel-5 characteristics register (OTG_FS_HCCHAR5)
    /// offset: 0x1a0
    FS_HCCHAR5: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x1a4
    reserved420: [4]u8,
    /// OTG_FS host channel-5 interrupt register (OTG_FS_HCINT5)
    /// offset: 0x1a8
    FS_HCINT5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-5 mask register (OTG_FS_HCINTMSK5)
    /// offset: 0x1ac
    FS_HCINTMSK5: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-5 transfer size register
    /// offset: 0x1b0
    FS_HCTSIZ5: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x1b4
    reserved436: [12]u8,
    /// OTG_FS host channel-6 characteristics register (OTG_FS_HCCHAR6)
    /// offset: 0x1c0
    FS_HCCHAR6: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x1c4
    reserved452: [4]u8,
    /// OTG_FS host channel-6 interrupt register (OTG_FS_HCINT6)
    /// offset: 0x1c8
    FS_HCINT6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-6 mask register (OTG_FS_HCINTMSK6)
    /// offset: 0x1cc
    FS_HCINTMSK6: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-6 transfer size register
    /// offset: 0x1d0
    FS_HCTSIZ6: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x1d4
    reserved468: [12]u8,
    /// OTG_FS host channel-7 characteristics register (OTG_FS_HCCHAR7)
    /// offset: 0x1e0
    FS_HCCHAR7: mmio.Mmio(packed struct(u32) {
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
        /// Multicount
        MCNT: u2 = 0x0,
        /// Device address
        DAD: u7 = 0x0,
        /// Odd frame
        ODDFRM: u1 = 0x0,
        /// Channel disable
        CHDIS: u1 = 0x0,
        /// Channel enable
        CHENA: u1 = 0x0,
    }),
    /// offset: 0x1e4
    reserved484: [4]u8,
    /// OTG_FS host channel-7 interrupt register (OTG_FS_HCINT7)
    /// offset: 0x1e8
    FS_HCINT7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed
        XFRC: u1 = 0x0,
        /// Channel halted
        CHH: u1 = 0x0,
        reserved3: u1 = 0,
        /// STALL response received interrupt
        STALL: u1 = 0x0,
        /// NAK response received interrupt
        NAK: u1 = 0x0,
        /// ACK response received/transmitted interrupt
        ACK: u1 = 0x0,
        reserved7: u1 = 0,
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
    /// OTG_FS host channel-7 mask register (OTG_FS_HCINTMSK7)
    /// offset: 0x1ec
    FS_HCINTMSK7: mmio.Mmio(packed struct(u32) {
        /// Transfer completed mask
        XFRCM: u1 = 0x0,
        /// Channel halted mask
        CHHM: u1 = 0x0,
        reserved3: u1 = 0,
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
    /// OTG_FS host channel-7 transfer size register
    /// offset: 0x1f0
    FS_HCTSIZ7: mmio.Mmio(packed struct(u32) {
        /// Transfer size
        XFRSIZ: u19 = 0x0,
        /// Packet count
        PKTCNT: u10 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        padding: u1 = 0,
    }),
};
