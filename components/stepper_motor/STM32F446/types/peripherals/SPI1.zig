const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Serial peripheral interface
pub const SPI1 = extern struct {
    /// control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Clock phase
        CPHA: u1 = 0x0,
        /// Clock polarity
        CPOL: u1 = 0x0,
        /// Master selection
        MSTR: u1 = 0x0,
        /// Baud rate control
        BR: u3 = 0x0,
        /// SPI enable
        SPE: u1 = 0x0,
        /// Frame format
        LSBFIRST: u1 = 0x0,
        /// Internal slave select
        SSI: u1 = 0x0,
        /// Software slave management
        SSM: u1 = 0x0,
        /// Receive only
        RXONLY: u1 = 0x0,
        /// Data frame format
        DFF: u1 = 0x0,
        /// CRC transfer next
        CRCNEXT: u1 = 0x0,
        /// Hardware CRC calculation enable
        CRCEN: u1 = 0x0,
        /// Output enable in bidirectional mode
        BIDIOE: u1 = 0x0,
        /// Bidirectional data mode enable
        BIDIMODE: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        /// Rx buffer DMA enable
        RXDMAEN: u1 = 0x0,
        /// Tx buffer DMA enable
        TXDMAEN: u1 = 0x0,
        /// SS output enable
        SSOE: u1 = 0x0,
        reserved4: u1 = 0,
        /// Frame format
        FRF: u1 = 0x0,
        /// Error interrupt enable
        ERRIE: u1 = 0x0,
        /// RX buffer not empty interrupt enable
        RXNEIE: u1 = 0x0,
        /// Tx buffer empty interrupt enable
        TXEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// status register
    /// offset: 0x08
    SR: mmio.Mmio(packed struct(u32) {
        /// Receive buffer not empty
        RXNE: u1 = 0x0,
        /// Transmit buffer empty
        TXE: u1 = 0x1,
        /// Channel side
        CHSIDE: u1 = 0x0,
        /// Underrun flag
        UDR: u1 = 0x0,
        /// CRC error flag
        CRCERR: u1 = 0x0,
        /// Mode fault
        MODF: u1 = 0x0,
        /// Overrun flag
        OVR: u1 = 0x0,
        /// Busy flag
        BSY: u1 = 0x0,
        /// TI frame format error
        TIFRFE: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// data register
    /// offset: 0x0c
    DR: mmio.Mmio(packed struct(u32) {
        /// Data register
        DR: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// CRC polynomial register
    /// offset: 0x10
    CRCPR: mmio.Mmio(packed struct(u32) {
        /// CRC polynomial register
        CRCPOLY: u16 = 0x7,
        padding: u16 = 0,
    }),
    /// RX CRC register
    /// offset: 0x14
    RXCRCR: mmio.Mmio(packed struct(u32) {
        /// Rx CRC register
        RxCRC: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// TX CRC register
    /// offset: 0x18
    TXCRCR: mmio.Mmio(packed struct(u32) {
        /// Tx CRC register
        TxCRC: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// I2S configuration register
    /// offset: 0x1c
    I2SCFGR: mmio.Mmio(packed struct(u32) {
        /// Channel length (number of bits per audio channel)
        CHLEN: u1 = 0x0,
        /// Data length to be transferred
        DATLEN: u2 = 0x0,
        /// Steady state clock polarity
        CKPOL: u1 = 0x0,
        /// I2S standard selection
        I2SSTD: u2 = 0x0,
        reserved7: u1 = 0,
        /// PCM frame synchronization
        PCMSYNC: u1 = 0x0,
        /// I2S configuration mode
        I2SCFG: u2 = 0x0,
        /// I2S Enable
        I2SE: u1 = 0x0,
        /// I2S mode selection
        I2SMOD: u1 = 0x0,
        padding: u20 = 0,
    }),
    /// I2S prescaler register
    /// offset: 0x20
    I2SPR: mmio.Mmio(packed struct(u32) {
        /// I2S Linear prescaler
        I2SDIV: u8 = 0xA,
        /// Odd factor for the prescaler
        ODD: u1 = 0x0,
        /// Master clock output enable
        MCKOE: u1 = 0x0,
        padding: u22 = 0,
    }),
};
