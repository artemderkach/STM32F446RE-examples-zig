const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Serial audio interface
pub const SAI1 = extern struct {
    /// Global configuration register
    /// offset: 0x00
    GCR: mmio.Mmio(packed struct(u32) {
        /// Synchronization inputs
        SYNCIN: u2 = 0x0,
        reserved4: u2 = 0,
        /// Synchronization outputs
        SYNCOUT: u2 = 0x0,
        padding: u26 = 0,
    }),
    /// AConfiguration register 1
    /// offset: 0x04
    ACR1: mmio.Mmio(packed struct(u32) {
        /// Audio block mode
        MODE: u2 = 0x0,
        /// Protocol configuration
        PRTCFG: u2 = 0x0,
        reserved5: u1 = 0,
        /// Data size
        DS: u3 = 0x2,
        /// Least significant bit first
        LSBFIRST: u1 = 0x0,
        /// Clock strobing edge
        CKSTR: u1 = 0x0,
        /// Synchronization enable
        SYNCEN: u2 = 0x0,
        /// Mono mode
        MONO: u1 = 0x0,
        /// Output drive
        OutDri: u1 = 0x0,
        reserved16: u2 = 0,
        /// Audio block A enable
        SAIAEN: u1 = 0x0,
        /// DMA enable
        DMAEN: u1 = 0x0,
        reserved19: u1 = 0,
        /// No divider
        NODIV: u1 = 0x0,
        /// Master clock divider
        MCJDIV: u4 = 0x0,
        padding: u8 = 0,
    }),
    /// AConfiguration register 2
    /// offset: 0x08
    ACR2: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold
        FTH: u3 = 0x0,
        /// FIFO flush
        FFLUS: u1 = 0x0,
        /// Tristate management on data line
        TRIS: u1 = 0x0,
        /// Mute
        MUTE: u1 = 0x0,
        /// Mute value
        MUTEVAL: u1 = 0x0,
        /// Mute counter
        MUTECN: u6 = 0x0,
        /// Complement bit
        CPL: u1 = 0x0,
        /// Companding mode
        COMP: u2 = 0x0,
        padding: u16 = 0,
    }),
    /// AFRCR
    /// offset: 0x0c
    AFRCR: mmio.Mmio(packed struct(u32) {
        /// Frame length
        FRL: u8 = 0x7,
        /// Frame synchronization active level length
        FSALL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Frame synchronization definition
        FSDEF: u1 = 0x0,
        /// Frame synchronization polarity
        FSPOL: u1 = 0x0,
        /// Frame synchronization offset
        FSOFF: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// ASlot register
    /// offset: 0x10
    ASLOTR: mmio.Mmio(packed struct(u32) {
        /// First bit offset
        FBOFF: u5 = 0x0,
        reserved6: u1 = 0,
        /// Slot size
        SLOTSZ: u2 = 0x0,
        /// Number of slots in an audio frame
        NBSLOT: u4 = 0x0,
        reserved16: u4 = 0,
        /// Slot enable
        SLOTEN: u16 = 0x0,
    }),
    /// AInterrupt mask register2
    /// offset: 0x14
    AIM: mmio.Mmio(packed struct(u32) {
        /// Overrun/underrun interrupt enable
        OVRUDRIE: u1 = 0x0,
        /// Mute detection interrupt enable
        MUTEDET: u1 = 0x0,
        /// Wrong clock configuration interrupt enable
        WCKCFG: u1 = 0x0,
        /// FIFO request interrupt enable
        FREQIE: u1 = 0x0,
        /// Codec not ready interrupt enable
        CNRDYIE: u1 = 0x0,
        /// Anticipated frame synchronization detection interrupt enable
        AFSDETIE: u1 = 0x0,
        /// Late frame synchronization detection interrupt enable
        LFSDET: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// AStatus register
    /// offset: 0x18
    ASR: mmio.Mmio(packed struct(u32) {
        /// Overrun / underrun
        OVRUDR: u1 = 0x0,
        /// Mute detection
        MUTEDET: u1 = 0x0,
        /// Wrong clock configuration flag. This bit is read only.
        WCKCFG: u1 = 0x0,
        /// FIFO request
        FREQ: u1 = 0x0,
        /// Codec not ready
        CNRDY: u1 = 0x0,
        /// Anticipated frame synchronization detection
        AFSDET: u1 = 0x0,
        /// Late frame synchronization detection
        LFSDET: u1 = 0x0,
        reserved16: u9 = 0,
        /// FIFO level threshold
        FLVL: u3 = 0x0,
        padding: u13 = 0,
    }),
    /// AClear flag register
    /// offset: 0x1c
    ACLRFR: mmio.Mmio(packed struct(u32) {
        /// Clear overrun / underrun
        OVRUDR: u1 = 0x0,
        /// Mute detection flag
        MUTEDET: u1 = 0x0,
        /// Clear wrong clock configuration flag
        WCKCFG: u1 = 0x0,
        reserved4: u1 = 0,
        /// Clear codec not ready flag
        CNRDY: u1 = 0x0,
        /// Clear anticipated frame synchronization detection flag.
        CAFSDET: u1 = 0x0,
        /// Clear late frame synchronization detection flag
        LFSDET: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// AData register
    /// offset: 0x20
    ADR: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
    /// BConfiguration register 1
    /// offset: 0x24
    BCR1: mmio.Mmio(packed struct(u32) {
        /// Audio block mode
        MODE: u2 = 0x0,
        /// Protocol configuration
        PRTCFG: u2 = 0x0,
        reserved5: u1 = 0,
        /// Data size
        DS: u3 = 0x2,
        /// Least significant bit first
        LSBFIRST: u1 = 0x0,
        /// Clock strobing edge
        CKSTR: u1 = 0x0,
        /// Synchronization enable
        SYNCEN: u2 = 0x0,
        /// Mono mode
        MONO: u1 = 0x0,
        /// Output drive
        OutDri: u1 = 0x0,
        reserved16: u2 = 0,
        /// Audio block B enable
        SAIBEN: u1 = 0x0,
        /// DMA enable
        DMAEN: u1 = 0x0,
        reserved19: u1 = 0,
        /// No divider
        NODIV: u1 = 0x0,
        /// Master clock divider
        MCJDIV: u4 = 0x0,
        padding: u8 = 0,
    }),
    /// BConfiguration register 2
    /// offset: 0x28
    BCR2: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold
        FTH: u3 = 0x0,
        /// FIFO flush
        FFLUS: u1 = 0x0,
        /// Tristate management on data line
        TRIS: u1 = 0x0,
        /// Mute
        MUTE: u1 = 0x0,
        /// Mute value
        MUTEVAL: u1 = 0x0,
        /// Mute counter
        MUTECN: u6 = 0x0,
        /// Complement bit
        CPL: u1 = 0x0,
        /// Companding mode
        COMP: u2 = 0x0,
        padding: u16 = 0,
    }),
    /// BFRCR
    /// offset: 0x2c
    BFRCR: mmio.Mmio(packed struct(u32) {
        /// Frame length
        FRL: u8 = 0x7,
        /// Frame synchronization active level length
        FSALL: u7 = 0x0,
        reserved16: u1 = 0,
        /// Frame synchronization definition
        FSDEF: u1 = 0x0,
        /// Frame synchronization polarity
        FSPOL: u1 = 0x0,
        /// Frame synchronization offset
        FSOFF: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// BSlot register
    /// offset: 0x30
    BSLOTR: mmio.Mmio(packed struct(u32) {
        /// First bit offset
        FBOFF: u5 = 0x0,
        reserved6: u1 = 0,
        /// Slot size
        SLOTSZ: u2 = 0x0,
        /// Number of slots in an audio frame
        NBSLOT: u4 = 0x0,
        reserved16: u4 = 0,
        /// Slot enable
        SLOTEN: u16 = 0x0,
    }),
    /// BInterrupt mask register2
    /// offset: 0x34
    BIM: mmio.Mmio(packed struct(u32) {
        /// Overrun/underrun interrupt enable
        OVRUDRIE: u1 = 0x0,
        /// Mute detection interrupt enable
        MUTEDET: u1 = 0x0,
        /// Wrong clock configuration interrupt enable
        WCKCFG: u1 = 0x0,
        /// FIFO request interrupt enable
        FREQIE: u1 = 0x0,
        /// Codec not ready interrupt enable
        CNRDYIE: u1 = 0x0,
        /// Anticipated frame synchronization detection interrupt enable
        AFSDETIE: u1 = 0x0,
        /// Late frame synchronization detection interrupt enable
        LFSDETIE: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// BStatus register
    /// offset: 0x38
    BSR: mmio.Mmio(packed struct(u32) {
        /// Overrun / underrun
        OVRUDR: u1 = 0x0,
        /// Mute detection
        MUTEDET: u1 = 0x0,
        /// Wrong clock configuration flag
        WCKCFG: u1 = 0x0,
        /// FIFO request
        FREQ: u1 = 0x0,
        /// Codec not ready
        CNRDY: u1 = 0x0,
        /// Anticipated frame synchronization detection
        AFSDET: u1 = 0x0,
        /// Late frame synchronization detection
        LFSDET: u1 = 0x0,
        reserved16: u9 = 0,
        /// FIFO level threshold
        FLVL: u3 = 0x0,
        padding: u13 = 0,
    }),
    /// BClear flag register
    /// offset: 0x3c
    BCLRFR: mmio.Mmio(packed struct(u32) {
        /// Clear overrun / underrun
        OVRUDR: u1 = 0x0,
        /// Mute detection flag
        MUTEDET: u1 = 0x0,
        /// Clear wrong clock configuration flag
        WCKCFG: u1 = 0x0,
        reserved4: u1 = 0,
        /// Clear codec not ready flag
        CNRDY: u1 = 0x0,
        /// Clear anticipated frame synchronization detection flag
        CAFSDET: u1 = 0x0,
        /// Clear late frame synchronization detection flag
        LFSDET: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// BData register
    /// offset: 0x40
    BDR: mmio.Mmio(packed struct(u32) {
        /// Data
        DATA: u32 = 0x0,
    }),
};
