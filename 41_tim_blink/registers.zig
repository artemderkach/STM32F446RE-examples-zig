
const RCC_type = packed struct {
    CR:         u32,    // RCC clock control register,                                  Address offset: 0x00
    PLLCFGR:    u32,    // RCC PLL configuration register,                              Address offset: 0x04
    CFGR:       u32,    // RCC clock configuration register,                            Address offset: 0x08
    CIR:        u32,    // RCC clock interrupt register,                                Address offset: 0x0C
    AHB1RSTR:   u32,    // RCC AHB1 peripheral reset register,                          Address offset: 0x10
    AHB2RSTR:   u32,    // RCC AHB2 peripheral reset register,                          Address offset: 0x14
    AHB3RSTR:   u32,    // RCC AHB3 peripheral reset register,                          Address offset: 0x18
    RESERVED0:  u32,    // Reserved,                                                    Address offset: 0x1C
    APB1RSTR:   u32,    // RCC APB1 peripheral reset register,                          Address offset: 0x20
    APB2RSTR:   u32,    // RCC APB2 peripheral reset register,                          Address offset: 0x24
    RESERVED1:  u32,    // Reserved,                                                    Address offset: 0x28
    RESERVED2:  u32,    // Reserved,                                                    Address offset: 0x2C
    AHB1ENR:    u32,    // RCC AHB1 peripheral clock register,                          Address offset: 0x30
    AHB2ENR:    u32,    // RCC AHB2 peripheral clock register,                          Address offset: 0x34
    AHB3ENR:    u32,    // RCC AHB3 peripheral clock register,                          Address offset: 0x38
    RESERVED3:  u32,    // Reserved,                                                    Address offset: 0x3C
    APB1ENR:    u32,    // RCC APB1 peripheral clock enable register,                   Address offset: 0x40
    APB2ENR:    u32,    // RCC APB2 peripheral clock enable register,                   Address offset: 0x44
    RESERVED4:  u32,    // Reserved,                                                    Address offset: 0x48
    RESERVED5:  u32,    // Reserved,                                                    Address offset: 0x4C
    AHB1LPENR:  u32,    // RCC AHB1 peripheral clock enable in low power mode register, Address offset: 0x50
    AHB2LPENR:  u32,    // RCC AHB2 peripheral clock enable in low power mode register, Address offset: 0x54
    AHB3LPENR:  u32,    // RCC AHB3 peripheral clock enable in low power mode register, Address offset: 0x58
    RESERVED6:  u32,    // Reserved,                                                    Address offset: 0x5C
    APB1LPENR:  u32,    // RCC APB1 peripheral clock enable in low power mode register, Address offset: 0x60
    APB2LPENR:  u32,    // RCC APB2 peripheral clock enable in low power mode register, Address offset: 0x64
    RESERVED7:  u32,    // Reserved,                                                    Address offset: 0x68
    RESERVED8:  u32,    // Reserved,                                                    Address offset: 0x6C
    BDCR:       u32,    // RCC Backup domain control register,                          Address offset: 0x70
    CSR:        u32,    // RCC clock control & status register,                         Address offset: 0x74
    RESERVED9:  u32,    // Reserved,                                                    Address offset: 0x78
    RESERVED10: u32,    // Reserved,                                                    Address offset: 0x7C
    SSCGR:      u32,    // RCC spread spectrum clock generation register,               Address offset: 0x80
    PLLI2SCFGR: u32,    // RCC PLLI2S configuration register,                           Address offset: 0x84
    PLLSAICFGR: u32,    // RCC PLLSAI configuration register,                           Address offset: 0x88
    DCKCFGR:    u32,    // RCC Dedicated Clocks configuration register,                 Address offset: 0x8C
    CKGATENR:   u32,    // RCC Clocks Gated ENable Register,                            Address offset: 0x90
    DCKCFGR2:   u32,    // RCC Dedicated Clocks configuration register 2,               Address offset: 0x94
};

const GPIO_type = packed struct {
    MODER:      u32,    // GPIO port mode register,                 Address offset: 0x00
    OTYPER:     u32,    // GPIO port output type register,          Address offset: 0x04
    OSPEEDR:    u32,    // GPIO port output speed register,         Address offset: 0x08
    PUPDR:      u32,    // GPIO port pull-up/pull-down register,    Address offset: 0x0C
    IDR:        u32,    // GPIO port input data register,           Address offset: 0x10
    ODR:        u32,    // GPIO port output data register,          Address offset: 0x14
    BSRR:       u32,    // GPIO port bit set/reset register,        Address offset: 0x18
    LCKR:       u32,    // GPIO port configuration lock register,   Address offset: 0x1C
    AFR0:       u32,    // GPIO alternate function register,        Address offset: 0x20
    AFR1:       u32,    // GPIO alternate function register,        Address offset: 0x24
};

const USART_type = packed struct {
    SR:     u32,    // USART Status register,                   Address offset: 0x00
    DR:     u32,    // USART Data register,                     Address offset: 0x04
    BRR:    u32,    // USART Baud rate register,                Address offset: 0x08
    CR1:    u32,    // USART Control register 1,                Address offset: 0x0C
    CR2:    u32,    // USART Control register 2,                Address offset: 0x10
    CR3:    u32,    // USART Control register 3,                Address offset: 0x14
    GTPR:   u32,    // USART Guard time and prescaler register, Address offset: 0x18
};

const TIM_type = packed struct {
    CR1:    u32,    // TIM control register 1,              Address offset: 0x00
    CR2:    u32,    // TIM control register 2,              Address offset: 0x04
    SMCR:   u32,    // TIM slave mode control register,     Address offset: 0x08
    DIER:   u32,    // TIM DMA/interrupt enable register,   Address offset: 0x0C
    SR:     u32,    // TIM status register,                 Address offset: 0x10
    EGR:    u32,    // TIM event generation register,       Address offset: 0x14
    CCMR1:  u32,    // TIM capture/compare mode register 1, Address offset: 0x18
    CCMR2:  u32,    // TIM capture/compare mode register 2, Address offset: 0x1C
    CCER:   u32,    // TIM capture/compare enable register, Address offset: 0x20
    CNT:    u32,    // TIM counter register,                Address offset: 0x24
    PSC:    u32,    // TIM prescaler,                       Address offset: 0x28
    ARR:    u32,    // TIM auto-reload register,            Address offset: 0x2C
    RCR:    u32,    // TIM repetition counter register,     Address offset: 0x30
    CCR1:   u32,    // TIM capture/compare register 1,      Address offset: 0x34
    CCR2:   u32,    // TIM capture/compare register 2,      Address offset: 0x38
    CCR3:   u32,    // TIM capture/compare register 3,      Address offset: 0x3C
    CCR4:   u32,    // TIM capture/compare register 4,      Address offset: 0x40
    BDTR:   u32,    // TIM break and dead-time register,    Address offset: 0x44
    DCR:    u32,    // TIM DMA control register,            Address offset: 0x48
    DMAR:   u32,    // TIM DMA address for full transfer,   Address offset: 0x4C
    OR:     u32,    // TIM option register,                 Address offset: 0x50
};

const TIM2_BASE:    u32 = 0x40000000;
const TIM4_BASE:    u32 = 0x40000800;
const GPIOA_BASE:   u32 = 0x40020000;
const GPIOB_BASE:   u32 = 0x40020400;
const RCC_BASE:     u32 = 0x40023800;
const USART2_BASE:  u32 = 0x40004400;


pub const TIM2      = @intToPtr(*volatile TIM_type,     TIM2_BASE);
pub const TIM4      = @intToPtr(*volatile TIM_type,     TIM4_BASE);
pub const GPIOA     = @intToPtr(*volatile GPIO_type,    GPIOA_BASE);
pub const GPIOB     = @intToPtr(*volatile GPIO_type,    GPIOB_BASE);
pub const RCC       = @intToPtr(*volatile RCC_type,     RCC_BASE);
pub const USART2    = @intToPtr(*volatile USART_type,   USART2_BASE);


pub const RCC_AHB1ENR_GPIOA     = @as(u32, 1 << 0);
pub const RCC_AHB1ENR_GPIOB     = @as(u32, 1 << 1);
pub const RCC_AHB1ENR_GPIOC     = @as(u32, 1 << 2);
pub const RCC_AHB1ENR_GPIOD     = @as(u32, 1 << 3);
pub const RCC_AHB1ENR_GPIOE     = @as(u32, 1 << 4);
pub const RCC_AHB1ENR_GPIOF     = @as(u32, 1 << 5);
pub const RCC_AHB1ENR_GPIOG     = @as(u32, 1 << 6);
pub const RCC_AHB1ENR_GPIOH     = @as(u32, 1 << 7);
pub const RCC_AHB1ENR_CRC       = @as(u32, 1 << 12);
pub const RCC_AHB1ENR_BKPSRAM   = @as(u32, 1 << 18);
pub const RCC_AHB1ENR_DMA1      = @as(u32, 1 << 21);
pub const RCC_AHB1ENR_DMA2      = @as(u32, 1 << 22);
pub const RCC_AHB1ENR_OTGHS     = @as(u32, 1 << 29);
pub const RCC_AHB1ENR_OTGHSULPI = @as(u32, 1 << 30);

pub const RCC_APB1ENR_TIM2      = @as(u32, 1 << 0);
pub const RCC_APB1ENR_TIM3      = @as(u32, 1 << 1);
pub const RCC_APB1ENR_TIM4      = @as(u32, 1 << 2);
pub const RCC_APB1ENR_TIM5      = @as(u32, 1 << 3);
pub const RCC_APB1ENR_TIM6      = @as(u32, 1 << 4);
pub const RCC_APB1ENR_TIM7      = @as(u32, 1 << 5);
pub const RCC_APB1ENR_TIM12     = @as(u32, 1 << 6);
pub const RCC_APB1ENR_TIM13     = @as(u32, 1 << 7);
pub const RCC_APB1ENR_TIM14     = @as(u32, 1 << 8);
pub const RCC_APB1ENR_WWDG      = @as(u32, 1 << 11);
pub const RCC_APB1ENR_SPI2      = @as(u32, 1 << 14);
pub const RCC_APB1ENR_SPI3      = @as(u32, 1 << 15);
pub const RCC_APB1ENR_SPDIFRX   = @as(u32, 1 << 16);
pub const RCC_APB1ENR_USART2    = @as(u32, 1 << 17);
pub const RCC_APB1ENR_USART3    = @as(u32, 1 << 18);
pub const RCC_APB1ENR_UART4     = @as(u32, 1 << 19);
pub const RCC_APB1ENR_UART5     = @as(u32, 1 << 20);
pub const RCC_APB1ENR_I2C1      = @as(u32, 1 << 21);
pub const RCC_APB1ENR_I2C2      = @as(u32, 1 << 22);
pub const RCC_APB1ENR_I2C3      = @as(u32, 1 << 23);
pub const RCC_APB1ENR_FMPI2C1   = @as(u32, 1 << 24);
pub const RCC_APB1ENR_CAN1      = @as(u32, 1 << 25);
pub const RCC_APB1ENR_CAN2      = @as(u32, 1 << 26);
pub const RCC_APB1ENR_CEC       = @as(u32, 1 << 27);
pub const RCC_APB1ENR_PWR       = @as(u32, 1 << 28);
pub const RCC_APB1ENR_DAC       = @as(u32, 1 << 29);

pub const GPIO_MODER_PORT0_0    = @as(u32, 1 << 0);
pub const GPIO_MODER_PORT0_1    = @as(u32, 1 << 1);
pub const GPIO_MODER_PORT1_0    = @as(u32, 1 << 2);
pub const GPIO_MODER_PORT1_1    = @as(u32, 1 << 3);
pub const GPIO_MODER_PORT2_0    = @as(u32, 1 << 4);
pub const GPIO_MODER_PORT2_1    = @as(u32, 1 << 5);
pub const GPIO_MODER_PORT3_0    = @as(u32, 1 << 6);
pub const GPIO_MODER_PORT3_1    = @as(u32, 1 << 7);
pub const GPIO_MODER_PORT4_0    = @as(u32, 1 << 8);
pub const GPIO_MODER_PORT4_1    = @as(u32, 1 << 9);
pub const GPIO_MODER_PORT5_0    = @as(u32, 1 << 10);
pub const GPIO_MODER_PORT5_1    = @as(u32, 1 << 11);
pub const GPIO_MODER_PORT6_0    = @as(u32, 1 << 12);
pub const GPIO_MODER_PORT6_1    = @as(u32, 1 << 13);
pub const GPIO_MODER_PORT7_0    = @as(u32, 1 << 14);
pub const GPIO_MODER_PORT7_1    = @as(u32, 1 << 15);
pub const GPIO_MODER_PORT8_0    = @as(u32, 1 << 16);
pub const GPIO_MODER_PORT8_1    = @as(u32, 1 << 17);
pub const GPIO_MODER_PORT9_0    = @as(u32, 1 << 18);
pub const GPIO_MODER_PORT9_1    = @as(u32, 1 << 19);
pub const GPIO_MODER_PORT10_0   = @as(u32, 1 << 20);
pub const GPIO_MODER_PORT10_1   = @as(u32, 1 << 21);
pub const GPIO_MODER_PORT11_0   = @as(u32, 1 << 22);
pub const GPIO_MODER_PORT11_1   = @as(u32, 1 << 23);
pub const GPIO_MODER_PORT12_0   = @as(u32, 1 << 24);
pub const GPIO_MODER_PORT12_1   = @as(u32, 1 << 25);
pub const GPIO_MODER_PORT13_0   = @as(u32, 1 << 26);
pub const GPIO_MODER_PORT13_1   = @as(u32, 1 << 27);
pub const GPIO_MODER_PORT14_0   = @as(u32, 1 << 28);
pub const GPIO_MODER_PORT14_1   = @as(u32, 1 << 29);
pub const GPIO_MODER_PORT15_0   = @as(u32, 1 << 30);
pub const GPIO_MODER_PORT15_1   = @as(u32, 1 << 31);

pub const GPIO_ODR_PORT0        = @as(u32, 1 << 0);
pub const GPIO_ODR_PORT1        = @as(u32, 1 << 1);
pub const GPIO_ODR_PORT2        = @as(u32, 1 << 2);
pub const GPIO_ODR_PORT3        = @as(u32, 1 << 3);
pub const GPIO_ODR_PORT4        = @as(u32, 1 << 4);
pub const GPIO_ODR_PORT5        = @as(u32, 1 << 5);
pub const GPIO_ODR_PORT6        = @as(u32, 1 << 6);
pub const GPIO_ODR_PORT7        = @as(u32, 1 << 7);
pub const GPIO_ODR_PORT8        = @as(u32, 1 << 8);
pub const GPIO_ODR_PORT9        = @as(u32, 1 << 9);
pub const GPIO_ODR_PORT10       = @as(u32, 1 << 10);
pub const GPIO_ODR_PORT11       = @as(u32, 1 << 11);
pub const GPIO_ODR_PORT12       = @as(u32, 1 << 12);
pub const GPIO_ODR_PORT13       = @as(u32, 1 << 13);
pub const GPIO_ODR_PORT14       = @as(u32, 1 << 14);
pub const GPIO_ODR_PORT15       = @as(u32, 1 << 15);

pub const TIM_CR1_CEN           = @as(u32, 1 << 0);
pub const TIM_CR1_UDIS          = @as(u32, 1 << 1);
pub const TIM_CR1_URS           = @as(u32, 1 << 2);
pub const TIM_CR1_OPM           = @as(u32, 1 << 3);
pub const TIM_CR1_DIR           = @as(u32, 1 << 4);
pub const TIM_CR1_CMS_0         = @as(u32, 1 << 5);
pub const TIM_CR1_CMS_1         = @as(u32, 1 << 6);
pub const TIM_CR1_ARPE          = @as(u32, 1 << 7);
pub const TIM_CR1_CKD_0         = @as(u32, 1 << 8);
pub const TIM_CR1_CKD_1         = @as(u32, 1 << 9);

pub const TIM_CR1_UIF           = @as(u32, 1 << 0);
pub const TIM_CR1_CCIF          = @as(u32, 1 << 1);
pub const TIM_CR1_CC2F          = @as(u32, 1 << 2);
pub const TIM_CR1_CC3F          = @as(u32, 1 << 3);
pub const TIM_CR1_CC4F          = @as(u32, 1 << 4);
pub const TIM_CR1_TIF           = @as(u32, 1 << 6);
pub const TIM_CR1_CCIOF         = @as(u32, 1 << 9);
pub const TIM_CR1_CC2OF         = @as(u32, 1 << 10);
pub const TIM_CR1_CC3OF         = @as(u32, 1 << 11);
pub const TIM_CR1_CC4OF         = @as(u32, 1 << 12);
