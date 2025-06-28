const mmio = @import("mmio");
const types = @import("../../types.zig");

/// External interrupt/event controller
pub const EXTI = extern struct {
    /// Interrupt mask register (EXTI_IMR)
    /// offset: 0x00
    IMR: mmio.Mmio(packed struct(u32) {
        /// Interrupt Mask on line 0
        MR0: u1,
        /// Interrupt Mask on line 1
        MR1: u1,
        /// Interrupt Mask on line 2
        MR2: u1,
        /// Interrupt Mask on line 3
        MR3: u1,
        /// Interrupt Mask on line 4
        MR4: u1,
        /// Interrupt Mask on line 5
        MR5: u1,
        /// Interrupt Mask on line 6
        MR6: u1,
        /// Interrupt Mask on line 7
        MR7: u1,
        /// Interrupt Mask on line 8
        MR8: u1,
        /// Interrupt Mask on line 9
        MR9: u1,
        /// Interrupt Mask on line 10
        MR10: u1,
        /// Interrupt Mask on line 11
        MR11: u1,
        /// Interrupt Mask on line 12
        MR12: u1,
        /// Interrupt Mask on line 13
        MR13: u1,
        /// Interrupt Mask on line 14
        MR14: u1,
        /// Interrupt Mask on line 15
        MR15: u1,
        /// Interrupt Mask on line 16
        MR16: u1,
        /// Interrupt Mask on line 17
        MR17: u1,
        /// Interrupt Mask on line 18
        MR18: u1,
        /// Interrupt Mask on line 19
        MR19: u1,
        /// Interrupt Mask on line 20
        MR20: u1,
        /// Interrupt Mask on line 21
        MR21: u1,
        /// Interrupt Mask on line 22
        MR22: u1,
        padding: u9 = 0,
    }),
    /// Event mask register (EXTI_EMR)
    /// offset: 0x04
    EMR: mmio.Mmio(packed struct(u32) {
        /// Event Mask on line 0
        MR0: u1,
        /// Event Mask on line 1
        MR1: u1,
        /// Event Mask on line 2
        MR2: u1,
        /// Event Mask on line 3
        MR3: u1,
        /// Event Mask on line 4
        MR4: u1,
        /// Event Mask on line 5
        MR5: u1,
        /// Event Mask on line 6
        MR6: u1,
        /// Event Mask on line 7
        MR7: u1,
        /// Event Mask on line 8
        MR8: u1,
        /// Event Mask on line 9
        MR9: u1,
        /// Event Mask on line 10
        MR10: u1,
        /// Event Mask on line 11
        MR11: u1,
        /// Event Mask on line 12
        MR12: u1,
        /// Event Mask on line 13
        MR13: u1,
        /// Event Mask on line 14
        MR14: u1,
        /// Event Mask on line 15
        MR15: u1,
        /// Event Mask on line 16
        MR16: u1,
        /// Event Mask on line 17
        MR17: u1,
        /// Event Mask on line 18
        MR18: u1,
        /// Event Mask on line 19
        MR19: u1,
        /// Event Mask on line 20
        MR20: u1,
        /// Event Mask on line 21
        MR21: u1,
        /// Event Mask on line 22
        MR22: u1,
        padding: u9 = 0,
    }),
    /// Rising Trigger selection register (EXTI_RTSR)
    /// offset: 0x08
    RTSR: mmio.Mmio(packed struct(u32) {
        /// Rising trigger event configuration of line 0
        TR0: u1,
        /// Rising trigger event configuration of line 1
        TR1: u1,
        /// Rising trigger event configuration of line 2
        TR2: u1,
        /// Rising trigger event configuration of line 3
        TR3: u1,
        /// Rising trigger event configuration of line 4
        TR4: u1,
        /// Rising trigger event configuration of line 5
        TR5: u1,
        /// Rising trigger event configuration of line 6
        TR6: u1,
        /// Rising trigger event configuration of line 7
        TR7: u1,
        /// Rising trigger event configuration of line 8
        TR8: u1,
        /// Rising trigger event configuration of line 9
        TR9: u1,
        /// Rising trigger event configuration of line 10
        TR10: u1,
        /// Rising trigger event configuration of line 11
        TR11: u1,
        /// Rising trigger event configuration of line 12
        TR12: u1,
        /// Rising trigger event configuration of line 13
        TR13: u1,
        /// Rising trigger event configuration of line 14
        TR14: u1,
        /// Rising trigger event configuration of line 15
        TR15: u1,
        /// Rising trigger event configuration of line 16
        TR16: u1,
        /// Rising trigger event configuration of line 17
        TR17: u1,
        /// Rising trigger event configuration of line 18
        TR18: u1,
        /// Rising trigger event configuration of line 19
        TR19: u1,
        /// Rising trigger event configuration of line 20
        TR20: u1,
        /// Rising trigger event configuration of line 21
        TR21: u1,
        /// Rising trigger event configuration of line 22
        TR22: u1,
        padding: u9 = 0,
    }),
    /// Falling Trigger selection register (EXTI_FTSR)
    /// offset: 0x0c
    FTSR: mmio.Mmio(packed struct(u32) {
        /// Falling trigger event configuration of line 0
        TR0: u1,
        /// Falling trigger event configuration of line 1
        TR1: u1,
        /// Falling trigger event configuration of line 2
        TR2: u1,
        /// Falling trigger event configuration of line 3
        TR3: u1,
        /// Falling trigger event configuration of line 4
        TR4: u1,
        /// Falling trigger event configuration of line 5
        TR5: u1,
        /// Falling trigger event configuration of line 6
        TR6: u1,
        /// Falling trigger event configuration of line 7
        TR7: u1,
        /// Falling trigger event configuration of line 8
        TR8: u1,
        /// Falling trigger event configuration of line 9
        TR9: u1,
        /// Falling trigger event configuration of line 10
        TR10: u1,
        /// Falling trigger event configuration of line 11
        TR11: u1,
        /// Falling trigger event configuration of line 12
        TR12: u1,
        /// Falling trigger event configuration of line 13
        TR13: u1,
        /// Falling trigger event configuration of line 14
        TR14: u1,
        /// Falling trigger event configuration of line 15
        TR15: u1,
        /// Falling trigger event configuration of line 16
        TR16: u1,
        /// Falling trigger event configuration of line 17
        TR17: u1,
        /// Falling trigger event configuration of line 18
        TR18: u1,
        /// Falling trigger event configuration of line 19
        TR19: u1,
        /// Falling trigger event configuration of line 20
        TR20: u1,
        /// Falling trigger event configuration of line 21
        TR21: u1,
        /// Falling trigger event configuration of line 22
        TR22: u1,
        padding: u9 = 0,
    }),
    /// Software interrupt event register (EXTI_SWIER)
    /// offset: 0x10
    SWIER: mmio.Mmio(packed struct(u32) {
        /// Software Interrupt on line 0
        SWIER0: u1,
        /// Software Interrupt on line 1
        SWIER1: u1,
        /// Software Interrupt on line 2
        SWIER2: u1,
        /// Software Interrupt on line 3
        SWIER3: u1,
        /// Software Interrupt on line 4
        SWIER4: u1,
        /// Software Interrupt on line 5
        SWIER5: u1,
        /// Software Interrupt on line 6
        SWIER6: u1,
        /// Software Interrupt on line 7
        SWIER7: u1,
        /// Software Interrupt on line 8
        SWIER8: u1,
        /// Software Interrupt on line 9
        SWIER9: u1,
        /// Software Interrupt on line 10
        SWIER10: u1,
        /// Software Interrupt on line 11
        SWIER11: u1,
        /// Software Interrupt on line 12
        SWIER12: u1,
        /// Software Interrupt on line 13
        SWIER13: u1,
        /// Software Interrupt on line 14
        SWIER14: u1,
        /// Software Interrupt on line 15
        SWIER15: u1,
        /// Software Interrupt on line 16
        SWIER16: u1,
        /// Software Interrupt on line 17
        SWIER17: u1,
        /// Software Interrupt on line 18
        SWIER18: u1,
        /// Software Interrupt on line 19
        SWIER19: u1,
        /// Software Interrupt on line 20
        SWIER20: u1,
        /// Software Interrupt on line 21
        SWIER21: u1,
        /// Software Interrupt on line 22
        SWIER22: u1,
        padding: u9 = 0,
    }),
    /// Pending register (EXTI_PR)
    /// offset: 0x14
    PR: mmio.Mmio(packed struct(u32) {
        /// Pending bit 0
        PR0: u1,
        /// Pending bit 1
        PR1: u1,
        /// Pending bit 2
        PR2: u1,
        /// Pending bit 3
        PR3: u1,
        /// Pending bit 4
        PR4: u1,
        /// Pending bit 5
        PR5: u1,
        /// Pending bit 6
        PR6: u1,
        /// Pending bit 7
        PR7: u1,
        /// Pending bit 8
        PR8: u1,
        /// Pending bit 9
        PR9: u1,
        /// Pending bit 10
        PR10: u1,
        /// Pending bit 11
        PR11: u1,
        /// Pending bit 12
        PR12: u1,
        /// Pending bit 13
        PR13: u1,
        /// Pending bit 14
        PR14: u1,
        /// Pending bit 15
        PR15: u1,
        /// Pending bit 16
        PR16: u1,
        /// Pending bit 17
        PR17: u1,
        /// Pending bit 18
        PR18: u1,
        /// Pending bit 19
        PR19: u1,
        /// Pending bit 20
        PR20: u1,
        /// Pending bit 21
        PR21: u1,
        /// Pending bit 22
        PR22: u1,
        padding: u9 = 0,
    }),
};
