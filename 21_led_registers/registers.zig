
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
    MODER: packed struct {
        MODER0: u8,
        MODER1: u8,
        MODER2: u8,
        MODER3: u8,
    },
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

const GPIOA_BASE: u32 = 0x40020000;
const RCC_BASE:   u32 = 0x40023800;

pub const GPIOA: *volatile GPIO_type = @ptrFromInt(GPIOA_BASE);
pub const RCC: *volatile RCC_type = @ptrFromInt(RCC_BASE);
