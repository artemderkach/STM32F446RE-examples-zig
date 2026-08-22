const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Universal synchronous asynchronous receiver transmitter
pub const UART4 = extern struct {
    /// Status register
    /// offset: 0x00
    SR: mmio.Mmio(packed struct(u32) {
        /// Parity error
        PE: u1 = 0x0,
        /// Framing error
        FE: u1 = 0x0,
        /// Noise detected flag
        NF: u1 = 0x0,
        /// Overrun error
        ORE: u1 = 0x0,
        /// IDLE line detected
        IDLE: u1 = 0x0,
        /// Read data register not empty
        RXNE: u1 = 0x0,
        /// Transmission complete
        TC: u1 = 0x0,
        /// Transmit data register empty
        TXE: u1 = 0x0,
        /// LIN break detection flag
        LBD: u1 = 0x0,
        padding: u23 = 0,
    }),
    /// Data register
    /// offset: 0x04
    DR: mmio.Mmio(packed struct(u32) {
        /// Data value
        DR: u9 = 0x0,
        padding: u23 = 0,
    }),
    /// Baud rate register
    /// offset: 0x08
    BRR: mmio.Mmio(packed struct(u32) {
        /// fraction of USARTDIV
        DIV_Fraction: u4 = 0x0,
        /// mantissa of USARTDIV
        DIV_Mantissa: u12 = 0x0,
        padding: u16 = 0,
    }),
    /// Control register 1
    /// offset: 0x0c
    CR1: mmio.Mmio(packed struct(u32) {
        /// Send break
        SBK: u1 = 0x0,
        /// Receiver wakeup
        RWU: u1 = 0x0,
        /// Receiver enable
        RE: u1 = 0x0,
        /// Transmitter enable
        TE: u1 = 0x0,
        /// IDLE interrupt enable
        IDLEIE: u1 = 0x0,
        /// RXNE interrupt enable
        RXNEIE: u1 = 0x0,
        /// Transmission complete interrupt enable
        TCIE: u1 = 0x0,
        /// TXE interrupt enable
        TXEIE: u1 = 0x0,
        /// PE interrupt enable
        PEIE: u1 = 0x0,
        /// Parity selection
        PS: u1 = 0x0,
        /// Parity control enable
        PCE: u1 = 0x0,
        /// Wakeup method
        WAKE: u1 = 0x0,
        /// Word length
        M: u1 = 0x0,
        /// USART enable
        UE: u1 = 0x0,
        reserved15: u1 = 0,
        /// Oversampling mode
        OVER8: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Control register 2
    /// offset: 0x10
    CR2: mmio.Mmio(packed struct(u32) {
        /// Address of the USART node
        ADD: u4 = 0x0,
        reserved5: u1 = 0,
        /// lin break detection length
        LBDL: u1 = 0x0,
        /// LIN break detection interrupt enable
        LBDIE: u1 = 0x0,
        reserved12: u5 = 0,
        /// STOP bits
        STOP: u2 = 0x0,
        /// LIN mode enable
        LINEN: u1 = 0x0,
        padding: u17 = 0,
    }),
    /// Control register 3
    /// offset: 0x14
    CR3: mmio.Mmio(packed struct(u32) {
        /// Error interrupt enable
        EIE: u1 = 0x0,
        /// IrDA mode enable
        IREN: u1 = 0x0,
        /// IrDA low-power
        IRLP: u1 = 0x0,
        /// Half-duplex selection
        HDSEL: u1 = 0x0,
        reserved6: u2 = 0,
        /// DMA enable receiver
        DMAR: u1 = 0x0,
        /// DMA enable transmitter
        DMAT: u1 = 0x0,
        reserved11: u3 = 0,
        /// One sample bit method enable
        ONEBIT: u1 = 0x0,
        padding: u20 = 0,
    }),
};
