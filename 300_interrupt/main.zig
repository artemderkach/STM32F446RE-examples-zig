const periph = @import("mm").peripherals;

pub export fn _start() void {

    // Enable clock access
    periph.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    //
    // set PA5 as output
    periph.GPIOA.MODER.modify(.{ .MODER5 = 0b01 });
    //
    // Enable clock access to TIM2
    periph.RCC.APB1ENR.modify(.{ .TIM2EN = 1});
    // Prescaler value
    periph.TIM2.PSC.modify(.{.PSC = 1600}); // 16 MHz clock / 16 K PSC = 10 K

    // Auto reloat register value
    periph.TIM2.ARR.write_raw(10_000); // 10 K ARR / 10 K PSC = 1 sec

    periph.TIM2.DIER.modify(.{.UIE = 1});

    // enable counter
    periph.TIM2.CR1.modify(.{.CEN = 1});
    //
    periph.NVIC.ISER0.modify(.{.SETENA = 1<<28});

    while (true) {
    }
}

pub export fn TIM2_IRQHandler() void {
    if (periph.TIM2.SR.read().UIF == 1) {
        periph.TIM2.SR.modify(.{.UIF = 0});
        periph.GPIOA.ODR.toggle(.{.ODR5 = 1});
    }
}

