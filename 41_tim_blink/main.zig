// buid and flash program:
// zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt
// openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"

const regs = @import("registers.zig");

pub export fn _start() void {
    // Enable clock access to GPIOA
    regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOA;

    // set PA5 as output
    regs.GPIOA.MODER |=  regs.GPIO_MODER_PORT5_0;  // bit 10 to 1
    regs.GPIOA.MODER &= ~regs.GPIO_MODER_PORT5_1;  // bit 11 to 0
    

    // Enable clock access to TIM2
    regs.RCC.APB1ENR |= regs.RCC_APB1ENR_TIM2;

    // Prescaler value
    regs.TIM2.PSC = 1600 - 1; // 16 MHz clock / 16 K PSC = 10 K

    // Auto reloat register value
    regs.TIM2.ARR = 10000 - 1; // 10 K ARR / 10 K PSC = 1 sec

    // clear timer counter
    const timer_counter = 0; 
    regs.TIM2.CNT = timer_counter;

    // enable counter
    regs.TIM2.CR1 = regs.TIM_CR1_CEN;

    while (true) {
        // check if update interrupt flag is 1
        while((regs.TIM2.SR & regs.TIM_CR1_UIF) != regs.TIM_CR1_UIF) {}

        // reset interrupt flag
        regs.TIM2.SR &= ~regs.TIM_CR1_UIF;

        // toggle LED
        regs.GPIOA.ODR ^= regs.GPIO_ODR_PORT5;
    }
}
