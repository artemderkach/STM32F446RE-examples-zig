const microzig = @import("microzig");
const mmio = microzig.mmio;

const types = @import("../../types.zig");

/// Reset and clock control
pub const RCC = extern struct {
    /// clock control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        /// Internal high-speed clock enable
        HSION: u1 = 0x1,
        /// Internal high-speed clock ready flag
        HSIRDY: u1 = 0x1,
        reserved3: u1 = 0,
        /// Internal high-speed clock trimming
        HSITRIM: u5 = 0x10,
        /// Internal high-speed clock calibration
        HSICAL: u8 = 0x0,
        /// HSE clock enable
        HSEON: u1 = 0x0,
        /// HSE clock ready flag
        HSERDY: u1 = 0x0,
        /// HSE clock bypass
        HSEBYP: u1 = 0x0,
        /// Clock security system enable
        CSSON: u1 = 0x0,
        reserved24: u4 = 0,
        /// Main PLL (PLL) enable
        PLLON: u1 = 0x0,
        /// Main PLL (PLL) clock ready flag
        PLLRDY: u1 = 0x0,
        /// PLLI2S enable
        PLLI2SON: u1 = 0x0,
        /// PLLI2S clock ready flag
        PLLI2SRDY: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// PLL configuration register
    /// offset: 0x04
    PLLCFGR: mmio.Mmio(packed struct(u32) {
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM0: u1 = 0x0,
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM1: u1 = 0x0,
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM2: u1 = 0x0,
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM3: u1 = 0x0,
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM4: u1 = 0x1,
        /// Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
        PLLM5: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN0: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN1: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN2: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN3: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN4: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN5: u1 = 0x0,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN6: u1 = 0x1,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN7: u1 = 0x1,
        /// Main PLL (PLL) multiplication factor for VCO
        PLLN8: u1 = 0x0,
        reserved16: u1 = 0,
        /// Main PLL (PLL) division factor for main system clock
        PLLP0: u1 = 0x0,
        /// Main PLL (PLL) division factor for main system clock
        PLLP1: u1 = 0x0,
        reserved22: u4 = 0,
        /// Main PLL(PLL) and audio PLL (PLLI2S) entry clock source
        PLLSRC: u1 = 0x0,
        reserved24: u1 = 0,
        /// Main PLL (PLL) division factor for USB OTG FS, SDIO and random number generator clocks
        PLLQ0: u1 = 0x0,
        /// Main PLL (PLL) division factor for USB OTG FS, SDIO and random number generator clocks
        PLLQ1: u1 = 0x0,
        /// Main PLL (PLL) division factor for USB OTG FS, SDIO and random number generator clocks
        PLLQ2: u1 = 0x1,
        /// Main PLL (PLL) division factor for USB OTG FS, SDIO and random number generator clocks
        PLLQ3: u1 = 0x0,
        padding: u4 = 0,
    }),
    /// clock configuration register
    /// offset: 0x08
    CFGR: mmio.Mmio(packed struct(u32) {
        /// System clock switch
        SW0: u1 = 0x0,
        /// System clock switch
        SW1: u1 = 0x0,
        /// System clock switch status
        SWS0: u1 = 0x0,
        /// System clock switch status
        SWS1: u1 = 0x0,
        /// AHB prescaler
        HPRE: u4 = 0x0,
        reserved10: u2 = 0,
        /// APB Low speed prescaler (APB1)
        PPRE1: u3 = 0x0,
        /// APB high-speed prescaler (APB2)
        PPRE2: u3 = 0x0,
        /// HSE division factor for RTC clock
        RTCPRE: u5 = 0x0,
        /// Microcontroller clock output 1
        MCO1: u2 = 0x0,
        /// I2S clock selection
        I2SSRC: u1 = 0x0,
        /// MCO1 prescaler
        MCO1PRE: u3 = 0x0,
        /// MCO2 prescaler
        MCO2PRE: u3 = 0x0,
        /// Microcontroller clock output 2
        MCO2: u2 = 0x0,
    }),
    /// clock interrupt register
    /// offset: 0x0c
    CIR: mmio.Mmio(packed struct(u32) {
        /// LSI ready interrupt flag
        LSIRDYF: u1 = 0x0,
        /// LSE ready interrupt flag
        LSERDYF: u1 = 0x0,
        /// HSI ready interrupt flag
        HSIRDYF: u1 = 0x0,
        /// HSE ready interrupt flag
        HSERDYF: u1 = 0x0,
        /// Main PLL (PLL) ready interrupt flag
        PLLRDYF: u1 = 0x0,
        /// PLLI2S ready interrupt flag
        PLLI2SRDYF: u1 = 0x0,
        /// PLLSAI ready interrupt flag
        PLLSAIRDYF: u1 = 0x0,
        /// Clock security system interrupt flag
        CSSF: u1 = 0x0,
        /// LSI ready interrupt enable
        LSIRDYIE: u1 = 0x0,
        /// LSE ready interrupt enable
        LSERDYIE: u1 = 0x0,
        /// HSI ready interrupt enable
        HSIRDYIE: u1 = 0x0,
        /// HSE ready interrupt enable
        HSERDYIE: u1 = 0x0,
        /// Main PLL (PLL) ready interrupt enable
        PLLRDYIE: u1 = 0x0,
        /// PLLI2S ready interrupt enable
        PLLI2SRDYIE: u1 = 0x0,
        /// PLLSAI Ready Interrupt Enable
        PLLSAIRDYIE: u1 = 0x0,
        reserved16: u1 = 0,
        /// LSI ready interrupt clear
        LSIRDYC: u1 = 0x0,
        /// LSE ready interrupt clear
        LSERDYC: u1 = 0x0,
        /// HSI ready interrupt clear
        HSIRDYC: u1 = 0x0,
        /// HSE ready interrupt clear
        HSERDYC: u1 = 0x0,
        /// Main PLL(PLL) ready interrupt clear
        PLLRDYC: u1 = 0x0,
        /// PLLI2S ready interrupt clear
        PLLI2SRDYC: u1 = 0x0,
        /// PLLSAI Ready Interrupt Clear
        PLLSAIRDYC: u1 = 0x0,
        /// Clock security system interrupt clear
        CSSC: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// AHB1 peripheral reset register
    /// offset: 0x10
    AHB1RSTR: mmio.Mmio(packed struct(u32) {
        /// IO port A reset
        GPIOARST: u1 = 0x0,
        /// IO port B reset
        GPIOBRST: u1 = 0x0,
        /// IO port C reset
        GPIOCRST: u1 = 0x0,
        /// IO port D reset
        GPIODRST: u1 = 0x0,
        /// IO port E reset
        GPIOERST: u1 = 0x0,
        /// IO port F reset
        GPIOFRST: u1 = 0x0,
        /// IO port G reset
        GPIOGRST: u1 = 0x0,
        /// IO port H reset
        GPIOHRST: u1 = 0x0,
        reserved12: u4 = 0,
        /// CRC reset
        CRCRST: u1 = 0x0,
        reserved21: u8 = 0,
        /// DMA2 reset
        DMA1RST: u1 = 0x0,
        /// DMA2 reset
        DMA2RST: u1 = 0x0,
        reserved29: u6 = 0,
        /// USB OTG HS module reset
        OTGHSRST: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// AHB2 peripheral reset register
    /// offset: 0x14
    AHB2RSTR: mmio.Mmio(packed struct(u32) {
        /// Camera interface reset
        DCMIRST: u1 = 0x0,
        reserved7: u6 = 0,
        /// USB OTG FS module reset
        OTGFSRST: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// AHB3 peripheral reset register
    /// offset: 0x18
    AHB3RSTR: mmio.Mmio(packed struct(u32) {
        /// Flexible memory controller module reset
        FMCRST: u1 = 0x0,
        /// QUADSPI module reset
        QSPIRST: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// APB1 peripheral reset register
    /// offset: 0x20
    APB1RSTR: mmio.Mmio(packed struct(u32) {
        /// TIM2 reset
        TIM2RST: u1 = 0x0,
        /// TIM3 reset
        TIM3RST: u1 = 0x0,
        /// TIM4 reset
        TIM4RST: u1 = 0x0,
        /// TIM5 reset
        TIM5RST: u1 = 0x0,
        /// TIM6 reset
        TIM6RST: u1 = 0x0,
        /// TIM7 reset
        TIM7RST: u1 = 0x0,
        /// TIM12 reset
        TIM12RST: u1 = 0x0,
        /// TIM13 reset
        TIM13RST: u1 = 0x0,
        /// TIM14 reset
        TIM14RST: u1 = 0x0,
        reserved11: u2 = 0,
        /// Window watchdog reset
        WWDGRST: u1 = 0x0,
        reserved14: u2 = 0,
        /// SPI 2 reset
        SPI2RST: u1 = 0x0,
        /// SPI 3 reset
        SPI3RST: u1 = 0x0,
        /// SPDIF-IN reset
        SPDIFRST: u1 = 0x0,
        /// USART 2 reset
        UART2RST: u1 = 0x0,
        /// USART 3 reset
        UART3RST: u1 = 0x0,
        /// USART 4 reset
        UART4RST: u1 = 0x0,
        /// USART 5 reset
        UART5RST: u1 = 0x0,
        /// I2C 1 reset
        I2C1RST: u1 = 0x0,
        /// I2C 2 reset
        I2C2RST: u1 = 0x0,
        /// I2C3 reset
        I2C3RST: u1 = 0x0,
        /// I2CFMP1 reset
        I2CFMP1RST: u1 = 0x0,
        /// CAN1 reset
        CAN1RST: u1 = 0x0,
        /// CAN2 reset
        CAN2RST: u1 = 0x0,
        reserved28: u1 = 0,
        /// Power interface reset
        PWRRST: u1 = 0x0,
        /// DAC reset
        DACRST: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// APB2 peripheral reset register
    /// offset: 0x24
    APB2RSTR: mmio.Mmio(packed struct(u32) {
        /// TIM1 reset
        TIM1RST: u1 = 0x0,
        /// TIM8 reset
        TIM8RST: u1 = 0x0,
        reserved4: u2 = 0,
        /// USART1 reset
        USART1RST: u1 = 0x0,
        /// USART6 reset
        USART6RST: u1 = 0x0,
        reserved8: u2 = 0,
        /// ADC interface reset (common to all ADCs)
        ADCRST: u1 = 0x0,
        reserved11: u2 = 0,
        /// SDIO reset
        SDIORST: u1 = 0x0,
        /// SPI 1 reset
        SPI1RST: u1 = 0x0,
        /// SPI4 reset
        SPI4RST: u1 = 0x0,
        /// System configuration controller reset
        SYSCFGRST: u1 = 0x0,
        reserved16: u1 = 0,
        /// TIM9 reset
        TIM9RST: u1 = 0x0,
        /// TIM10 reset
        TIM10RST: u1 = 0x0,
        /// TIM11 reset
        TIM11RST: u1 = 0x0,
        reserved22: u3 = 0,
        /// SAI1 reset
        SAI1RST: u1 = 0x0,
        /// SAI2 reset
        SAI2RST: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// offset: 0x28
    reserved40: [8]u8,
    /// AHB1 peripheral clock register
    /// offset: 0x30
    AHB1ENR: mmio.Mmio(packed struct(u32) {
        /// IO port A clock enable
        GPIOAEN: u1 = 0x0,
        /// IO port B clock enable
        GPIOBEN: u1 = 0x0,
        /// IO port C clock enable
        GPIOCEN: u1 = 0x0,
        /// IO port D clock enable
        GPIODEN: u1 = 0x0,
        /// IO port E clock enable
        GPIOEEN: u1 = 0x0,
        /// IO port F clock enable
        GPIOFEN: u1 = 0x0,
        /// IO port G clock enable
        GPIOGEN: u1 = 0x0,
        /// IO port H clock enable
        GPIOHEN: u1 = 0x0,
        reserved12: u4 = 0,
        /// CRC clock enable
        CRCEN: u1 = 0x0,
        reserved18: u5 = 0,
        /// Backup SRAM interface clock enable
        BKPSRAMEN: u1 = 0x0,
        reserved21: u2 = 0,
        /// DMA1 clock enable
        DMA1EN: u1 = 0x0,
        /// DMA2 clock enable
        DMA2EN: u1 = 0x0,
        reserved29: u6 = 0,
        /// USB OTG HS clock enable
        OTGHSEN: u1 = 0x0,
        /// USB OTG HSULPI clock enable
        OTGHSULPIEN: u1 = 0x0,
        padding: u1 = 0,
    }),
    /// AHB2 peripheral clock enable register
    /// offset: 0x34
    AHB2ENR: mmio.Mmio(packed struct(u32) {
        /// Camera interface enable
        DCMIEN: u1 = 0x0,
        reserved7: u6 = 0,
        /// USB OTG FS clock enable
        OTGFSEN: u1 = 0x0,
        padding: u24 = 0,
    }),
    /// AHB3 peripheral clock enable register
    /// offset: 0x38
    AHB3ENR: mmio.Mmio(packed struct(u32) {
        /// Flexible memory controller module clock enable
        FMCEN: u1 = 0x0,
        /// QUADSPI memory controller module clock enable
        QSPIEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// offset: 0x3c
    reserved60: [4]u8,
    /// APB1 peripheral clock enable register
    /// offset: 0x40
    APB1ENR: mmio.Mmio(packed struct(u32) {
        /// TIM2 clock enable
        TIM2EN: u1 = 0x0,
        /// TIM3 clock enable
        TIM3EN: u1 = 0x0,
        /// TIM4 clock enable
        TIM4EN: u1 = 0x0,
        /// TIM5 clock enable
        TIM5EN: u1 = 0x0,
        /// TIM6 clock enable
        TIM6EN: u1 = 0x0,
        /// TIM7 clock enable
        TIM7EN: u1 = 0x0,
        /// TIM12 clock enable
        TIM12EN: u1 = 0x0,
        /// TIM13 clock enable
        TIM13EN: u1 = 0x0,
        /// TIM14 clock enable
        TIM14EN: u1 = 0x0,
        reserved11: u2 = 0,
        /// Window watchdog clock enable
        WWDGEN: u1 = 0x0,
        reserved14: u2 = 0,
        /// SPI2 clock enable
        SPI2EN: u1 = 0x0,
        /// SPI3 clock enable
        SPI3EN: u1 = 0x0,
        /// SPDIF-IN clock enable
        SPDIFEN: u1 = 0x0,
        /// USART 2 clock enable
        USART2EN: u1 = 0x0,
        /// USART3 clock enable
        USART3EN: u1 = 0x0,
        /// UART4 clock enable
        UART4EN: u1 = 0x0,
        /// UART5 clock enable
        UART5EN: u1 = 0x0,
        /// I2C1 clock enable
        I2C1EN: u1 = 0x0,
        /// I2C2 clock enable
        I2C2EN: u1 = 0x0,
        /// I2C3 clock enable
        I2C3EN: u1 = 0x0,
        /// I2CFMP1 clock enable
        I2CFMP1EN: u1 = 0x0,
        /// CAN 1 clock enable
        CAN1EN: u1 = 0x0,
        /// CAN 2 clock enable
        CAN2EN: u1 = 0x0,
        /// CEC interface clock enable
        CEC: u1 = 0x0,
        /// Power interface clock enable
        PWREN: u1 = 0x0,
        /// DAC interface clock enable
        DACEN: u1 = 0x0,
        padding: u2 = 0,
    }),
    /// APB2 peripheral clock enable register
    /// offset: 0x44
    APB2ENR: mmio.Mmio(packed struct(u32) {
        /// TIM1 clock enable
        TIM1EN: u1 = 0x0,
        /// TIM8 clock enable
        TIM8EN: u1 = 0x0,
        reserved4: u2 = 0,
        /// USART1 clock enable
        USART1EN: u1 = 0x0,
        /// USART6 clock enable
        USART6EN: u1 = 0x0,
        reserved8: u2 = 0,
        /// ADC1 clock enable
        ADC1EN: u1 = 0x0,
        /// ADC2 clock enable
        ADC2EN: u1 = 0x0,
        /// ADC3 clock enable
        ADC3EN: u1 = 0x0,
        /// SDIO clock enable
        SDIOEN: u1 = 0x0,
        /// SPI1 clock enable
        SPI1EN: u1 = 0x0,
        /// SPI4 clock enable
        SPI4ENR: u1 = 0x0,
        /// System configuration controller clock enable
        SYSCFGEN: u1 = 0x0,
        reserved16: u1 = 0,
        /// TIM9 clock enable
        TIM9EN: u1 = 0x0,
        /// TIM10 clock enable
        TIM10EN: u1 = 0x0,
        /// TIM11 clock enable
        TIM11EN: u1 = 0x0,
        reserved22: u3 = 0,
        /// SAI1 clock enable
        SAI1EN: u1 = 0x0,
        /// SAI2 clock enable
        SAI2EN: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// offset: 0x48
    reserved72: [8]u8,
    /// AHB1 peripheral clock enable in low power mode register
    /// offset: 0x50
    AHB1LPENR: mmio.Mmio(packed struct(u32) {
        /// IO port A clock enable during sleep mode
        GPIOALPEN: u1 = 0x1,
        /// IO port B clock enable during Sleep mode
        GPIOBLPEN: u1 = 0x1,
        /// IO port C clock enable during Sleep mode
        GPIOCLPEN: u1 = 0x1,
        /// IO port D clock enable during Sleep mode
        GPIODLPEN: u1 = 0x1,
        /// IO port E clock enable during Sleep mode
        GPIOELPEN: u1 = 0x1,
        /// IO port F clock enable during Sleep mode
        GPIOFLPEN: u1 = 0x1,
        /// IO port G clock enable during Sleep mode
        GPIOGLPEN: u1 = 0x1,
        /// IO port H clock enable during Sleep mode
        GPIOHLPEN: u1 = 0x1,
        reserved12: u4 = 0,
        /// CRC clock enable during Sleep mode
        CRCLPEN: u1 = 0x1,
        reserved15: u2 = 0,
        /// Flash interface clock enable during Sleep mode
        FLITFLPEN: u1 = 0x1,
        /// SRAM 1interface clock enable during Sleep mode
        SRAM1LPEN: u1 = 0x1,
        /// SRAM 2 interface clock enable during Sleep mode
        SRAM2LPEN: u1 = 0x1,
        /// Backup SRAM interface clock enable during Sleep mode
        BKPSRAMLPEN: u1 = 0x1,
        reserved21: u2 = 0,
        /// DMA1 clock enable during Sleep mode
        DMA1LPEN: u1 = 0x1,
        /// DMA2 clock enable during Sleep mode
        DMA2LPEN: u1 = 0x1,
        reserved29: u6 = 0,
        /// USB OTG HS clock enable during Sleep mode
        OTGHSLPEN: u1 = 0x1,
        /// USB OTG HS ULPI clock enable during Sleep mode
        OTGHSULPILPEN: u1 = 0x1,
        padding: u1 = 0,
    }),
    /// AHB2 peripheral clock enable in low power mode register
    /// offset: 0x54
    AHB2LPENR: mmio.Mmio(packed struct(u32) {
        /// Camera interface enable during Sleep mode
        DCMILPEN: u1 = 0x1,
        reserved7: u6 = 0,
        /// USB OTG FS clock enable during Sleep mode
        OTGFSLPEN: u1 = 0x1,
        padding: u24 = 0,
    }),
    /// AHB3 peripheral clock enable in low power mode register
    /// offset: 0x58
    AHB3LPENR: mmio.Mmio(packed struct(u32) {
        /// Flexible memory controller module clock enable during Sleep mode
        FMCLPEN: u1 = 0x1,
        /// QUADSPI memory controller module clock enable during Sleep mode
        QSPILPEN: u1 = 0x0,
        padding: u30 = 0,
    }),
    /// offset: 0x5c
    reserved92: [4]u8,
    /// APB1 peripheral clock enable in low power mode register
    /// offset: 0x60
    APB1LPENR: mmio.Mmio(packed struct(u32) {
        /// TIM2 clock enable during Sleep mode
        TIM2LPEN: u1 = 0x1,
        /// TIM3 clock enable during Sleep mode
        TIM3LPEN: u1 = 0x1,
        /// TIM4 clock enable during Sleep mode
        TIM4LPEN: u1 = 0x1,
        /// TIM5 clock enable during Sleep mode
        TIM5LPEN: u1 = 0x1,
        /// TIM6 clock enable during Sleep mode
        TIM6LPEN: u1 = 0x1,
        /// TIM7 clock enable during Sleep mode
        TIM7LPEN: u1 = 0x1,
        /// TIM12 clock enable during Sleep mode
        TIM12LPEN: u1 = 0x1,
        /// TIM13 clock enable during Sleep mode
        TIM13LPEN: u1 = 0x1,
        /// TIM14 clock enable during Sleep mode
        TIM14LPEN: u1 = 0x1,
        reserved11: u2 = 0,
        /// Window watchdog clock enable during Sleep mode
        WWDGLPEN: u1 = 0x1,
        reserved14: u2 = 0,
        /// SPI2 clock enable during Sleep mode
        SPI2LPEN: u1 = 0x1,
        /// SPI3 clock enable during Sleep mode
        SPI3LPEN: u1 = 0x1,
        /// SPDIF clock enable during Sleep mode
        SPDIFLPEN: u1 = 0x0,
        /// USART2 clock enable during Sleep mode
        USART2LPEN: u1 = 0x1,
        /// USART3 clock enable during Sleep mode
        USART3LPEN: u1 = 0x1,
        /// UART4 clock enable during Sleep mode
        UART4LPEN: u1 = 0x1,
        /// UART5 clock enable during Sleep mode
        UART5LPEN: u1 = 0x1,
        /// I2C1 clock enable during Sleep mode
        I2C1LPEN: u1 = 0x1,
        /// I2C2 clock enable during Sleep mode
        I2C2LPEN: u1 = 0x1,
        /// I2C3 clock enable during Sleep mode
        I2C3LPEN: u1 = 0x1,
        /// I2CFMP1 clock enable during Sleep mode
        I2CFMP1LPEN: u1 = 0x0,
        /// CAN 1 clock enable during Sleep mode
        CAN1LPEN: u1 = 0x1,
        /// CAN 2 clock enable during Sleep mode
        CAN2LPEN: u1 = 0x1,
        /// CEC clock enable during Sleep mode
        CECLPEN: u1 = 0x0,
        /// Power interface clock enable during Sleep mode
        PWRLPEN: u1 = 0x1,
        /// DAC interface clock enable during Sleep mode
        DACLPEN: u1 = 0x1,
        padding: u2 = 0,
    }),
    /// APB2 peripheral clock enabled in low power mode register
    /// offset: 0x64
    APB2LPENR: mmio.Mmio(packed struct(u32) {
        /// TIM1 clock enable during Sleep mode
        TIM1LPEN: u1 = 0x1,
        /// TIM8 clock enable during Sleep mode
        TIM8LPEN: u1 = 0x1,
        reserved4: u2 = 0,
        /// USART1 clock enable during Sleep mode
        USART1LPEN: u1 = 0x1,
        /// USART6 clock enable during Sleep mode
        USART6LPEN: u1 = 0x1,
        reserved8: u2 = 0,
        /// ADC1 clock enable during Sleep mode
        ADC1LPEN: u1 = 0x1,
        /// ADC2 clock enable during Sleep mode
        ADC2LPEN: u1 = 0x1,
        /// ADC 3 clock enable during Sleep mode
        ADC3LPEN: u1 = 0x1,
        /// SDIO clock enable during Sleep mode
        SDIOLPEN: u1 = 0x1,
        /// SPI 1 clock enable during Sleep mode
        SPI1LPEN: u1 = 0x1,
        /// SPI 4 clock enable during Sleep mode
        SPI4LPEN: u1 = 0x0,
        /// System configuration controller clock enable during Sleep mode
        SYSCFGLPEN: u1 = 0x1,
        reserved16: u1 = 0,
        /// TIM9 clock enable during sleep mode
        TIM9LPEN: u1 = 0x1,
        /// TIM10 clock enable during Sleep mode
        TIM10LPEN: u1 = 0x1,
        /// TIM11 clock enable during Sleep mode
        TIM11LPEN: u1 = 0x1,
        reserved22: u3 = 0,
        /// SAI1 clock enable
        SAI1LPEN: u1 = 0x0,
        /// SAI2 clock enable
        SAI2LPEN: u1 = 0x0,
        padding: u8 = 0,
    }),
    /// offset: 0x68
    reserved104: [8]u8,
    /// Backup domain control register
    /// offset: 0x70
    BDCR: mmio.Mmio(packed struct(u32) {
        /// External low-speed oscillator enable
        LSEON: u1 = 0x0,
        /// External low-speed oscillator ready
        LSERDY: u1 = 0x0,
        /// External low-speed oscillator bypass
        LSEBYP: u1 = 0x0,
        /// External low-speed oscillator mode
        LSEMOD: u1 = 0x0,
        reserved8: u4 = 0,
        /// RTC clock source selection
        RTCSEL: u2 = 0x0,
        reserved15: u5 = 0,
        /// RTC clock enable
        RTCEN: u1 = 0x0,
        /// Backup domain software reset
        BDRST: u1 = 0x0,
        padding: u15 = 0,
    }),
    /// clock control & status register
    /// offset: 0x74
    CSR: mmio.Mmio(packed struct(u32) {
        /// Internal low-speed oscillator enable
        LSION: u1 = 0x0,
        /// Internal low-speed oscillator ready
        LSIRDY: u1 = 0x0,
        reserved24: u22 = 0,
        /// Remove reset flag
        RMVF: u1 = 0x0,
        /// BOR reset flag
        BORRSTF: u1 = 0x1,
        /// PIN reset flag
        PADRSTF: u1 = 0x1,
        /// POR/PDR reset flag
        PORRSTF: u1 = 0x1,
        /// Software reset flag
        SFTRSTF: u1 = 0x0,
        /// Independent watchdog reset flag
        WDGRSTF: u1 = 0x0,
        /// Window watchdog reset flag
        WWDGRSTF: u1 = 0x0,
        /// Low-power reset flag
        LPWRRSTF: u1 = 0x0,
    }),
    /// offset: 0x78
    reserved120: [8]u8,
    /// spread spectrum clock generation register
    /// offset: 0x80
    SSCGR: mmio.Mmio(packed struct(u32) {
        /// Modulation period
        MODPER: u13 = 0x0,
        /// Incrementation step
        INCSTEP: u15 = 0x0,
        reserved30: u2 = 0,
        /// Spread Select
        SPREADSEL: u1 = 0x0,
        /// Spread spectrum modulation enable
        SSCGEN: u1 = 0x0,
    }),
    /// PLLI2S configuration register
    /// offset: 0x84
    PLLI2SCFGR: mmio.Mmio(packed struct(u32) {
        /// Division factor for audio PLL (PLLI2S) input clock
        PLLI2SM: u6 = 0x0,
        /// PLLI2S multiplication factor for VCO
        PLLI2SN: u9 = 0xC0,
        reserved16: u1 = 0,
        /// PLLI2S division factor for SPDIF-IN clock
        PLLI2SP: u2 = 0x0,
        reserved24: u6 = 0,
        /// PLLI2S division factor for SAI1 clock
        PLLI2SQ: u4 = 0x0,
        /// PLLI2S division factor for I2S clocks
        PLLI2SR: u3 = 0x2,
        padding: u1 = 0,
    }),
    /// PLL configuration register
    /// offset: 0x88
    PLLSAICFGR: mmio.Mmio(packed struct(u32) {
        /// Division factor for audio PLLSAI input clock
        PLLSAIM: u6 = 0x0,
        /// PLLSAI division factor for VCO
        PLLSAIN: u9 = 0xC0,
        reserved16: u1 = 0,
        /// PLLSAI division factor for 48 MHz clock
        PLLSAIP: u2 = 0x0,
        reserved24: u6 = 0,
        /// PLLSAI division factor for SAIs clock
        PLLSAIQ: u4 = 0x4,
        padding: u4 = 0,
    }),
    /// Dedicated Clock Configuration Register
    /// offset: 0x8c
    DCKCFGR: mmio.Mmio(packed struct(u32) {
        /// PLLI2S division factor for SAIs clock
        PLLI2SDIVQ: u5 = 0x0,
        reserved8: u3 = 0,
        /// PLLSAI division factor for SAIs clock
        PLLSAIDIVQ: u5 = 0x0,
        reserved20: u7 = 0,
        /// SAI1 clock source selection
        SAI1SRC: u2 = 0x0,
        /// SAI2 clock source selection
        SAI2SRC: u2 = 0x0,
        /// Timers clocks prescalers selection
        TIMPRE: u1 = 0x0,
        /// I2S APB1 clock source selection
        I2S1SRC: u2 = 0x0,
        /// I2S APB2 clock source selection
        I2S2SRC: u2 = 0x0,
        padding: u3 = 0,
    }),
    /// clocks gated enable register
    /// offset: 0x90
    CKGATENR: mmio.Mmio(packed struct(u32) {
        /// AHB to APB1 Bridge clock enable
        AHB2APB1_CKEN: u1 = 0x0,
        /// AHB to APB2 Bridge clock enable
        AHB2APB2_CKEN: u1 = 0x0,
        /// Cortex M4 ETM clock enable
        CM4DBG_CKEN: u1 = 0x0,
        /// Spare clock enable
        SPARE_CKEN: u1 = 0x0,
        /// SRQAM controller clock enable
        SRAM_CKEN: u1 = 0x0,
        /// Flash Interface clock enable
        FLITF_CKEN: u1 = 0x0,
        /// RCC clock enable
        RCC_CKEN: u1 = 0x0,
        padding: u25 = 0,
    }),
    /// dedicated clocks configuration register 2
    /// offset: 0x94
    DCKCFGR2: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// I2C4 kernel clock source selection
        FMPI2C1SEL: u2 = 0x0,
        reserved26: u2 = 0,
        /// HDMI CEC clock source selection
        CECSEL: u1 = 0x0,
        /// SDIO/USBFS/HS clock selection
        CK48MSEL: u1 = 0x0,
        /// SDIO clock selection
        SDIOSEL: u1 = 0x0,
        /// SPDIF clock selection
        SPDIFSEL: u1 = 0x0,
        padding: u2 = 0,
    }),
};
