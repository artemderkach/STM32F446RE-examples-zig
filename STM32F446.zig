//! STM32F446
const mmio = @import("mmio");
pub const types = @import("types.zig");

pub const Interrupt = struct {
    name: [:0]const u8,
    index: i16,
    description: ?[:0]const u8,
};

pub const Handler = extern union {
    C: *const fn () callconv(.C) void,
    Naked: *const fn () callconv(.Naked) void,
    // Interrupt is not supported on arm
};

pub const unhandled = Handler{
    .C = struct {
        fn tmp() callconv(.C) noreturn {
            @panic("unhandled interrupt");
        }
    }.tmp,
};

pub const properties = struct {
    pub const @"cpu.endian" = "little";
    pub const @"cpu.fpuPresent" = "false";
    pub const @"cpu.mpuPresent" = "false";
    pub const @"cpu.name" = "CM4";
    pub const @"cpu.nvicPrioBits" = "3";
    pub const @"cpu.revision" = "r1p0";
    pub const @"cpu.vendorSystickConfig" = "false";
};

pub const interrupts: []const Interrupt = &.{
    .{ .name = "NMI", .index = -14, .description = null },
    .{ .name = "HardFault", .index = -13, .description = null },
    .{ .name = "MemManageFault", .index = -12, .description = null },
    .{ .name = "BusFault", .index = -11, .description = null },
    .{ .name = "UsageFault", .index = -10, .description = null },
    .{ .name = "SVCall", .index = -5, .description = null },
    .{ .name = "PendSV", .index = -2, .description = null },
    .{ .name = "SysTick", .index = -1, .description = null },
    .{ .name = "WWDG", .index = 0, .description = "Window Watchdog interrupt" },
    .{ .name = "TAMP_STAMP", .index = 2, .description = 
    \\Tamper and TimeStamp interrupts through the
    \\        EXTI line
    },
    .{ .name = "RTC_WKUP", .index = 3, .description = 
    \\RTC Wakeup interrupt through the EXTI
    \\        line
    },
    .{ .name = "FLASH", .index = 4, .description = "Flash global interrupt" },
    .{ .name = "RCC", .index = 5, .description = "RCC global interrupt" },
    .{ .name = "EXTI0", .index = 6, .description = "EXTI Line0 interrupt" },
    .{ .name = "EXTI1", .index = 7, .description = "EXTI Line1 interrupt" },
    .{ .name = "EXTI2", .index = 8, .description = "EXTI Line2 interrupt" },
    .{ .name = "EXTI3", .index = 9, .description = "EXTI Line3 interrupt" },
    .{ .name = "EXTI4", .index = 10, .description = "EXTI Line4 interrupt" },
    .{ .name = "DMA1_Stream0", .index = 11, .description = "DMA1 Stream0 global interrupt" },
    .{ .name = "DMA1_Stream1", .index = 12, .description = "DMA1 Stream1 global interrupt" },
    .{ .name = "DMA1_Stream2", .index = 13, .description = "DMA1 Stream2 global interrupt" },
    .{ .name = "DMA1_Stream3", .index = 14, .description = "DMA1 Stream3 global interrupt" },
    .{ .name = "DMA1_Stream4", .index = 15, .description = "DMA1 Stream4 global interrupt" },
    .{ .name = "DMA1_Stream5", .index = 16, .description = "DMA1 Stream5 global interrupt" },
    .{ .name = "DMA1_Stream6", .index = 17, .description = "DMA1 Stream6 global interrupt" },
    .{ .name = "ADC", .index = 18, .description = "ADC1 global interrupt" },
    .{ .name = "CAN1_TX", .index = 19, .description = "CAN1 TX interrupts" },
    .{ .name = "CAN1_RX0", .index = 20, .description = "CAN1 RX0 interrupts" },
    .{ .name = "CAN1_RX1", .index = 21, .description = "CAN1 RX1 interrupts" },
    .{ .name = "CAN1_SCE", .index = 22, .description = "CAN1 SCE interrupt" },
    .{ .name = "EXTI9_5", .index = 23, .description = "EXTI Line[9:5] interrupts" },
    .{ .name = "TIM1_BRK_TIM9", .index = 24, .description = 
    \\TIM1 Break interrupt and TIM9 global
    \\        interrupt
    },
    .{ .name = "TIM1_UP_TIM10", .index = 25, .description = 
    \\TIM1 Update interrupt and TIM10 global
    \\        interrupt
    },
    .{ .name = "TIM1_TRG_COM_TIM11", .index = 26, .description = 
    \\TIM1 Trigger and Commutation interrupts and
    \\        TIM11 global interrupt
    },
    .{ .name = "TIM1_CC", .index = 27, .description = "TIM1 Capture Compare interrupt" },
    .{ .name = "TIM2", .index = 28, .description = "TIM2 global interrupt" },
    .{ .name = "TIM3", .index = 29, .description = "TIM3 global interrupt" },
    .{ .name = "TIM4", .index = 30, .description = "TIM4 global interrupt" },
    .{ .name = "I2C1_EV", .index = 31, .description = "I2C1 event interrupt" },
    .{ .name = "I2C1_ER", .index = 32, .description = "I2C1 error interrupt" },
    .{ .name = "I2C2_EV", .index = 33, .description = "I2C2 event interrupt" },
    .{ .name = "I2C2_ER", .index = 34, .description = "I2C2 error interrupt" },
    .{ .name = "SPI1", .index = 35, .description = "SPI1 global interrupt" },
    .{ .name = "SPI2", .index = 36, .description = "SPI2 global interrupt" },
    .{ .name = "USART1", .index = 37, .description = "USART1 global interrupt" },
    .{ .name = "USART2", .index = 38, .description = "USART2 global interrupt" },
    .{ .name = "USART3", .index = 39, .description = "USART3 global interrupt" },
    .{ .name = "EXTI15_10", .index = 40, .description = "EXTI Line[15:10] interrupts" },
    .{ .name = "RTC_Alarm", .index = 41, .description = 
    \\RTC Alarms (A and B) through EXTI line
    \\        interrupt
    },
    .{ .name = "OTG_FS_WKUP", .index = 42, .description = 
    \\USB On-The-Go FS Wakeup through EXTI line
    \\        interrupt
    },
    .{ .name = "TIM8_BRK_TIM12", .index = 43, .description = 
    \\TIM8 Break interrupt and TIM12 global
    \\        interrupt
    },
    .{ .name = "TIM8_UP_TIM13", .index = 44, .description = 
    \\TIM8 Update interrupt and TIM13 global
    \\        interrupt
    },
    .{ .name = "TIM8_TRG_COM_TIM14", .index = 45, .description = 
    \\TIM8 Trigger and Commutation interrupts and
    \\        TIM14 global interrupt
    },
    .{ .name = "TIM8_CC", .index = 46, .description = "TIM8 Capture Compare interrupt" },
    .{ .name = "DMA1_Stream7", .index = 47, .description = "DMA1 Stream7 global interrupt" },
    .{ .name = "FMC", .index = 48, .description = "FMC global interrupt" },
    .{ .name = "TIM5", .index = 50, .description = "TIM5 global interrupt" },
    .{ .name = "SPI3", .index = 51, .description = "SPI3 global interrupt" },
    .{ .name = "UART4", .index = 52, .description = "UART4 global interrupt" },
    .{ .name = "UART5", .index = 53, .description = "UART5 global interrupt" },
    .{ .name = "TIM6_DAC", .index = 54, .description = 
    \\TIM6 global interrupt, DAC1 and DAC2 underrun
    \\        error interrupt
    },
    .{ .name = "TIM7", .index = 55, .description = "TIM7 global interrupt" },
    .{ .name = "DMA2_Stream0", .index = 56, .description = "DMA2 Stream0 global interrupt" },
    .{ .name = "DMA2_Stream1", .index = 57, .description = "DMA2 Stream1 global interrupt" },
    .{ .name = "DMA2_Stream2", .index = 58, .description = "DMA2 Stream2 global interrupt" },
    .{ .name = "DMA2_Stream3", .index = 59, .description = "DMA2 Stream3 global interrupt" },
    .{ .name = "DMA2_Stream4", .index = 60, .description = "DMA2 Stream4 global interrupt" },
    .{ .name = "ETH", .index = 61, .description = "Ethernet global interrupt" },
    .{ .name = "ETH_WKUP", .index = 62, .description = 
    \\Ethernet Wakeup through EXTI line
    \\        interrupt
    },
    .{ .name = "CAN2_TX", .index = 63, .description = "CAN2 TX interrupts" },
    .{ .name = "CAN2_RX0", .index = 64, .description = "CAN2 RX0 interrupts" },
    .{ .name = "CAN2_RX1", .index = 65, .description = "CAN2 RX1 interrupts" },
    .{ .name = "CAN2_SCE", .index = 66, .description = "CAN2 SCE interrupt" },
    .{ .name = "OTG_FS", .index = 67, .description = 
    \\USB On The Go FS global
    \\        interrupt
    },
    .{ .name = "DMA2_Stream5", .index = 68, .description = "DMA2 Stream5 global interrupt" },
    .{ .name = "DMA2_Stream6", .index = 69, .description = "DMA2 Stream6 global interrupt" },
    .{ .name = "DMA2_Stream7", .index = 70, .description = "DMA2 Stream7 global interrupt" },
    .{ .name = "USART6", .index = 71, .description = "USART6 global interrupt" },
    .{ .name = "I2C3_EV", .index = 72, .description = "I2C3 event interrupt" },
    .{ .name = "I2C3_ER", .index = 73, .description = "I2C3 error interrupt" },
    .{ .name = "DCMI", .index = 78, .description = "DCMI global interrupt" },
    .{ .name = "FPU", .index = 81, .description = "Floating point unit interrupt" },
    .{ .name = "UART7", .index = 82, .description = "UART 7 global interrupt" },
    .{ .name = "UART8", .index = 83, .description = "UART 8 global interrupt" },
    .{ .name = "SPI4", .index = 84, .description = "SPI 4 global interrupt" },
    .{ .name = "LCD_TFT", .index = 88, .description = "LTDC global interrupt" },
    .{ .name = "LCD_TFT_1", .index = 89, .description = "LTDC global error interrupt" },
};

pub const VectorTable = extern struct {
    initial_stack_pointer: u32,
    Reset: Handler,
    NMI: Handler = unhandled,
    HardFault: Handler = unhandled,
    MemManageFault: Handler = unhandled,
    BusFault: Handler = unhandled,
    UsageFault: Handler = unhandled,
    reserved5: [4]u32 = undefined,
    SVCall: Handler = unhandled,
    reserved10: [2]u32 = undefined,
    PendSV: Handler = unhandled,
    SysTick: Handler = unhandled,
    /// Window Watchdog interrupt
    WWDG: Handler = unhandled,
    reserved15: [1]u32 = undefined,
    /// Tamper and TimeStamp interrupts through the EXTI line
    TAMP_STAMP: Handler = unhandled,
    /// RTC Wakeup interrupt through the EXTI line
    RTC_WKUP: Handler = unhandled,
    /// Flash global interrupt
    FLASH: Handler = unhandled,
    /// RCC global interrupt
    RCC: Handler = unhandled,
    /// EXTI Line0 interrupt
    EXTI0: Handler = unhandled,
    /// EXTI Line1 interrupt
    EXTI1: Handler = unhandled,
    /// EXTI Line2 interrupt
    EXTI2: Handler = unhandled,
    /// EXTI Line3 interrupt
    EXTI3: Handler = unhandled,
    /// EXTI Line4 interrupt
    EXTI4: Handler = unhandled,
    /// DMA1 Stream0 global interrupt
    DMA1_Stream0: Handler = unhandled,
    /// DMA1 Stream1 global interrupt
    DMA1_Stream1: Handler = unhandled,
    /// DMA1 Stream2 global interrupt
    DMA1_Stream2: Handler = unhandled,
    /// DMA1 Stream3 global interrupt
    DMA1_Stream3: Handler = unhandled,
    /// DMA1 Stream4 global interrupt
    DMA1_Stream4: Handler = unhandled,
    /// DMA1 Stream5 global interrupt
    DMA1_Stream5: Handler = unhandled,
    /// DMA1 Stream6 global interrupt
    DMA1_Stream6: Handler = unhandled,
    /// ADC1 global interrupt
    ADC: Handler = unhandled,
    /// CAN1 TX interrupts
    CAN1_TX: Handler = unhandled,
    /// CAN1 RX0 interrupts
    CAN1_RX0: Handler = unhandled,
    /// CAN1 RX1 interrupts
    CAN1_RX1: Handler = unhandled,
    /// CAN1 SCE interrupt
    CAN1_SCE: Handler = unhandled,
    /// EXTI Line[9:5] interrupts
    EXTI9_5: Handler = unhandled,
    /// TIM1 Break interrupt and TIM9 global interrupt
    TIM1_BRK_TIM9: Handler = unhandled,
    /// TIM1 Update interrupt and TIM10 global interrupt
    TIM1_UP_TIM10: Handler = unhandled,
    /// TIM1 Trigger and Commutation interrupts and TIM11 global interrupt
    TIM1_TRG_COM_TIM11: Handler = unhandled,
    /// TIM1 Capture Compare interrupt
    TIM1_CC: Handler = unhandled,
    /// TIM2 global interrupt
    TIM2: Handler = unhandled,
    /// TIM3 global interrupt
    TIM3: Handler = unhandled,
    /// TIM4 global interrupt
    TIM4: Handler = unhandled,
    /// I2C1 event interrupt
    I2C1_EV: Handler = unhandled,
    /// I2C1 error interrupt
    I2C1_ER: Handler = unhandled,
    /// I2C2 event interrupt
    I2C2_EV: Handler = unhandled,
    /// I2C2 error interrupt
    I2C2_ER: Handler = unhandled,
    /// SPI1 global interrupt
    SPI1: Handler = unhandled,
    /// SPI2 global interrupt
    SPI2: Handler = unhandled,
    /// USART1 global interrupt
    USART1: Handler = unhandled,
    /// USART2 global interrupt
    USART2: Handler = unhandled,
    /// USART3 global interrupt
    USART3: Handler = unhandled,
    /// EXTI Line[15:10] interrupts
    EXTI15_10: Handler = unhandled,
    /// RTC Alarms (A and B) through EXTI line interrupt
    RTC_Alarm: Handler = unhandled,
    /// USB On-The-Go FS Wakeup through EXTI line interrupt
    OTG_FS_WKUP: Handler = unhandled,
    /// TIM8 Break interrupt and TIM12 global interrupt
    TIM8_BRK_TIM12: Handler = unhandled,
    /// TIM8 Update interrupt and TIM13 global interrupt
    TIM8_UP_TIM13: Handler = unhandled,
    /// TIM8 Trigger and Commutation interrupts and TIM14 global interrupt
    TIM8_TRG_COM_TIM14: Handler = unhandled,
    /// TIM8 Capture Compare interrupt
    TIM8_CC: Handler = unhandled,
    /// DMA1 Stream7 global interrupt
    DMA1_Stream7: Handler = unhandled,
    /// FMC global interrupt
    FMC: Handler = unhandled,
    reserved63: [1]u32 = undefined,
    /// TIM5 global interrupt
    TIM5: Handler = unhandled,
    /// SPI3 global interrupt
    SPI3: Handler = unhandled,
    /// UART4 global interrupt
    UART4: Handler = unhandled,
    /// UART5 global interrupt
    UART5: Handler = unhandled,
    /// TIM6 global interrupt, DAC1 and DAC2 underrun error interrupt
    TIM6_DAC: Handler = unhandled,
    /// TIM7 global interrupt
    TIM7: Handler = unhandled,
    /// DMA2 Stream0 global interrupt
    DMA2_Stream0: Handler = unhandled,
    /// DMA2 Stream1 global interrupt
    DMA2_Stream1: Handler = unhandled,
    /// DMA2 Stream2 global interrupt
    DMA2_Stream2: Handler = unhandled,
    /// DMA2 Stream3 global interrupt
    DMA2_Stream3: Handler = unhandled,
    /// DMA2 Stream4 global interrupt
    DMA2_Stream4: Handler = unhandled,
    /// Ethernet global interrupt
    ETH: Handler = unhandled,
    /// Ethernet Wakeup through EXTI line interrupt
    ETH_WKUP: Handler = unhandled,
    /// CAN2 TX interrupts
    CAN2_TX: Handler = unhandled,
    /// CAN2 RX0 interrupts
    CAN2_RX0: Handler = unhandled,
    /// CAN2 RX1 interrupts
    CAN2_RX1: Handler = unhandled,
    /// CAN2 SCE interrupt
    CAN2_SCE: Handler = unhandled,
    /// USB On The Go FS global interrupt
    OTG_FS: Handler = unhandled,
    /// DMA2 Stream5 global interrupt
    DMA2_Stream5: Handler = unhandled,
    /// DMA2 Stream6 global interrupt
    DMA2_Stream6: Handler = unhandled,
    /// DMA2 Stream7 global interrupt
    DMA2_Stream7: Handler = unhandled,
    /// USART6 global interrupt
    USART6: Handler = unhandled,
    /// I2C3 event interrupt
    I2C3_EV: Handler = unhandled,
    /// I2C3 error interrupt
    I2C3_ER: Handler = unhandled,
    reserved88: [4]u32 = undefined,
    /// DCMI global interrupt
    DCMI: Handler = unhandled,
    reserved93: [2]u32 = undefined,
    /// Floating point unit interrupt
    FPU: Handler = unhandled,
    /// UART 7 global interrupt
    UART7: Handler = unhandled,
    /// UART 8 global interrupt
    UART8: Handler = unhandled,
    /// SPI 4 global interrupt
    SPI4: Handler = unhandled,
    reserved99: [3]u32 = undefined,
    /// LTDC global interrupt
    LCD_TFT: Handler = unhandled,
    /// LTDC global error interrupt
    LCD_TFT_1: Handler = unhandled,
};

pub const peripherals = struct {
    /// General purpose timers
    pub const TIM2: *volatile types.peripherals.TIM2 = @ptrFromInt(0x40000000);
    /// General purpose timers
    pub const TIM3: *volatile types.peripherals.TIM3 = @ptrFromInt(0x40000400);
    /// General purpose timers
    pub const TIM4: *volatile types.peripherals.TIM3 = @ptrFromInt(0x40000800);
    /// General-purpose-timers
    pub const TIM5: *volatile types.peripherals.TIM5 = @ptrFromInt(0x40000c00);
    /// Basic timers
    pub const TIM6: *volatile types.peripherals.TIM6 = @ptrFromInt(0x40001000);
    /// Basic timers
    pub const TIM7: *volatile types.peripherals.TIM6 = @ptrFromInt(0x40001400);
    /// General purpose timers
    pub const TIM12: *volatile types.peripherals.TIM9 = @ptrFromInt(0x40001800);
    /// General-purpose-timers
    pub const TIM13: *volatile types.peripherals.TIM10 = @ptrFromInt(0x40001c00);
    /// General-purpose-timers
    pub const TIM14: *volatile types.peripherals.TIM10 = @ptrFromInt(0x40002000);
    /// Real-time clock
    pub const RTC: *volatile types.peripherals.RTC = @ptrFromInt(0x40002800);
    /// Window watchdog
    pub const WWDG: *volatile types.peripherals.WWDG = @ptrFromInt(0x40002c00);
    /// Independent watchdog
    pub const IWDG: *volatile types.peripherals.IWDG = @ptrFromInt(0x40003000);
    /// Serial peripheral interface
    pub const SPI2: *volatile types.peripherals.SPI1 = @ptrFromInt(0x40003800);
    /// Serial peripheral interface
    pub const SPI3: *volatile types.peripherals.SPI1 = @ptrFromInt(0x40003c00);
    /// Receiver Interface
    pub const SPDIF_RX: *volatile types.peripherals.SPDIF_RX = @ptrFromInt(0x40004000);
    /// Universal synchronous asynchronous receiver transmitter
    pub const USART2: *volatile types.peripherals.USART6 = @ptrFromInt(0x40004400);
    /// Universal synchronous asynchronous receiver transmitter
    pub const USART3: *volatile types.peripherals.USART6 = @ptrFromInt(0x40004800);
    /// Universal synchronous asynchronous receiver transmitter
    pub const UART4: *volatile types.peripherals.UART4 = @ptrFromInt(0x40004c00);
    /// Universal synchronous asynchronous receiver transmitter
    pub const UART5: *volatile types.peripherals.UART4 = @ptrFromInt(0x40005000);
    /// Inter-integrated circuit
    pub const I2C1: *volatile types.peripherals.I2C3 = @ptrFromInt(0x40005400);
    /// Inter-integrated circuit
    pub const I2C2: *volatile types.peripherals.I2C3 = @ptrFromInt(0x40005800);
    /// Inter-integrated circuit
    pub const I2C3: *volatile types.peripherals.I2C3 = @ptrFromInt(0x40005c00);
    /// Controller area network
    pub const CAN1: *volatile types.peripherals.CAN1 = @ptrFromInt(0x40006400);
    /// Controller area network
    pub const CAN2: *volatile types.peripherals.CAN1 = @ptrFromInt(0x40006800);
    /// HDMI-CEC controller
    pub const HDMI_CEC: *volatile types.peripherals.HDMI_CEC = @ptrFromInt(0x40006c00);
    /// Power control
    pub const PWR: *volatile types.peripherals.PWR = @ptrFromInt(0x40007000);
    /// Digital-to-analog converter
    pub const DAC: *volatile types.peripherals.DAC = @ptrFromInt(0x40007400);
    /// Advanced-timers
    pub const TIM1: *volatile types.peripherals.TIM1 = @ptrFromInt(0x40010000);
    /// Advanced-timers
    pub const TIM8: *volatile types.peripherals.TIM1 = @ptrFromInt(0x40010400);
    /// Universal synchronous asynchronous receiver transmitter
    pub const USART1: *volatile types.peripherals.USART6 = @ptrFromInt(0x40011000);
    /// Universal synchronous asynchronous receiver transmitter
    pub const USART6: *volatile types.peripherals.USART6 = @ptrFromInt(0x40011400);
    /// Analog-to-digital converter
    pub const ADC1: *volatile types.peripherals.ADC1 = @ptrFromInt(0x40012000);
    /// Analog-to-digital converter
    pub const ADC2: *volatile types.peripherals.ADC1 = @ptrFromInt(0x40012100);
    /// Analog-to-digital converter
    pub const ADC3: *volatile types.peripherals.ADC1 = @ptrFromInt(0x40012200);
    /// Common ADC registers
    pub const C_ADC: *volatile types.peripherals.C_ADC = @ptrFromInt(0x40012300);
    /// SDMMC
    pub const SDMMC: *volatile types.peripherals.SDMMC = @ptrFromInt(0x40012c00);
    /// Serial peripheral interface
    pub const SPI1: *volatile types.peripherals.SPI1 = @ptrFromInt(0x40013000);
    /// Serial peripheral interface
    pub const SPI4: *volatile types.peripherals.SPI1 = @ptrFromInt(0x40013400);
    /// System configuration controller
    pub const SYSCFG: *volatile types.peripherals.SYSCFG = @ptrFromInt(0x40013800);
    /// External interrupt/event controller
    pub const EXTI: *volatile types.peripherals.EXTI = @ptrFromInt(0x40013c00);
    /// General purpose timers
    pub const TIM9: *volatile types.peripherals.TIM9 = @ptrFromInt(0x40014000);
    /// General-purpose-timers
    pub const TIM10: *volatile types.peripherals.TIM10 = @ptrFromInt(0x40014400);
    /// General-purpose-timers
    pub const TIM11: *volatile types.peripherals.TIM11 = @ptrFromInt(0x40014800);
    /// Serial audio interface
    pub const SAI1: *volatile types.peripherals.SAI1 = @ptrFromInt(0x40015800);
    /// Serial audio interface
    pub const SAI2: *volatile types.peripherals.SAI1 = @ptrFromInt(0x40015c00);
    /// General-purpose I/Os
    pub const GPIOA: *volatile types.peripherals.GPIOA = @ptrFromInt(0x40020000);
    /// General-purpose I/Os
    pub const GPIOB: *volatile types.peripherals.GPIOB = @ptrFromInt(0x40020400);
    /// General-purpose I/Os
    pub const GPIOC: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40020800);
    /// General-purpose I/Os
    pub const GPIOD: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40020c00);
    /// General-purpose I/Os
    pub const GPIOE: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40021000);
    /// General-purpose I/Os
    pub const GPIOF: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40021400);
    /// General-purpose I/Os
    pub const GPIOG: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40021800);
    /// General-purpose I/Os
    pub const GPIOH: *volatile types.peripherals.GPIOH = @ptrFromInt(0x40021c00);
    /// Cryptographic processor
    pub const CRC: *volatile types.peripherals.CRC = @ptrFromInt(0x40023000);
    /// Reset and clock control
    pub const RCC: *volatile types.peripherals.RCC = @ptrFromInt(0x40023800);
    /// FLASH
    pub const FLASH: *volatile types.peripherals.FLASH = @ptrFromInt(0x40023c00);
    /// DMA controller
    pub const DMA1: *volatile types.peripherals.DMA2 = @ptrFromInt(0x40026000);
    /// DMA controller
    pub const DMA2: *volatile types.peripherals.DMA2 = @ptrFromInt(0x40026400);
    /// USB on the go high speed
    pub const OTG_HS_GLOBAL: *volatile types.peripherals.OTG_HS_GLOBAL = @ptrFromInt(0x40040000);
    /// USB on the go high speed
    pub const OTG_HS_HOST: *volatile types.peripherals.OTG_HS_HOST = @ptrFromInt(0x40040400);
    /// USB on the go high speed
    pub const OTG_HS_DEVICE: *volatile types.peripherals.OTG_HS_DEVICE = @ptrFromInt(0x40040800);
    /// USB on the go high speed
    pub const OTG_HS_PWRCLK: *volatile types.peripherals.OTG_HS_PWRCLK = @ptrFromInt(0x40040e00);
    /// USB on the go full speed
    pub const OTG_FS_GLOBAL: *volatile types.peripherals.OTG_FS_GLOBAL = @ptrFromInt(0x50000000);
    /// USB on the go full speed
    pub const OTG_FS_HOST: *volatile types.peripherals.OTG_FS_HOST = @ptrFromInt(0x50000400);
    /// USB on the go full speed
    pub const OTG_FS_DEVICE: *volatile types.peripherals.OTG_FS_DEVICE = @ptrFromInt(0x50000800);
    /// USB on the go full speed
    pub const OTG_FS_PWRCLK: *volatile types.peripherals.OTG_FS_PWRCLK = @ptrFromInt(0x50000e00);
    /// Digital camera interface
    pub const DCMI: *volatile types.peripherals.DCMI = @ptrFromInt(0x50050000);
    /// Flexible memory controller
    pub const FMC: *volatile types.peripherals.FMC = @ptrFromInt(0xa0000000);
    /// QuadSPI interface
    pub const QUADSPI: *volatile types.peripherals.QUADSPI = @ptrFromInt(0xa0001000);
    /// System control block ACTLR
    pub const SCB_ACTRL: *volatile types.peripherals.SCB_ACTRL = @ptrFromInt(0xe000e008);
    /// SysTick timer
    pub const STK: *volatile types.peripherals.STK = @ptrFromInt(0xe000e010);
    /// Nested Vectored Interrupt Controller
    pub const NVIC: *volatile types.peripherals.NVIC = @ptrFromInt(0xe000e100);
    /// System control block
    pub const SCB: *volatile types.peripherals.SCB = @ptrFromInt(0xe000ed00);
    /// Floating point unit CPACR
    pub const FPU_CPACR: *volatile types.peripherals.FPU_CPACR = @ptrFromInt(0xe000ed88);
    /// Memory protection unit
    pub const MPU: *volatile types.peripherals.MPU = @ptrFromInt(0xe000ed90);
    /// Nested vectored interrupt controller
    pub const NVIC_STIR: *volatile types.peripherals.NVIC_STIR = @ptrFromInt(0xe000ef00);
    /// Floting point unit
    pub const FPU: *volatile types.peripherals.FPU = @ptrFromInt(0xe000ef34);
    /// Debug support
    pub const DBG: *volatile types.peripherals.DBG = @ptrFromInt(0xe0042000);
};
