const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Digital camera interface
pub const DCMI = extern struct {
    /// control register 1
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// Capture enable
        CAPTURE: u1 = 0x0,
        /// Capture mode
        CM: u1 = 0x0,
        /// Crop feature
        CROP: u1 = 0x0,
        /// JPEG format
        JPEG: u1 = 0x0,
        /// Embedded synchronization select
        ESS: u1 = 0x0,
        /// Pixel clock polarity
        PCKPOL: u1 = 0x0,
        /// Horizontal synchronization polarity
        HSPOL: u1 = 0x0,
        /// Vertical synchronization polarity
        VSPOL: u1 = 0x0,
        /// Frame capture rate control
        FCRC: u2 = 0x0,
        /// Extended data mode
        EDM: u2 = 0x0,
        reserved14: u2 = 0,
        /// DCMI enable
        ENABLE: u1 = 0x0,
        reserved16: u1 = 0,
        /// Byte Select mode
        BSM: u2 = 0x0,
        /// Odd/Even Byte Select
        OEBS: u1 = 0x0,
        /// Line Select mode
        LSM: u1 = 0x0,
        /// Odd/Even Line Select
        OELS: u1 = 0x0,
        padding: u11 = 0,
    }),
    /// status register
    /// offset: 0x04
    SR: mmio.Mmio(packed struct(u32) {
        /// HSYNC
        HSYNC: u1 = 0x0,
        /// VSYNC
        VSYNC: u1 = 0x0,
        /// FIFO not empty
        FNE: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// raw interrupt status register
    /// offset: 0x08
    RIS: mmio.Mmio(packed struct(u32) {
        /// Capture complete raw interrupt status
        FRAME_RIS: u1 = 0x0,
        /// Overrun raw interrupt status
        OVR_RIS: u1 = 0x0,
        /// Synchronization error raw interrupt status
        ERR_RIS: u1 = 0x0,
        /// VSYNC raw interrupt status
        VSYNC_RIS: u1 = 0x0,
        /// Line raw interrupt status
        LINE_RIS: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// interrupt enable register
    /// offset: 0x0c
    IER: mmio.Mmio(packed struct(u32) {
        /// Capture complete interrupt enable
        FRAME_IE: u1 = 0x0,
        /// Overrun interrupt enable
        OVR_IE: u1 = 0x0,
        /// Synchronization error interrupt enable
        ERR_IE: u1 = 0x0,
        /// VSYNC interrupt enable
        VSYNC_IE: u1 = 0x0,
        /// Line interrupt enable
        LINE_IE: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// masked interrupt status register
    /// offset: 0x10
    MIS: mmio.Mmio(packed struct(u32) {
        /// Capture complete masked interrupt status
        FRAME_MIS: u1 = 0x0,
        /// Overrun masked interrupt status
        OVR_MIS: u1 = 0x0,
        /// Synchronization error masked interrupt status
        ERR_MIS: u1 = 0x0,
        /// VSYNC masked interrupt status
        VSYNC_MIS: u1 = 0x0,
        /// Line masked interrupt status
        LINE_MIS: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// interrupt clear register
    /// offset: 0x14
    ICR: mmio.Mmio(packed struct(u32) {
        /// Capture complete interrupt status clear
        FRAME_ISC: u1 = 0x0,
        /// Overrun interrupt status clear
        OVR_ISC: u1 = 0x0,
        /// Synchronization error interrupt status clear
        ERR_ISC: u1 = 0x0,
        /// Vertical synch interrupt status clear
        VSYNC_ISC: u1 = 0x0,
        /// line interrupt status clear
        LINE_ISC: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// embedded synchronization code register
    /// offset: 0x18
    ESCR: mmio.Mmio(packed struct(u32) {
        /// Frame start delimiter code
        FSC: u8 = 0x0,
        /// Line start delimiter code
        LSC: u8 = 0x0,
        /// Line end delimiter code
        LEC: u8 = 0x0,
        /// Frame end delimiter code
        FEC: u8 = 0x0,
    }),
    /// embedded synchronization unmask register
    /// offset: 0x1c
    ESUR: mmio.Mmio(packed struct(u32) {
        /// Frame start delimiter unmask
        FSU: u8 = 0x0,
        /// Line start delimiter unmask
        LSU: u8 = 0x0,
        /// Line end delimiter unmask
        LEU: u8 = 0x0,
        /// Frame end delimiter unmask
        FEU: u8 = 0x0,
    }),
    /// crop window start
    /// offset: 0x20
    CWSTRT: mmio.Mmio(packed struct(u32) {
        /// Horizontal offset count
        HOFFCNT: u14 = 0x0,
        reserved16: u2 = 0,
        /// Vertical start line count
        VST: u13 = 0x0,
        padding: u3 = 0,
    }),
    /// crop window size
    /// offset: 0x24
    CWSIZE: mmio.Mmio(packed struct(u32) {
        /// Capture count
        CAPCNT: u14 = 0x0,
        reserved16: u2 = 0,
        /// Vertical line count
        VLINE: u14 = 0x0,
        padding: u2 = 0,
    }),
    /// data register
    /// offset: 0x28
    DR: mmio.Mmio(packed struct(u32) {
        /// Data byte 0
        Byte0: u8 = 0x0,
        /// Data byte 1
        Byte1: u8 = 0x0,
        /// Data byte 2
        Byte2: u8 = 0x0,
        /// Data byte 3
        Byte3: u8 = 0x0,
    }),
};
