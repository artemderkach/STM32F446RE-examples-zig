const mmio = @import("mmio");
const types = @import("../../types.zig");

/// System control block
pub const SCB = extern struct {
    /// CPUID base register
    /// offset: 0x00
    CPUID: mmio.Mmio(packed struct(u32) {
        /// Revision number
        Revision: u4,
        /// Part number of the processor
        PartNo: u12,
        /// Reads as 0xF
        Constant: u4,
        /// Variant number
        Variant: u4,
        /// Implementer code
        Implementer: u8,
    }),
    /// Interrupt control and state register
    /// offset: 0x04
    ICSR: mmio.Mmio(packed struct(u32) {
        /// Active vector
        VECTACTIVE: u9,
        reserved11: u2 = 0,
        /// Return to base level
        RETTOBASE: u1,
        /// Pending vector
        VECTPENDING: u7,
        reserved22: u3 = 0,
        /// Interrupt pending flag
        ISRPENDING: u1,
        reserved25: u2 = 0,
        /// SysTick exception clear-pending bit
        PENDSTCLR: u1,
        /// SysTick exception set-pending bit
        PENDSTSET: u1,
        /// PendSV clear-pending bit
        PENDSVCLR: u1,
        /// PendSV set-pending bit
        PENDSVSET: u1,
        reserved31: u2 = 0,
        /// NMI set-pending bit.
        NMIPENDSET: u1,
    }),
    /// Vector table offset register
    /// offset: 0x08
    VTOR: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// Vector table base offset field
        TBLOFF: u21,
        padding: u2 = 0,
    }),
    /// Application interrupt and reset control register
    /// offset: 0x0c
    AIRCR: mmio.Mmio(packed struct(u32) {
        /// VECTRESET
        VECTRESET: u1,
        /// VECTCLRACTIVE
        VECTCLRACTIVE: u1,
        /// SYSRESETREQ
        SYSRESETREQ: u1,
        reserved8: u5 = 0,
        /// PRIGROUP
        PRIGROUP: u3,
        reserved15: u4 = 0,
        /// ENDIANESS
        ENDIANESS: u1,
        /// Register key
        VECTKEYSTAT: u16,
    }),
    /// System control register
    /// offset: 0x10
    SCR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// SLEEPONEXIT
        SLEEPONEXIT: u1,
        /// SLEEPDEEP
        SLEEPDEEP: u1,
        reserved4: u1 = 0,
        /// Send Event on Pending bit
        SEVEONPEND: u1,
        padding: u27 = 0,
    }),
    /// Configuration and control register
    /// offset: 0x14
    CCR: mmio.Mmio(packed struct(u32) {
        /// Configures how the processor enters Thread mode
        NONBASETHRDENA: u1,
        /// USERSETMPEND
        USERSETMPEND: u1,
        reserved3: u1 = 0,
        /// UNALIGN_ TRP
        UNALIGN__TRP: u1,
        /// DIV_0_TRP
        DIV_0_TRP: u1,
        reserved8: u3 = 0,
        /// BFHFNMIGN
        BFHFNMIGN: u1,
        /// STKALIGN
        STKALIGN: u1,
        padding: u22 = 0,
    }),
    /// System handler priority registers
    /// offset: 0x18
    SHPR1: mmio.Mmio(packed struct(u32) {
        /// Priority of system handler 4
        PRI_4: u8,
        /// Priority of system handler 5
        PRI_5: u8,
        /// Priority of system handler 6
        PRI_6: u8,
        padding: u8 = 0,
    }),
    /// System handler priority registers
    /// offset: 0x1c
    SHPR2: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// Priority of system handler 11
        PRI_11: u8,
    }),
    /// System handler priority registers
    /// offset: 0x20
    SHPR3: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Priority of system handler 14
        PRI_14: u8,
        /// Priority of system handler 15
        PRI_15: u8,
    }),
    /// System handler control and state register
    /// offset: 0x24
    SHCRS: mmio.Mmio(packed struct(u32) {
        /// Memory management fault exception active bit
        MEMFAULTACT: u1,
        /// Bus fault exception active bit
        BUSFAULTACT: u1,
        reserved3: u1 = 0,
        /// Usage fault exception active bit
        USGFAULTACT: u1,
        reserved7: u3 = 0,
        /// SVC call active bit
        SVCALLACT: u1,
        /// Debug monitor active bit
        MONITORACT: u1,
        reserved10: u1 = 0,
        /// PendSV exception active bit
        PENDSVACT: u1,
        /// SysTick exception active bit
        SYSTICKACT: u1,
        /// Usage fault exception pending bit
        USGFAULTPENDED: u1,
        /// Memory management fault exception pending bit
        MEMFAULTPENDED: u1,
        /// Bus fault exception pending bit
        BUSFAULTPENDED: u1,
        /// SVC call pending bit
        SVCALLPENDED: u1,
        /// Memory management fault enable bit
        MEMFAULTENA: u1,
        /// Bus fault enable bit
        BUSFAULTENA: u1,
        /// Usage fault enable bit
        USGFAULTENA: u1,
        padding: u13 = 0,
    }),
    /// Configurable fault status register
    /// offset: 0x28
    CFSR_UFSR_BFSR_MMFSR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Instruction access violation flag
        IACCVIOL: u1,
        reserved3: u1 = 0,
        /// Memory manager fault on unstacking for a return from exception
        MUNSTKERR: u1,
        /// Memory manager fault on stacking for exception entry.
        MSTKERR: u1,
        /// MLSPERR
        MLSPERR: u1,
        reserved7: u1 = 0,
        /// Memory Management Fault Address Register (MMAR) valid flag
        MMARVALID: u1,
        /// Instruction bus error
        IBUSERR: u1,
        /// Precise data bus error
        PRECISERR: u1,
        /// Imprecise data bus error
        IMPRECISERR: u1,
        /// Bus fault on unstacking for a return from exception
        UNSTKERR: u1,
        /// Bus fault on stacking for exception entry
        STKERR: u1,
        /// Bus fault on floating-point lazy state preservation
        LSPERR: u1,
        reserved15: u1 = 0,
        /// Bus Fault Address Register (BFAR) valid flag
        BFARVALID: u1,
        /// Undefined instruction usage fault
        UNDEFINSTR: u1,
        /// Invalid state usage fault
        INVSTATE: u1,
        /// Invalid PC load usage fault
        INVPC: u1,
        /// No coprocessor usage fault.
        NOCP: u1,
        reserved24: u4 = 0,
        /// Unaligned access usage fault
        UNALIGNED: u1,
        /// Divide by zero usage fault
        DIVBYZERO: u1,
        padding: u6 = 0,
    }),
    /// Hard fault status register
    /// offset: 0x2c
    HFSR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Vector table hard fault
        VECTTBL: u1,
        reserved30: u28 = 0,
        /// Forced hard fault
        FORCED: u1,
        /// Reserved for Debug use
        DEBUG_VT: u1,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// Memory management fault address register
    /// offset: 0x34
    MMFAR: mmio.Mmio(packed struct(u32) {
        /// Memory management fault address
        MMFAR: u32,
    }),
    /// Bus fault address register
    /// offset: 0x38
    BFAR: mmio.Mmio(packed struct(u32) {
        /// Bus fault address
        BFAR: u32,
    }),
    /// Auxiliary fault status register
    /// offset: 0x3c
    AFSR: mmio.Mmio(packed struct(u32) {
        /// Implementation defined
        IMPDEF: u32,
    }),
};
