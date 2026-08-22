const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Inter-integrated circuit
pub const I2C3 = extern struct {
    /// Control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Peripheral enable
        PE: u1 = 0x0,
        /// SMBus mode
        SMBUS: u1 = 0x0,
        reserved3: u1 = 0,
        /// SMBus type
        SMBTYPE: u1 = 0x0,
        /// ARP enable
        ENARP: u1 = 0x0,
        /// PEC enable
        ENPEC: u1 = 0x0,
        /// General call enable
        ENGC: u1 = 0x0,
        /// Clock stretching disable (Slave mode)
        NOSTRETCH: u1 = 0x0,
        /// Start generation
        START: u1 = 0x0,
        /// Stop generation
        STOP: u1 = 0x0,
        /// Acknowledge enable
        ACK: u1 = 0x0,
        /// Acknowledge/PEC Position (for data reception)
        POS: u1 = 0x0,
        /// Packet error checking
        PEC: u1 = 0x0,
        /// SMBus alert
        ALERT: u1 = 0x0,
        reserved15: u1 = 0,
        /// Software reset
        SWRST: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        /// Peripheral clock frequency
        FREQ: u6 = 0x0,
        reserved8: u2 = 0,
        /// Error interrupt enable
        ITERREN: u1 = 0x0,
        /// Event interrupt enable
        ITEVTEN: u1 = 0x0,
        /// Buffer interrupt enable
        ITBUFEN: u1 = 0x0,
        /// DMA requests enable
        DMAEN: u1 = 0x0,
        /// DMA last transfer
        LAST: u1 = 0x0,
        padding: u19 = 0,
    }),
    /// Own address register 1
    /// offset: 0x08
    OAR1: mmio.Mmio(packed struct(u32) {
        /// Interface address
        ADD0: u1 = 0x0,
        /// Interface address
        ADD7: u7 = 0x0,
        /// Interface address
        ADD10: u2 = 0x0,
        reserved15: u5 = 0,
        /// Addressing mode (slave mode)
        ADDMODE: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Own address register 2
    /// offset: 0x0c
    OAR2: mmio.Mmio(packed struct(u32) {
        /// Dual addressing mode enable
        ENDUAL: u1 = 0x0,
        /// Interface address
        ADD2: u7 = 0x0,
        padding: u24 = 0,
    }),
    /// Data register
    /// offset: 0x10
    DR: mmio.Mmio(packed struct(u32) {
        /// 8-bit data register
        DR: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// Status register 1
    /// offset: 0x14
    SR1: mmio.Mmio(packed struct(u32) {
        /// Start bit (Master mode)
        SB: u1 = 0x0,
        /// Address sent (master mode)/matched (slave mode)
        ADDR: u1 = 0x0,
        /// Byte transfer finished
        BTF: u1 = 0x0,
        /// 10-bit header sent (Master mode)
        ADD10: u1 = 0x0,
        /// Stop detection (slave mode)
        STOPF: u1 = 0x0,
        reserved6: u1 = 0,
        /// Data register not empty (receivers)
        RxNE: u1 = 0x0,
        /// Data register empty (transmitters)
        TxE: u1 = 0x0,
        /// Bus error
        BERR: u1 = 0x0,
        /// Arbitration lost (master mode)
        ARLO: u1 = 0x0,
        /// Acknowledge failure
        AF: u1 = 0x0,
        /// Overrun/Underrun
        OVR: u1 = 0x0,
        /// PEC Error in reception
        PECERR: u1 = 0x0,
        reserved14: u1 = 0,
        /// Timeout or Tlow error
        TIMEOUT: u1 = 0x0,
        /// SMBus alert
        SMBALERT: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// Status register 2
    /// offset: 0x18
    SR2: mmio.Mmio(packed struct(u32) {
        /// Master/slave
        MSL: u1 = 0x0,
        /// Bus busy
        BUSY: u1 = 0x0,
        /// Transmitter/receiver
        TRA: u1 = 0x0,
        reserved4: u1 = 0,
        /// General call address (Slave mode)
        GENCALL: u1 = 0x0,
        /// SMBus device default address (Slave mode)
        SMBDEFAULT: u1 = 0x0,
        /// SMBus host header (Slave mode)
        SMBHOST: u1 = 0x0,
        /// Dual flag (Slave mode)
        DUALF: u1 = 0x0,
        /// acket error checking register
        PEC: u8 = 0x0,
        padding: u16 = 0,
    }),
    /// Clock control register
    /// offset: 0x1c
    CCR: mmio.Mmio(packed struct(u32) {
        /// Clock control register in Fast/Standard mode (Master mode)
        CCR: u12 = 0x0,
        reserved14: u2 = 0,
        /// Fast mode duty cycle
        DUTY: u1 = 0x0,
        /// I2C master mode selection
        F_S: u1 = 0x0,
        padding: u16 = 0,
    }),
    /// TRISE register
    /// offset: 0x20
    TRISE: mmio.Mmio(packed struct(u32) {
        /// Maximum rise time in Fast/Standard mode (Master mode)
        TRISE: u6 = 0x2,
        padding: u26 = 0,
    }),
    /// I2C FLTR register
    /// offset: 0x24
    FLTR: mmio.Mmio(packed struct(u32) {
        /// Digital noise filter
        DNF: u4 = 0x0,
        /// Analog noise filter OFF
        ANOFF: u1 = 0x0,
        padding: u27 = 0,
    }),
};
