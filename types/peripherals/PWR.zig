const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Power control
pub const PWR = extern struct {
    /// power control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// Low-power deep sleep
        LPDS: u1,
        /// Power down deepsleep
        PDDS: u1,
        /// Clear wakeup flag
        CWUF: u1,
        /// Clear standby flag
        CSBF: u1,
        /// Power voltage detector enable
        PVDE: u1,
        /// PVD level selection
        PLS: u3,
        /// Disable backup domain write protection
        DBP: u1,
        /// Flash power down in Stop mode
        FPDS: u1,
        /// Low-Power Regulator Low Voltage in deepsleep
        LPLVDS: u1,
        /// Main regulator low voltage in deepsleep mode
        MRLVDS: u1,
        reserved13: u1 = 0,
        /// ADCDC1
        ADCDC1: u1,
        /// Regulator voltage scaling output selection
        VOS: u2,
        /// Over-drive enable
        ODEN: u1,
        /// Over-drive switching enabled
        ODSWEN: u1,
        /// Under-drive enable in stop mode
        UDEN: u2,
        /// Flash Memory Stop while System Run
        FMSSR: u1,
        /// Flash Interface Stop while System Run
        FISSR: u1,
        padding: u10 = 0,
    }),
    /// power control/status register
    /// offset: 0x04
    CSR: mmio.Mmio(packed struct(u32) {
        /// Wakeup flag
        WUF: u1,
        /// Standby flag
        SBF: u1,
        /// PVD output
        PVDO: u1,
        /// Backup regulator ready
        BRR: u1,
        reserved7: u3 = 0,
        /// Enable WKUP2 pin
        EWUP2: u1,
        /// Enable WKUP pin
        EWUP: u1,
        /// Backup regulator enable
        BRE: u1,
        reserved14: u4 = 0,
        /// Regulator voltage scaling output selection ready bit
        VOSRDY: u1,
        reserved16: u1 = 0,
        /// Over-drive mode ready
        ODRDY: u1,
        /// Over-drive mode switching ready
        ODSWRDY: u1,
        /// Under-drive ready flag
        UDRDY: u2,
        padding: u12 = 0,
    }),
};
