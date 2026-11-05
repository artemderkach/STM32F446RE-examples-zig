//! STEP pulse train for a stepper driver: TIM2_CH1 -> PA5 (AF1).
//! Timer kernel clock = 16 MHz (default HSI, no PLL, APB1 prescaler 1).

const p = @import("mmio").peripherals;

const TIMER_CLK_HZ: u32 = 16_000_000;
const PSC: u32 = 15; // 16 MHz / 16 = 1 MHz tick
const TICK_HZ: u32 = TIMER_CLK_HZ / (PSC + 1);

/// Step rate (pulses per second). Change this to change motor speed.
const STEP_HZ: u32 = 1000;
/// Duty in percent. Most drivers only need a pulse of a few microseconds.
const DUTY_PERCENT: u32 = 50;

const ARR: u32 = TICK_HZ / STEP_HZ - 1;
const CCR: u32 = (ARR + 1) * DUTY_PERCENT / 100;

fn pwmInit() void {
    p.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    p.RCC.APB1ENR.modify(.{ .TIM2EN = 1 });

    // PA5 -> alternate function, AF1 (TIM2_CH1)
    p.GPIOA.MODER.modify(.{ .MODER5 = 0b10 });
    p.GPIOA.OSPEEDR.modify(.{ .OSPEEDR5 = 0b10 });
    p.GPIOA.AFRL.modify(.{ .AFRL5 = 1 });

    p.TIM2.PSC.modify(.{ .PSC = PSC });
    // TIM2 is 32-bit; the SVD splits ARR and CCR1 into low/high 16-bit halves.
    p.TIM2.ARR.modify(.{ .ARR_L = @as(u16, @truncate(ARR)), .ARR_H = @as(u16, @truncate(ARR >> 16)) });
    p.TIM2.CCR1.modify(.{ .CCR1_L = @as(u16, @truncate(CCR)), .CCR1_H = @as(u16, @truncate(CCR >> 16)) });

    // PWM mode 1 with CCR1 preload, output enabled
    p.TIM2.CCMR1_Output.modify(.{ .CC1S = 0b00, .OC1M = 0b110, .OC1PE = 1 });
    p.TIM2.CCER.modify(.{ .CC1P = 0, .CC1E = 1 });

    // Load PSC/ARR/CCR1 into active registers, then start
    p.TIM2.CR1.modify(.{ .ARPE = 1 });
    p.TIM2.EGR.modify(.{ .UG = 1 });
    p.TIM2.CR1.modify(.{ .CEN = 1 });
}

export fn _start() noreturn {
    pwmInit();
    while (true) asm volatile ("wfi");
}
