const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Debug support
pub const DBG = extern struct {
    /// IDCODE
    /// offset: 0x00
    DBGMCU_IDCODE: mmio.Mmio(packed struct(u32) {
        /// DEV_ID
        DEV_ID: u12 = 0x411,
        reserved16: u4 = 0,
        /// REV_ID
        REV_ID: u16 = 0x1000,
    }),
    /// Control Register
    /// offset: 0x04
    DBGMCU_CR: mmio.Mmio(packed struct(u32) {
        /// DBG_SLEEP
        DBG_SLEEP: u1 = 0x0,
        /// DBG_STOP
        DBG_STOP: u1 = 0x0,
        /// DBG_STANDBY
        DBG_STANDBY: u1 = 0x0,
        reserved5: u2 = 0,
        /// TRACE_IOEN
        TRACE_IOEN: u1 = 0x0,
        /// TRACE_MODE
        TRACE_MODE: u2 = 0x0,
        padding: u24 = 0,
    }),
    /// Debug MCU APB1 Freeze registe
    /// offset: 0x08
    DBGMCU_APB1_FZ: mmio.Mmio(packed struct(u32) {
        /// DBG_TIM2_STOP
        DBG_TIM2_STOP: u1 = 0x0,
        /// DBG_TIM3 _STOP
        DBG_TIM3_STOP: u1 = 0x0,
        /// DBG_TIM4_STOP
        DBG_TIM4_STOP: u1 = 0x0,
        /// DBG_TIM5_STOP
        DBG_TIM5_STOP: u1 = 0x0,
        /// DBG_TIM6_STOP
        DBG_TIM6_STOP: u1 = 0x0,
        /// DBG_TIM7_STOP
        DBG_TIM7_STOP: u1 = 0x0,
        /// DBG_TIM12_STOP
        DBG_TIM12_STOP: u1 = 0x0,
        /// DBG_TIM13_STOP
        DBG_TIM13_STOP: u1 = 0x0,
        /// DBG_TIM14_STOP
        DBG_TIM14_STOP: u1 = 0x0,
        reserved10: u1 = 0,
        /// RTC stopped when Core is halted
        DBG_RTC_STOP: u1 = 0x0,
        /// DBG_WWDG_STOP
        DBG_WWDG_STOP: u1 = 0x0,
        /// DBG_IWDEG_STOP
        DBG_IWDEG_STOP: u1 = 0x0,
        reserved21: u8 = 0,
        /// DBG_J2C1_SMBUS_TIMEOUT
        DBG_J2C1_SMBUS_TIMEOUT: u1 = 0x0,
        /// DBG_J2C2_SMBUS_TIMEOUT
        DBG_J2C2_SMBUS_TIMEOUT: u1 = 0x0,
        /// DBG_J2C3SMBUS_TIMEOUT
        DBG_J2C3SMBUS_TIMEOUT: u1 = 0x0,
        /// SMBUS timeout mode stopped when Core is halted
        DBG_I2CFMP_SMBUS_TIMEOUT: u1 = 0x0,
        /// DBG_CAN1_STOP
        DBG_CAN1_STOP: u1 = 0x0,
        /// DBG_CAN2_STOP
        DBG_CAN2_STOP: u1 = 0x0,
        padding: u5 = 0,
    }),
    /// Debug MCU APB2 Freeze registe
    /// offset: 0x0c
    DBGMCU_APB2_FZ: mmio.Mmio(packed struct(u32) {
        /// TIM1 counter stopped when core is halted
        DBG_TIM1_STOP: u1 = 0x0,
        /// TIM8 counter stopped when core is halted
        DBG_TIM8_STOP: u1 = 0x0,
        reserved16: u14 = 0,
        /// TIM9 counter stopped when core is halted
        DBG_TIM9_STOP: u1 = 0x0,
        /// TIM10 counter stopped when core is halted
        DBG_TIM10_STOP: u1 = 0x0,
        /// TIM11 counter stopped when core is halted
        DBG_TIM11_STOP: u1 = 0x0,
        padding: u13 = 0,
    }),
};
