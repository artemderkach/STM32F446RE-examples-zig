const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go high speed
pub const OTG_HS_GLOBAL = extern struct {
    /// OTG_HS control and status register
    /// offset: 0x00
    OTG_HS_GOTGCTL: mmio.Mmio(packed struct(u32) {
        /// Session request success
        SRQSCS: u1 = 0x0,
        /// Session request
        SRQ: u1 = 0x0,
        reserved8: u6 = 0,
        /// Host negotiation success
        HNGSCS: u1 = 0x0,
        /// HNP request
        HNPRQ: u1 = 0x0,
        /// Host set HNP enable
        HSHNPEN: u1 = 0x0,
        /// Device HNP enabled
        DHNPEN: u1 = 0x1,
        reserved16: u4 = 0,
        /// Connector ID status
        CIDSTS: u1 = 0x0,
        /// Long/short debounce time
        DBCT: u1 = 0x0,
        /// A-session valid
        ASVLD: u1 = 0x0,
        /// B-session valid
        BSVLD: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// OTG_HS interrupt register
    /// offset: 0x04
    OTG_HS_GOTGINT: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Session end detected
        SEDET: u1 = 0x0,
        reserved8: u5 = 0,
        /// Session request success status change
        SRSSCHG: u1 = 0x0,
        /// Host negotiation success status change
        HNSSCHG: u1 = 0x0,
        reserved17: u7 = 0,
        /// Host negotiation detected
        HNGDET: u1 = 0x0,
        /// A-device timeout change
        ADTOCHG: u1 = 0x0,
        /// Debounce done
        DBCDNE: u1 = 0x0,
        padding: u12 = 0,
    }),
    /// OTG_HS AHB configuration register
    /// offset: 0x08
    OTG_HS_GAHBCFG: mmio.Mmio(packed struct(u32) {
        /// Global interrupt mask
        GINT: u1 = 0x0,
        /// Burst length/type
        HBSTLEN: u4 = 0x0,
        /// DMA enable
        DMAEN: u1 = 0x0,
        reserved7: u1 = 0,
        /// TxFIFO empty level
        TXFELVL: u1 = 0x0,
        /// Periodic TxFIFO empty level
        PTXFELVL: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// OTG_HS USB configuration register
    /// offset: 0x0c
    OTG_HS_GUSBCFG: mmio.Mmio(packed struct(u32) {
        /// FS timeout calibration
        TOCAL: u3 = 0x0,
        reserved6: u3 = 0,
        /// USB 2.0 high-speed ULPI PHY or USB 1.1 full-speed serial transceiver select
        PHYSEL: u1 = 0x0,
        reserved8: u1 = 0,
        /// SRP-capable
        SRPCAP: u1 = 0x0,
        /// HNP-capable
        HNPCAP: u1 = 0x1,
        /// USB turnaround time
        TRDT: u4 = 0x2,
        reserved15: u1 = 0,
        /// PHY Low-power clock select
        PHYLPCS: u1 = 0x0,
        reserved17: u1 = 0,
        /// ULPI FS/LS select
        ULPIFSLS: u1 = 0x0,
        /// ULPI Auto-resume
        ULPIAR: u1 = 0x0,
        /// ULPI Clock SuspendM
        ULPICSM: u1 = 0x0,
        /// ULPI External VBUS Drive
        ULPIEVBUSD: u1 = 0x0,
        /// ULPI external VBUS indicator
        ULPIEVBUSI: u1 = 0x0,
        /// TermSel DLine pulsing selection
        TSDPS: u1 = 0x0,
        /// Indicator complement
        PCCI: u1 = 0x0,
        /// Indicator pass through
        PTCI: u1 = 0x0,
        /// ULPI interface protect disable
        ULPIIPD: u1 = 0x0,
        reserved29: u3 = 0,
        /// Forced host mode
        FHMOD: u1 = 0x0,
        /// Forced peripheral mode
        FDMOD: u1 = 0x0,
        /// Corrupt Tx packet
        CTXPKT: u1 = 0x0,
    }),
    /// OTG_HS reset register
    /// offset: 0x10
    OTG_HS_GRSTCTL: mmio.Mmio(packed struct(u32) {
        /// Core soft reset
        CSRST: u1 = 0x0,
        /// HCLK soft reset
        HSRST: u1 = 0x0,
        /// Host frame counter reset
        FCRST: u1 = 0x0,
        reserved4: u1 = 0,
        /// RxFIFO flush
        RXFFLSH: u1 = 0x0,
        /// TxFIFO flush
        TXFFLSH: u1 = 0x0,
        /// TxFIFO number
        TXFNUM: u5 = 0x0,
        reserved30: u19 = 0,
        /// DMA request signal
        DMAREQ: u1 = 0x0,
        /// AHB master idle
        AHBIDL: u1 = 0x0,
    }),
    /// OTG_HS core interrupt register
    /// offset: 0x14
    OTG_HS_GINTSTS: mmio.Mmio(packed struct(u32) {
        /// Current mode of operation
        CMOD: u1 = 0x0,
        /// Mode mismatch interrupt
        MMIS: u1 = 0x0,
        /// OTG interrupt
        OTGINT: u1 = 0x0,
        /// Start of frame
        SOF: u1 = 0x0,
        /// RxFIFO nonempty
        RXFLVL: u1 = 0x0,
        /// Nonperiodic TxFIFO empty
        NPTXFE: u1 = 0x1,
        /// Global IN nonperiodic NAK effective
        GINAKEFF: u1 = 0x0,
        /// Global OUT NAK effective
        BOUTNAKEFF: u1 = 0x0,
        reserved10: u2 = 0,
        /// Early suspend
        ESUSP: u1 = 0x0,
        /// USB suspend
        USBSUSP: u1 = 0x0,
        /// USB reset
        USBRST: u1 = 0x0,
        /// Enumeration done
        ENUMDNE: u1 = 0x0,
        /// Isochronous OUT packet dropped interrupt
        ISOODRP: u1 = 0x0,
        /// End of periodic frame interrupt
        EOPF: u1 = 0x0,
        reserved18: u2 = 0,
        /// IN endpoint interrupt
        IEPINT: u1 = 0x0,
        /// OUT endpoint interrupt
        OEPINT: u1 = 0x0,
        /// Incomplete isochronous IN transfer
        IISOIXFR: u1 = 0x0,
        /// Incomplete periodic transfer
        PXFR_INCOMPISOOUT: u1 = 0x0,
        /// Data fetch suspended
        DATAFSUSP: u1 = 0x0,
        reserved24: u1 = 0,
        /// Host port interrupt
        HPRTINT: u1 = 0x0,
        /// Host channels interrupt
        HCINT: u1 = 0x0,
        /// Periodic TxFIFO empty
        PTXFE: u1 = 0x1,
        reserved28: u1 = 0,
        /// Connector ID status change
        CIDSCHG: u1 = 0x0,
        /// Disconnect detected interrupt
        DISCINT: u1 = 0x0,
        /// Session request/new session detected interrupt
        SRQINT: u1 = 0x0,
        /// Resume/remote wakeup detected interrupt
        WKUINT: u1 = 0x0,
    }),
    /// OTG_HS interrupt mask register
    /// offset: 0x18
    OTG_HS_GINTMSK: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Mode mismatch interrupt mask
        MMISM: u1 = 0x0,
        /// OTG interrupt mask
        OTGINT: u1 = 0x0,
        /// Start of frame mask
        SOFM: u1 = 0x0,
        /// Receive FIFO nonempty mask
        RXFLVLM: u1 = 0x0,
        /// Nonperiodic TxFIFO empty mask
        NPTXFEM: u1 = 0x0,
        /// Global nonperiodic IN NAK effective mask
        GINAKEFFM: u1 = 0x0,
        /// Global OUT NAK effective mask
        GONAKEFFM: u1 = 0x0,
        reserved10: u2 = 0,
        /// Early suspend mask
        ESUSPM: u1 = 0x0,
        /// USB suspend mask
        USBSUSPM: u1 = 0x0,
        /// USB reset mask
        USBRST: u1 = 0x0,
        /// Enumeration done mask
        ENUMDNEM: u1 = 0x0,
        /// Isochronous OUT packet dropped interrupt mask
        ISOODRPM: u1 = 0x0,
        /// End of periodic frame interrupt mask
        EOPFM: u1 = 0x0,
        reserved17: u1 = 0,
        /// Endpoint mismatch interrupt mask
        EPMISM: u1 = 0x0,
        /// IN endpoints interrupt mask
        IEPINT: u1 = 0x0,
        /// OUT endpoints interrupt mask
        OEPINT: u1 = 0x0,
        /// Incomplete isochronous IN transfer mask
        IISOIXFRM: u1 = 0x0,
        /// Incomplete periodic transfer mask
        PXFRM_IISOOXFRM: u1 = 0x0,
        /// Data fetch suspended mask
        FSUSPM: u1 = 0x0,
        reserved24: u1 = 0,
        /// Host port interrupt mask
        PRTIM: u1 = 0x0,
        /// Host channels interrupt mask
        HCIM: u1 = 0x0,
        /// Periodic TxFIFO empty mask
        PTXFEM: u1 = 0x0,
        reserved28: u1 = 0,
        /// Connector ID status change mask
        CIDSCHGM: u1 = 0x0,
        /// Disconnect detected interrupt mask
        DISCINT: u1 = 0x0,
        /// Session request/new session detected interrupt mask
        SRQIM: u1 = 0x0,
        /// Resume/remote wakeup detected interrupt mask
        WUIM: u1 = 0x0,
    }),
    /// OTG_HS Receive status debug read register (host mode)
    /// offset: 0x1c
    OTG_HS_GRXSTSR_Host: mmio.Mmio(packed struct(u32) {
        /// Channel number
        CHNUM: u4 = 0x0,
        /// Byte count
        BCNT: u11 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        /// Packet status
        PKTSTS: u4 = 0x0,
        padding: u11 = 0,
    }),
    /// OTG_HS status read and pop register (host mode)
    /// offset: 0x20
    OTG_HS_GRXSTSP_Host: mmio.Mmio(packed struct(u32) {
        /// Channel number
        CHNUM: u4 = 0x0,
        /// Byte count
        BCNT: u11 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        /// Packet status
        PKTSTS: u4 = 0x0,
        padding: u11 = 0,
    }),
    /// OTG_HS Receive FIFO size register
    /// offset: 0x24
    OTG_HS_GRXFSIZ: mmio.Mmio(packed struct(u32) {
        /// RxFIFO depth
        RXFD: u16 = 0x200,
        padding: u16 = 0,
    }),
    /// OTG_HS nonperiodic transmit FIFO size register (host mode)
    /// offset: 0x28
    OTG_HS_GNPTXFSIZ_Host: mmio.Mmio(packed struct(u32) {
        /// Nonperiodic transmit RAM start address
        NPTXFSA: u16 = 0x200,
        /// Nonperiodic TxFIFO depth
        NPTXFD: u16 = 0x0,
    }),
    /// OTG_HS nonperiodic transmit FIFO/queue status register
    /// offset: 0x2c
    OTG_HS_GNPTXSTS: mmio.Mmio(packed struct(u32) {
        /// Nonperiodic TxFIFO space available
        NPTXFSAV: u16 = 0x200,
        /// Nonperiodic transmit request queue space available
        NPTQXSAV: u8 = 0x8,
        /// Top of the nonperiodic transmit request queue
        NPTXQTOP: u7 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x30
    reserved48: [8]u8,
    /// OTG_HS general core configuration register
    /// offset: 0x38
    OTG_HS_GCCFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Power down
        PWRDWN: u1 = 0x0,
        /// Enable I2C bus connection for the external I2C PHY interface
        I2CPADEN: u1 = 0x0,
        /// Enable the VBUS sensing device
        VBUSASEN: u1 = 0x0,
        /// Enable the VBUS sensing device
        VBUSBSEN: u1 = 0x0,
        /// SOF output enable
        SOFOUTEN: u1 = 0x0,
        /// VBUS sensing disable option
        NOVBUSSENS: u1 = 0x0,
        padding: u10 = 0,
    }),
    /// OTG_HS core ID register
    /// offset: 0x3c
    OTG_HS_CID: mmio.Mmio(packed struct(u32) {
        /// Product ID field
        PRODUCT_ID: u32 = 0x1200,
    }),
    /// offset: 0x40
    reserved64: [192]u8,
    /// OTG_HS Host periodic transmit FIFO size register
    /// offset: 0x100
    OTG_HS_HPTXFSIZ: mmio.Mmio(packed struct(u32) {
        /// Host periodic TxFIFO start address
        PTXSA: u16 = 0x600,
        /// Host periodic TxFIFO depth
        PTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x104
    OTG_HS_DIEPTXF1: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x108
    OTG_HS_DIEPTXF2: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// offset: 0x10c
    reserved268: [16]u8,
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x11c
    OTG_HS_DIEPTXF3: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x120
    OTG_HS_DIEPTXF4: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x124
    OTG_HS_DIEPTXF5: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x128
    OTG_HS_DIEPTXF6: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_HS device IN endpoint transmit FIFO size register
    /// offset: 0x12c
    OTG_HS_DIEPTXF7: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFOx transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
};
