const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// System control block
pub const SCB = extern struct {
    /// CPUID base register
    /// offset: 0x00
    CPUID: mmio.Mmio(packed struct(u32) {
        /// Revision number
        Revision: u4 = 0x1,
        /// Part number of the processor
        PartNo: u12 = 0xC24,
        /// Reads as 0xF
        Constant: u4 = 0xF,
        /// Variant number
        Variant: u4 = 0x0,
        /// Implementer code
        Implementer: u8 = 0x41,
    }),
    /// Interrupt control and state register
    /// offset: 0x04
    ICSR: mmio.Mmio(packed struct(u32) {
        /// Active vector
        VECTACTIVE: u9 = 0x0,
        reserved11: u2 = 0,
        /// Return to base level
        RETTOBASE: u1 = 0x0,
        /// Pending vector
        VECTPENDING: u7 = 0x0,
        reserved22: u3 = 0,
        /// Interrupt pending flag
        ISRPENDING: u1 = 0x0,
        reserved25: u2 = 0,
        /// SysTick exception clear-pending bit
        PENDSTCLR: u1 = 0x0,
        /// SysTick exception set-pending bit
        PENDSTSET: u1 = 0x0,
        /// PendSV clear-pending bit
        PENDSVCLR: u1 = 0x0,
        /// PendSV set-pending bit
        PENDSVSET: u1 = 0x0,
        reserved31: u2 = 0,
        /// NMI set-pending bit.
        NMIPENDSET: u1 = 0x0,
    }),
    /// Vector table offset register
    /// offset: 0x08
    VTOR: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// Vector table base offset field
        TBLOFF: u21 = 0x0,
        padding: u2 = 0,
    }),
    /// Application interrupt and reset control register
    /// offset: 0x0c
    AIRCR: mmio.Mmio(packed struct(u32) {
        /// VECTRESET
        VECTRESET: u1 = 0x0,
        /// VECTCLRACTIVE
        VECTCLRACTIVE: u1 = 0x0,
        /// SYSRESETREQ
        SYSRESETREQ: u1 = 0x0,
        reserved8: u5 = 0,
        /// PRIGROUP
        PRIGROUP: u3 = 0x0,
        reserved15: u4 = 0,
        /// ENDIANESS
        ENDIANESS: u1 = 0x0,
        /// Register key
        VECTKEYSTAT: u16 = 0x0,
    }),
    /// System control register
    /// offset: 0x10
    SCR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// SLEEPONEXIT
        SLEEPONEXIT: u1 = 0x0,
        /// SLEEPDEEP
        SLEEPDEEP: u1 = 0x0,
        reserved4: u1 = 0,
        /// Send Event on Pending bit
        SEVEONPEND: u1 = 0x0,
        padding: u27 = 0,
    }),
    /// Configuration and control register
    /// offset: 0x14
    CCR: mmio.Mmio(packed struct(u32) {
        /// Configures how the processor enters Thread mode
        NONBASETHRDENA: u1 = 0x0,
        /// USERSETMPEND
        USERSETMPEND: u1 = 0x0,
        reserved3: u1 = 0,
        /// UNALIGN_ TRP
        UNALIGN__TRP: u1 = 0x0,
        /// DIV_0_TRP
        DIV_0_TRP: u1 = 0x0,
        reserved8: u3 = 0,
        /// BFHFNMIGN
        BFHFNMIGN: u1 = 0x0,
        /// STKALIGN
        STKALIGN: u1 = 0x0,
        padding: u22 = 0,
    }),
    /// System handler priority registers
    /// offset: 0x18
    SHPR1: mmio.Mmio(packed struct(u32) {
        /// Priority of system handler 4
        PRI_4: u8 = 0x0,
        /// Priority of system handler 5
        PRI_5: u8 = 0x0,
        /// Priority of system handler 6
        PRI_6: u8 = 0x0,
        padding: u8 = 0,
    }),
    /// System handler priority registers
    /// offset: 0x1c
    SHPR2: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// Priority of system handler 11
        PRI_11: u8 = 0x0,
    }),
    /// System handler priority registers
    /// offset: 0x20
    SHPR3: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Priority of system handler 14
        PRI_14: u8 = 0x0,
        /// Priority of system handler 15
        PRI_15: u8 = 0x0,
    }),
    /// System handler control and state register
    /// offset: 0x24
    SHCRS: mmio.Mmio(packed struct(u32) {
        /// Memory management fault exception active bit
        MEMFAULTACT: u1 = 0x0,
        /// Bus fault exception active bit
        BUSFAULTACT: u1 = 0x0,
        reserved3: u1 = 0,
        /// Usage fault exception active bit
        USGFAULTACT: u1 = 0x0,
        reserved7: u3 = 0,
        /// SVC call active bit
        SVCALLACT: u1 = 0x0,
        /// Debug monitor active bit
        MONITORACT: u1 = 0x0,
        reserved10: u1 = 0,
        /// PendSV exception active bit
        PENDSVACT: u1 = 0x0,
        /// SysTick exception active bit
        SYSTICKACT: u1 = 0x0,
        /// Usage fault exception pending bit
        USGFAULTPENDED: u1 = 0x0,
        /// Memory management fault exception pending bit
        MEMFAULTPENDED: u1 = 0x0,
        /// Bus fault exception pending bit
        BUSFAULTPENDED: u1 = 0x0,
        /// SVC call pending bit
        SVCALLPENDED: u1 = 0x0,
        /// Memory management fault enable bit
        MEMFAULTENA: u1 = 0x0,
        /// Bus fault enable bit
        BUSFAULTENA: u1 = 0x0,
        /// Usage fault enable bit
        USGFAULTENA: u1 = 0x0,
        padding: u13 = 0,
    }),
    /// Configurable fault status register
    /// offset: 0x28
    CFSR_UFSR_BFSR_MMFSR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Instruction access violation flag
        IACCVIOL: u1 = 0x0,
        reserved3: u1 = 0,
        /// Memory manager fault on unstacking for a return from exception
        MUNSTKERR: u1 = 0x0,
        /// Memory manager fault on stacking for exception entry.
        MSTKERR: u1 = 0x0,
        /// MLSPERR
        MLSPERR: u1 = 0x0,
        reserved7: u1 = 0,
        /// Memory Management Fault Address Register (MMAR) valid flag
        MMARVALID: u1 = 0x0,
        /// Instruction bus error
        IBUSERR: u1 = 0x0,
        /// Precise data bus error
        PRECISERR: u1 = 0x0,
        /// Imprecise data bus error
        IMPRECISERR: u1 = 0x0,
        /// Bus fault on unstacking for a return from exception
        UNSTKERR: u1 = 0x0,
        /// Bus fault on stacking for exception entry
        STKERR: u1 = 0x0,
        /// Bus fault on floating-point lazy state preservation
        LSPERR: u1 = 0x0,
        reserved15: u1 = 0,
        /// Bus Fault Address Register (BFAR) valid flag
        BFARVALID: u1 = 0x0,
        /// Undefined instruction usage fault
        UNDEFINSTR: u1 = 0x0,
        /// Invalid state usage fault
        INVSTATE: u1 = 0x0,
        /// Invalid PC load usage fault
        INVPC: u1 = 0x0,
        /// No coprocessor usage fault.
        NOCP: u1 = 0x0,
        reserved24: u4 = 0,
        /// Unaligned access usage fault
        UNALIGNED: u1 = 0x0,
        /// Divide by zero usage fault
        DIVBYZERO: u1 = 0x0,
        padding: u6 = 0,
    }),
    /// Hard fault status register
    /// offset: 0x2c
    HFSR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Vector table hard fault
        VECTTBL: u1 = 0x0,
        reserved30: u28 = 0,
        /// Forced hard fault
        FORCED: u1 = 0x0,
        /// Reserved for Debug use
        DEBUG_VT: u1 = 0x0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// Memory management fault address register
    /// offset: 0x34
    MMFAR: mmio.Mmio(packed struct(u32) {
        /// Memory management fault address
        MMFAR: u32 = 0x0,
    }),
    /// Bus fault address register
    /// offset: 0x38
    BFAR: mmio.Mmio(packed struct(u32) {
        /// Bus fault address
        BFAR: u32 = 0x0,
    }),
    /// Auxiliary fault status register
    /// offset: 0x3c
    AFSR: mmio.Mmio(packed struct(u32) {
        /// Implementation defined
        IMPDEF: u32 = 0x0,
    }),
};
