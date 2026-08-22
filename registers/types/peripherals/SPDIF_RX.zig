const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Receiver Interface
pub const SPDIF_RX = extern struct {
    /// Control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// Peripheral Block Enable
        SPDIFEN: u2 = 0x0,
        /// Receiver DMA ENable for data flow
        RXDMAEN: u1 = 0x0,
        /// STerEO Mode
        RXSTEO: u1 = 0x0,
        /// RX Data format
        DRFMT: u2 = 0x0,
        /// Mask Parity error bit
        PMSK: u1 = 0x0,
        /// Mask of Validity bit
        VMSK: u1 = 0x0,
        /// Mask of channel status and user bits
        CUMSK: u1 = 0x0,
        /// Mask of Preamble Type bits
        PTMSK: u1 = 0x0,
        /// Control Buffer DMA ENable for control flow
        CBDMAEN: u1 = 0x0,
        /// Channel Selection
        CHSEL: u1 = 0x0,
        /// Maximum allowed re-tries during synchronization phase
        NBTR: u2 = 0x0,
        /// Wait For Activity
        WFA: u1 = 0x0,
        reserved16: u1 = 0,
        /// input selection
        INSEL: u3 = 0x0,
        padding: u13 = 0,
    }),
    /// Interrupt mask register
    /// offset: 0x04
    IMR: mmio.Mmio(packed struct(u32) {
        /// RXNE interrupt enable
        RXNEIE: u1 = 0x0,
        /// Control Buffer Ready Interrupt Enable
        CSRNEIE: u1 = 0x0,
        /// Parity error interrupt enable
        PERRIE: u1 = 0x0,
        /// Overrun error Interrupt Enable
        OVRIE: u1 = 0x0,
        /// Synchronization Block Detected Interrupt Enable
        SBLKIE: u1 = 0x0,
        /// Synchronization Done
        SYNCDIE: u1 = 0x0,
        /// Serial Interface Error Interrupt Enable
        IFEIE: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// Status register
    /// offset: 0x08
    SR: mmio.Mmio(packed struct(u32) {
        /// Read data register not empty
        RXNE: u1 = 0x0,
        /// Control Buffer register is not empty
        CSRNE: u1 = 0x0,
        /// Parity error
        PERR: u1 = 0x0,
        /// Overrun error
        OVR: u1 = 0x0,
        /// Synchronization Block Detected
        SBD: u1 = 0x0,
        /// Synchronization Done
        SYNCD: u1 = 0x0,
        /// Framing error
        FERR: u1 = 0x0,
        /// Synchronization error
        SERR: u1 = 0x0,
        /// Time-out error
        TERR: u1 = 0x0,
        reserved16: u7 = 0,
        /// Duration of 5 symbols counted with SPDIF_CLK
        WIDTH5: u15 = 0x0,
        padding: u1 = 0,
    }),
    /// Interrupt Flag Clear register
    /// offset: 0x0c
    IFCR: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Clears the Parity error flag
        PERRCF: u1 = 0x0,
        /// Clears the Overrun error flag
        OVRCF: u1 = 0x0,
        /// Clears the Synchronization Block Detected flag
        SBDCF: u1 = 0x0,
        /// Clears the Synchronization Done flag
        SYNCDCF: u1 = 0x0,
        padding: u26 = 0,
    }),
    /// Data input register
    /// offset: 0x10
    DR: mmio.Mmio(packed struct(u32) {
        /// Parity Error bit
        DR: u24 = 0x0,
        /// Parity Error bit
        PE: u1 = 0x0,
        /// Validity bit
        V: u1 = 0x0,
        /// User bit
        U: u1 = 0x0,
        /// Channel Status bit
        C: u1 = 0x0,
        /// Preamble Type
        PT: u2 = 0x0,
        padding: u2 = 0,
    }),
    /// Channel Status register
    /// offset: 0x14
    CSR: mmio.Mmio(packed struct(u32) {
        /// User data information
        USR: u16 = 0x0,
        /// Channel A status information
        CS: u8 = 0x0,
        /// Start Of Block
        SOB: u1 = 0x0,
        padding: u7 = 0,
    }),
    /// Debug Information register
    /// offset: 0x18
    DIR: mmio.Mmio(packed struct(u32) {
        /// Threshold HIGH
        THI: u13 = 0x0,
        reserved16: u3 = 0,
        /// Threshold LOW
        TLO: u13 = 0x0,
        padding: u3 = 0,
    }),
};
