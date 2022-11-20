// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const regs = @import("registers.zig");

pub export fn _start() void {
    // Enable clock access to GPIOA
    regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOA;

    // set PA5 as alternate function [11:10] [1:0]
    regs.GPIOA.MODER &= ~regs.GPIO_MODER_PORT5_0;  // bit 10 to 0
    regs.GPIOA.MODER |=  regs.GPIO_MODER_PORT5_1;  // bit 11 to 1
    
    // select alterne function AF1 for PA5 [0001]
    regs.GPIOA.AFR0 |=  regs.GPIO_AFR_PORT5_0;
    regs.GPIOA.AFR0 &= ~regs.GPIO_AFR_PORT5_1;
    regs.GPIOA.AFR0 &= ~regs.GPIO_AFR_PORT5_2;
    regs.GPIOA.AFR0 &= ~regs.GPIO_AFR_PORT5_3;


    // Enable clock access to TIM2
    regs.RCC.APB1ENR |= regs.RCC_APB1ENR_TIM2;

    // Prescaler value
    regs.TIM2.PSC = 1600 - 1; // 16 MHz clock / 16 K PSC = 10 K

    // Auto reloat register value
    regs.TIM2.ARR = 1000 - 1; // 1 K ARR / 10 K PSC = 0.1 sec

    // output compare toggle mode
    regs.TIM2.CCMR1 |=  regs.TIM_CCMR1_OC1M_0;
    regs.TIM2.CCMR1 |=  regs.TIM_CCMR1_OC1M_1;
    regs.TIM2.CCMR1 &= ~regs.TIM_CCMR1_OC1M_2;

    // enable TIM2 CH1 in compare mode
    regs.TIM2.CCER |= regs.TIM_CCER_CC1E;

    // clear timer counter
    const timer_counter = 0; 
    regs.TIM2.CNT = timer_counter;

    // enable counter
    regs.TIM2.CR1 = regs.TIM_CR1_CEN;

    while (true) {}
}
