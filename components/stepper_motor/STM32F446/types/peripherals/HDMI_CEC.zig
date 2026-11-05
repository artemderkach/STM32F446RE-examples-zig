const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// HDMI-CEC controller
pub const HDMI_CEC = extern struct {
    /// CEC control register
    /// offset: 0x00
    CEC_CR: mmio.Mmio(packed struct(u32) {
        /// CEC Enable
        CECEN: u1 = 0x0,
        /// Tx Start Of Message
        TXSOM: u1 = 0x0,
        /// Tx End Of Message
        TXEOM: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// CEC configuration register
    /// offset: 0x04
    CEC_CFGR: mmio.Mmio(packed struct(u32) {
        /// Signal Free Time
        SFT: u3 = 0x0,
        /// Rx-Tolerance
        RXTOL: u1 = 0x0,
        /// Rx-Stop on Bit Rising Error
        BRESTP: u1 = 0x0,
        /// Generate Error-Bit on Bit Rising Error
        BREGEN: u1 = 0x0,
        /// Generate Error-Bit on Long Bit Period Error
        LBPEGEN: u1 = 0x0,
        /// Avoid Error-Bit Generation in Broadcast
        BRDNOGEN: u1 = 0x0,
        /// SFT Option Bit
        SFTOP: u1 = 0x0,
        reserved16: u7 = 0,
        /// Own addresses configuration
        OAR: u15 = 0x0,
        /// Listen mode
        LSTN: u1 = 0x0,
    }),
    /// CEC Tx data register
    /// offset: 0x08
    CEC_TXDR: mmio.Mmio(packed struct(u32) {
        /// Tx Data register
        TXD: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// CEC Rx Data Register
    /// offset: 0x0c
    CEC_RXDR: mmio.Mmio(packed struct(u32) {
        /// Rx Data register
        RXD: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// CEC Interrupt and Status Register
    /// offset: 0x10
    CEC_ISR: mmio.Mmio(packed struct(u32) {
        /// Rx-Byte Received
        RXBR: u1 = 0x0,
        /// End Of Reception
        RXEND: u1 = 0x0,
        /// Rx-Overrun
        RXOVR: u1 = 0x0,
        /// Rx-Bit Rising Error
        BRE: u1 = 0x0,
        /// Rx-Short Bit Period Error
        SBPE: u1 = 0x0,
        /// Rx-Long Bit Period Error
        LBPE: u1 = 0x0,
        /// Rx-Missing Acknowledge
        RXACKE: u1 = 0x0,
        /// Arbitration Lost
        ARBLST: u1 = 0x0,
        /// Tx-Byte Request
        TXBR: u1 = 0x0,
        /// End of Transmission
        TXEND: u1 = 0x0,
        /// Tx-Buffer Underrun
        TXUDR: u1 = 0x0,
        /// Tx-Error
        TXERR: u1 = 0x0,
        /// Tx-Missing Acknowledge Error
        TXACKE: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// CEC interrupt enable register
    /// offset: 0x14
    CEC_IER: mmio.Mmio(packed struct(u32) {
        /// Rx-Byte Received Interrupt Enable
        RXBRIE: u1 = 0x0,
        /// End Of Reception Interrupt Enable
        RXENDIE: u1 = 0x0,
        /// Rx-Buffer Overrun Interrupt Enable
        RXOVRIE: u1 = 0x0,
        /// Bit Rising Error Interrupt Enable
        BREIE: u1 = 0x0,
        /// Short Bit Period Error Interrupt Enable
        SBPEIE: u1 = 0x0,
        /// Long Bit Period Error Interrupt Enable
        LBPEIE: u1 = 0x0,
        /// Rx-Missing Acknowledge Error Interrupt Enable
        RXACKIE: u1 = 0x0,
        /// Arbitration Lost Interrupt Enable
        ARBLSTIE: u1 = 0x0,
        /// Tx-Byte Request Interrupt Enable
        TXBRIE: u1 = 0x0,
        /// Tx-End Of Message Interrupt Enable
        TXENDIE: u1 = 0x0,
        /// Tx-Underrun Interrupt Enable
        TXUDRIE: u1 = 0x0,
        /// Tx-Error Interrupt Enable
        TXERRIE: u1 = 0x0,
        /// Tx-Missing Acknowledge Error Interrupt Enable
        TXACKIE: u1 = 0x0,
        padding: u19 = 0,
    }),
};
