const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// DMA controller
pub const DMA2 = extern struct {
    /// low interrupt status register
    /// offset: 0x00
    LISR: mmio.Mmio(packed struct(u32) {
        /// Stream x FIFO error interrupt flag (x=3..0)
        FEIF0: u1 = 0x0,
        reserved2: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=3..0)
        DMEIF0: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=3..0)
        TEIF0: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=3..0)
        HTIF0: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x = 3..0)
        TCIF0: u1 = 0x0,
        /// Stream x FIFO error interrupt flag (x=3..0)
        FEIF1: u1 = 0x0,
        reserved8: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=3..0)
        DMEIF1: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=3..0)
        TEIF1: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=3..0)
        HTIF1: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x = 3..0)
        TCIF1: u1 = 0x0,
        reserved16: u4 = 0,
        /// Stream x FIFO error interrupt flag (x=3..0)
        FEIF2: u1 = 0x0,
        reserved18: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=3..0)
        DMEIF2: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=3..0)
        TEIF2: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=3..0)
        HTIF2: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x = 3..0)
        TCIF2: u1 = 0x0,
        /// Stream x FIFO error interrupt flag (x=3..0)
        FEIF3: u1 = 0x0,
        reserved24: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=3..0)
        DMEIF3: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=3..0)
        TEIF3: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=3..0)
        HTIF3: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x = 3..0)
        TCIF3: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// high interrupt status register
    /// offset: 0x04
    HISR: mmio.Mmio(packed struct(u32) {
        /// Stream x FIFO error interrupt flag (x=7..4)
        FEIF4: u1 = 0x0,
        reserved2: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=7..4)
        DMEIF4: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=7..4)
        TEIF4: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=7..4)
        HTIF4: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x=7..4)
        TCIF4: u1 = 0x0,
        /// Stream x FIFO error interrupt flag (x=7..4)
        FEIF5: u1 = 0x0,
        reserved8: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=7..4)
        DMEIF5: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=7..4)
        TEIF5: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=7..4)
        HTIF5: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x=7..4)
        TCIF5: u1 = 0x0,
        reserved16: u4 = 0,
        /// Stream x FIFO error interrupt flag (x=7..4)
        FEIF6: u1 = 0x0,
        reserved18: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=7..4)
        DMEIF6: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=7..4)
        TEIF6: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=7..4)
        HTIF6: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x=7..4)
        TCIF6: u1 = 0x0,
        /// Stream x FIFO error interrupt flag (x=7..4)
        FEIF7: u1 = 0x0,
        reserved24: u1 = 0,
        /// Stream x direct mode error interrupt flag (x=7..4)
        DMEIF7: u1 = 0x0,
        /// Stream x transfer error interrupt flag (x=7..4)
        TEIF7: u1 = 0x0,
        /// Stream x half transfer interrupt flag (x=7..4)
        HTIF7: u1 = 0x0,
        /// Stream x transfer complete interrupt flag (x=7..4)
        TCIF7: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// low interrupt flag clear register
    /// offset: 0x08
    LIFCR: mmio.Mmio(packed struct(u32) {
        /// Stream x clear FIFO error interrupt flag (x = 3..0)
        CFEIF0: u1 = 0x0,
        reserved2: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 3..0)
        CDMEIF0: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 3..0)
        CTEIF0: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 3..0)
        CHTIF0: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 3..0)
        CTCIF0: u1 = 0x0,
        /// Stream x clear FIFO error interrupt flag (x = 3..0)
        CFEIF1: u1 = 0x0,
        reserved8: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 3..0)
        CDMEIF1: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 3..0)
        CTEIF1: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 3..0)
        CHTIF1: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 3..0)
        CTCIF1: u1 = 0x0,
        reserved16: u4 = 0,
        /// Stream x clear FIFO error interrupt flag (x = 3..0)
        CFEIF2: u1 = 0x0,
        reserved18: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 3..0)
        CDMEIF2: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 3..0)
        CTEIF2: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 3..0)
        CHTIF2: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 3..0)
        CTCIF2: u1 = 0x0,
        /// Stream x clear FIFO error interrupt flag (x = 3..0)
        CFEIF3: u1 = 0x0,
        reserved24: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 3..0)
        CDMEIF3: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 3..0)
        CTEIF3: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 3..0)
        CHTIF3: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 3..0)
        CTCIF3: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// high interrupt flag clear register
    /// offset: 0x0c
    HIFCR: mmio.Mmio(packed struct(u32) {
        /// Stream x clear FIFO error interrupt flag (x = 7..4)
        CFEIF4: u1 = 0x0,
        reserved2: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 7..4)
        CDMEIF4: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 7..4)
        CTEIF4: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 7..4)
        CHTIF4: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 7..4)
        CTCIF4: u1 = 0x0,
        /// Stream x clear FIFO error interrupt flag (x = 7..4)
        CFEIF5: u1 = 0x0,
        reserved8: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 7..4)
        CDMEIF5: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 7..4)
        CTEIF5: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 7..4)
        CHTIF5: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 7..4)
        CTCIF5: u1 = 0x0,
        reserved16: u4 = 0,
        /// Stream x clear FIFO error interrupt flag (x = 7..4)
        CFEIF6: u1 = 0x0,
        reserved18: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 7..4)
        CDMEIF6: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 7..4)
        CTEIF6: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 7..4)
        CHTIF6: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 7..4)
        CTCIF6: u1 = 0x0,
        /// Stream x clear FIFO error interrupt flag (x = 7..4)
        CFEIF7: u1 = 0x0,
        reserved24: u1 = 0,
        /// Stream x clear direct mode error interrupt flag (x = 7..4)
        CDMEIF7: u1 = 0x0,
        /// Stream x clear transfer error interrupt flag (x = 7..4)
        CTEIF7: u1 = 0x0,
        /// Stream x clear half transfer interrupt flag (x = 7..4)
        CHTIF7: u1 = 0x0,
        /// Stream x clear transfer complete interrupt flag (x = 7..4)
        CTCIF7: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x10
    S0CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        reserved21: u1 = 0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x14
    S0NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x18
    S0PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x1c
    S0M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x20
    S0M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x24
    S0FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x28
    S1CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x2c
    S1NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x30
    S1PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x34
    S1M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x38
    S1M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x3c
    S1FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x40
    S2CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x44
    S2NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x48
    S2PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x4c
    S2M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x50
    S2M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x54
    S2FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x58
    S3CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x5c
    S3NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x60
    S3PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x64
    S3M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x68
    S3M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x6c
    S3FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x70
    S4CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x74
    S4NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x78
    S4PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x7c
    S4M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x80
    S4M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x84
    S4FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0x88
    S5CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0x8c
    S5NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0x90
    S5PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0x94
    S5M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0x98
    S5M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0x9c
    S5FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0xa0
    S6CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0xa4
    S6NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0xa8
    S6PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0xac
    S6M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0xb0
    S6M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0xb4
    S6FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// stream x configuration register
    /// offset: 0xb8
    S7CR: mmio.Mmio(packed struct(u32) {
        /// Stream enable / flag stream ready when read low
        EN: u1 = 0x0,
        /// Direct mode error interrupt enable
        DMEIE: u1 = 0x0,
        /// Transfer error interrupt enable
        TEIE: u1 = 0x0,
        /// Half transfer interrupt enable
        HTIE: u1 = 0x0,
        /// Transfer complete interrupt enable
        TCIE: u1 = 0x0,
        /// Peripheral flow controller
        PFCTRL: u1 = 0x0,
        /// Data transfer direction
        DIR: u2 = 0x0,
        /// Circular mode
        CIRC: u1 = 0x0,
        /// Peripheral increment mode
        PINC: u1 = 0x0,
        /// Memory increment mode
        MINC: u1 = 0x0,
        /// Peripheral data size
        PSIZE: u2 = 0x0,
        /// Memory data size
        MSIZE: u2 = 0x0,
        /// Peripheral increment offset size
        PINCOS: u1 = 0x0,
        /// Priority level
        PL: u2 = 0x0,
        /// Double buffer mode
        DBM: u1 = 0x0,
        /// Current target (only in double buffer mode)
        CT: u1 = 0x0,
        /// ACK
        ACK: u1 = 0x0,
        /// Peripheral burst transfer configuration
        PBURST: u2 = 0x0,
        /// Memory burst transfer configuration
        MBURST: u2 = 0x0,
        /// Channel selection
        CHSEL: u3 = 0x0,
        padding: u4 = 0,
    }),
    /// stream x number of data register
    /// offset: 0xbc
    S7NDTR: mmio.Mmio(packed struct(u32) {
        /// Number of data items to transfer
        NDT: u16 = 0x0,
        padding: u16 = 0,
    }),
    /// stream x peripheral address register
    /// offset: 0xc0
    S7PAR: mmio.Mmio(packed struct(u32) {
        /// Peripheral address
        PA: u32 = 0x0,
    }),
    /// stream x memory 0 address register
    /// offset: 0xc4
    S7M0AR: mmio.Mmio(packed struct(u32) {
        /// Memory 0 address
        M0A: u32 = 0x0,
    }),
    /// stream x memory 1 address register
    /// offset: 0xc8
    S7M1AR: mmio.Mmio(packed struct(u32) {
        /// Memory 1 address (used in case of Double buffer mode)
        M1A: u32 = 0x0,
    }),
    /// stream x FIFO control register
    /// offset: 0xcc
    S7FCR: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold selection
        FTH: u2 = 0x1,
        /// Direct mode disable
        DMDIS: u1 = 0x0,
        /// FIFO status
        FS: u3 = 0x4,
        reserved7: u1 = 0,
        /// FIFO error interrupt enable
        FEIE: u1 = 0x0,
        padding: u24 = 0,
    }),
};
