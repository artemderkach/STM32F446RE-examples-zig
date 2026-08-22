const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// USB on the go full speed
pub const OTG_FS_GLOBAL = extern struct {
    /// OTG_FS control and status register (OTG_FS_GOTGCTL)
    /// offset: 0x00
    FS_GOTGCTL: mmio.Mmio(packed struct(u32) {
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
    /// OTG_FS interrupt register (OTG_FS_GOTGINT)
    /// offset: 0x04
    FS_GOTGINT: mmio.Mmio(packed struct(u32) {
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
    /// OTG_FS AHB configuration register (OTG_FS_GAHBCFG)
    /// offset: 0x08
    FS_GAHBCFG: mmio.Mmio(packed struct(u32) {
        /// Global interrupt mask
        GINT: u1 = 0x0,
        reserved7: u6 = 0,
        /// TxFIFO empty level
        TXFELVL: u1 = 0x0,
        /// Periodic TxFIFO empty level
        PTXFELVL: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// OTG_FS USB configuration register (OTG_FS_GUSBCFG)
    /// offset: 0x0c
    FS_GUSBCFG: mmio.Mmio(packed struct(u32) {
        /// FS timeout calibration
        TOCAL: u3 = 0x0,
        reserved6: u3 = 0,
        /// Full Speed serial transceiver select
        PHYSEL: u1 = 0x0,
        reserved8: u1 = 0,
        /// SRP-capable
        SRPCAP: u1 = 0x0,
        /// HNP-capable
        HNPCAP: u1 = 0x1,
        /// USB turnaround time
        TRDT: u4 = 0x2,
        reserved29: u15 = 0,
        /// Force host mode
        FHMOD: u1 = 0x0,
        /// Force device mode
        FDMOD: u1 = 0x0,
        /// Corrupt Tx packet
        CTXPKT: u1 = 0x0,
    }),
    /// OTG_FS reset register (OTG_FS_GRSTCTL)
    /// offset: 0x10
    FS_GRSTCTL: mmio.Mmio(packed struct(u32) {
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
        reserved31: u20 = 0,
        /// AHB master idle
        AHBIDL: u1 = 0x0,
    }),
    /// OTG_FS core interrupt register (OTG_FS_GINTSTS)
    /// offset: 0x14
    FS_GINTSTS: mmio.Mmio(packed struct(u32) {
        /// Current mode of operation
        CMOD: u1 = 0x0,
        /// Mode mismatch interrupt
        MMIS: u1 = 0x0,
        /// OTG interrupt
        OTGINT: u1 = 0x0,
        /// Start of frame
        SOF: u1 = 0x0,
        /// RxFIFO non-empty
        RXFLVL: u1 = 0x0,
        /// Non-periodic TxFIFO empty
        NPTXFE: u1 = 0x1,
        /// Global IN non-periodic NAK effective
        GINAKEFF: u1 = 0x0,
        /// Global OUT NAK effective
        GOUTNAKEFF: u1 = 0x0,
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
        /// Incomplete periodic transfer(Host mode)/Incomplete isochronous OUT transfer(Device mode)
        IPXFR_INCOMPISOOUT: u1 = 0x0,
        reserved24: u2 = 0,
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
        WKUPINT: u1 = 0x0,
    }),
    /// OTG_FS interrupt mask register (OTG_FS_GINTMSK)
    /// offset: 0x18
    FS_GINTMSK: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Mode mismatch interrupt mask
        MMISM: u1 = 0x0,
        /// OTG interrupt mask
        OTGINT: u1 = 0x0,
        /// Start of frame mask
        SOFM: u1 = 0x0,
        /// Receive FIFO non-empty mask
        RXFLVLM: u1 = 0x0,
        /// Non-periodic TxFIFO empty mask
        NPTXFEM: u1 = 0x0,
        /// Global non-periodic IN NAK effective mask
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
        /// Incomplete periodic transfer mask(Host mode)/Incomplete isochronous OUT transfer mask(Device mode)
        IPXFRM_IISOOXFRM: u1 = 0x0,
        reserved24: u2 = 0,
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
    /// OTG_FS Receive status debug read(Device mode)
    /// offset: 0x1c
    FS_GRXSTSR_Device: mmio.Mmio(packed struct(u32) {
        /// Endpoint number
        EPNUM: u4 = 0x0,
        /// Byte count
        BCNT: u11 = 0x0,
        /// Data PID
        DPID: u2 = 0x0,
        /// Packet status
        PKTSTS: u4 = 0x0,
        /// Frame number
        FRMNUM: u4 = 0x0,
        padding: u7 = 0,
    }),
    /// offset: 0x20
    reserved32: [4]u8,
    /// OTG_FS Receive FIFO size register (OTG_FS_GRXFSIZ)
    /// offset: 0x24
    FS_GRXFSIZ: mmio.Mmio(packed struct(u32) {
        /// RxFIFO depth
        RXFD: u16 = 0x200,
        padding: u16 = 0,
    }),
    /// OTG_FS non-periodic transmit FIFO size register (Device mode)
    /// offset: 0x28
    FS_GNPTXFSIZ_Device: mmio.Mmio(packed struct(u32) {
        /// Endpoint 0 transmit RAM start address
        TX0FSA: u16 = 0x200,
        /// Endpoint 0 TxFIFO depth
        TX0FD: u16 = 0x0,
    }),
    /// OTG_FS non-periodic transmit FIFO/queue status register (OTG_FS_GNPTXSTS)
    /// offset: 0x2c
    FS_GNPTXSTS: mmio.Mmio(packed struct(u32) {
        /// Non-periodic TxFIFO space available
        NPTXFSAV: u16 = 0x200,
        /// Non-periodic transmit request queue space available
        NPTQXSAV: u8 = 0x8,
        /// Top of the non-periodic transmit request queue
        NPTXQTOP: u7 = 0x0,
        padding: u1 = 0,
    }),
    /// offset: 0x30
    reserved48: [8]u8,
    /// OTG_FS general core configuration register (OTG_FS_GCCFG)
    /// offset: 0x38
    FS_GCCFG: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Power down
        PWRDWN: u1 = 0x0,
        reserved18: u1 = 0,
        /// Enable the VBUS sensing device
        VBUSASEN: u1 = 0x0,
        /// Enable the VBUS sensing device
        VBUSBSEN: u1 = 0x0,
        /// SOF output enable
        SOFOUTEN: u1 = 0x0,
        padding: u11 = 0,
    }),
    /// core ID register
    /// offset: 0x3c
    FS_CID: mmio.Mmio(packed struct(u32) {
        /// Product ID field
        PRODUCT_ID: u32 = 0x1000,
    }),
    /// offset: 0x40
    reserved64: [192]u8,
    /// OTG_FS Host periodic transmit FIFO size register (OTG_FS_HPTXFSIZ)
    /// offset: 0x100
    FS_HPTXFSIZ: mmio.Mmio(packed struct(u32) {
        /// Host periodic TxFIFO start address
        PTXSA: u16 = 0x600,
        /// Host periodic TxFIFO depth
        PTXFSIZ: u16 = 0x200,
    }),
    /// OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF2)
    /// offset: 0x104
    FS_DIEPTXF1: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFO2 transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF3)
    /// offset: 0x108
    FS_DIEPTXF2: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFO3 transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
    /// OTG_FS device IN endpoint transmit FIFO size register (OTG_FS_DIEPTXF4)
    /// offset: 0x10c
    FS_DIEPTXF3: mmio.Mmio(packed struct(u32) {
        /// IN endpoint FIFO4 transmit RAM start address
        INEPTXSA: u16 = 0x400,
        /// IN endpoint TxFIFO depth
        INEPTXFD: u16 = 0x200,
    }),
};
