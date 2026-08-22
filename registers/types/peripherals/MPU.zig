const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Memory protection unit
pub const MPU = extern struct {
    /// MPU type register
    /// offset: 0x00
    MPU_TYPER: mmio.Mmio(packed struct(u32) {
        /// Separate flag
        SEPARATE: u1 = 0x0,
        reserved8: u7 = 0,
        /// Number of MPU data regions
        DREGION: u8 = 0x8,
        /// Number of MPU instruction regions
        IREGION: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// MPU control register
    /// offset: 0x04
    MPU_CTRL: mmio.Mmio(packed struct(u32) {
        /// Enables the MPU
        ENABLE: u1 = 0x0,
        /// Enables the operation of MPU during hard fault
        HFNMIENA: u1 = 0x0,
        /// Enable priviliged software access to default memory map
        PRIVDEFENA: u1 = 0x0,
        padding: u29 = 0,
    }),
    /// MPU region number register
    /// offset: 0x08
    MPU_RNR: mmio.Mmio(packed struct(u32) {
        /// MPU region
        REGION: u8 = 0x0,
        padding: u24 = 0,
    }),
    /// MPU region base address register
    /// offset: 0x0c
    MPU_RBAR: mmio.Mmio(packed struct(u32) {
        /// MPU region field
        REGION: u4 = 0x0,
        /// MPU region number valid
        VALID: u1 = 0x0,
        /// Region base address field
        ADDR: u27 = 0x0,
    }),
    /// MPU region attribute and size register
    /// offset: 0x10
    MPU_RASR: mmio.Mmio(packed struct(u32) {
        /// Region enable bit.
        ENABLE: u1 = 0x0,
        /// Size of the MPU protection region
        SIZE: u5 = 0x0,
        reserved8: u2 = 0,
        /// Subregion disable bits
        SRD: u8 = 0x0,
        /// memory attribute
        B: u1 = 0x0,
        /// memory attribute
        C: u1 = 0x0,
        /// Shareable memory attribute
        S: u1 = 0x0,
        /// memory attribute
        TEX: u3 = 0x0,
        reserved24: u2 = 0,
        /// Access permission
        AP: u3 = 0x0,
        reserved28: u1 = 0,
        /// Instruction access disable bit
        XN: u1 = 0x0,
        padding: u3 = 0,
    }),
};
