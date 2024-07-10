The purpose of this exercise is to explore both the world of embedded development and zig programming language.
I choose the bottom-up approach, this way exercises will be incrementally more complicated.
Each exercise will contain information i discovered during it's implementation and problems i faced.

## Tips
- `arm-none-eabi-objdump -D main.elf > objdump` OR `llvm-objdump-15 -D main.elf > objdump`
- `openocd -f board/st_nucleo_f4.cfg` to connect to board
- `lldb-15 zig-out/bin/main.elf` to start lldb with selected executable
- `(lldb) gdb-remote localhost:3333` to connect to remote board

# STM32F446RE
- [001_asm_led_minimal](#001_asm_led_minimal)
- [002_asm_blink](#002_asm_blink)
- [003_asm_led_button](#003_asm_led_button)
- [004_asm_blink_button](#004_asm_blink_button)
- [011_led_minimal](#011_led_minimal)
- [012_blinky_minimal](#011_blinky_minimal)
- [021_led_registers](#021_led_registers)
- [022_led_library](#022_led_library)
- [023_blink](#023_blink)
- [031_usart](#031_usart)
- [032_usart_writer](#032_usart_writer)
- [041_adc](#041_adc)
- [042_adc_fraction](#042_adc_fraction)
- [051_tim_blink](#051_tim_blink)
- [052_tim_output](#052_tim_output)
- [100_regs_blink](#100_regs_blink)
- [101_regs_usart](#101_regs_usart)
- [200_build_blinky](#200_build_blinky)
- [201_build_openocd](#201_build_openocd)
- [202_build_lib](#202_build_lib)
<br>

## 001_asm_led_minimal
A good place to start is to implement the minimal possible program.
It will use assembly, to begin with the simplest language. Plus assembly still will be used for startup files in future.
At this point i will also try to remove any unused sections, flags etc. They will be added in future examples if needed.

Files used:
- `main.s` - contains both vector table and code to blink LED
- `linker.ld` - linker script file  

Before using build system, program will be built with command line call  
`zig build-exe main.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf --verbose-link --verbose-cc -fstrip -fno-compiler-rt`.  
`-target` and `-mcpu` to define where code will be flashed  
`--verbose-link` and `--verbose-cc` to view the compiler  and linker flags (`--verbose-cc` will not produce any output if compilation is cached) :
```
zig clang -fno-caret-diagnostics -target thumb-unknown-unknown-unknown -mcpu=cortex-m4 -ffreestanding -c -o main.o main.s
ld.lld -error-limit=0 --lto-O3 -O3 -z stack-size=16777216 -T linker.ld --gc-sections -m armelf_linux_eabi -Bstatic -o main.elf main.o libc.a --as-needed --allow-shlib-undefined
```
both of verbose params will be omitted in future examples  
`-fstrip` to omit debug info in elf file  
`-fno-compiler-rt` to remove lazy loaded `compiler-rt.a`  

`openocd -f board/st_nucleo_f4.cfg -c "program build/main.elf verify reset exit"` to flash on device

### Problems during implementation
1. `_start` section disappeared  
When disassembling the `elf` file by `llvm-objdump -D main.elf` `.text` section were missing from disassembly.
Due to optimization, compiler removed code from `main.s` file, to solve this problem `KEEP()` keyword need to be added
to prevent from optimizing this part, so we have `KEEP(*(.text))` in linker script. This caught me off guard because 
`gcc` wasn't making such optimization, probably due to different flags provided to linker.
2. `+1` address offset  
Cortex M got this weird thing when it uses `thumb` instruction set, the reference to label should be one bit higher than
the actual address. Simple way to do it is to add actual `+1` to assembly code e.g. `.word _start +1`.
To take more systematic approach `.thumb_func` label should be added to called function instead of `+1`:
```
.thumb_func
_start:
``` 
3. `_start` not exposed  
`ld.lld: warning: cannot find entry symbol _start; not setting start address` is occurring when compiling the code.  
`_start` function should be exposed by adding `.global` in assembly file.  
`.global _start`  

### Lessons learned
1. binary size  
While trying to solve `#1` problem i digged into `.elf` to solve the issue. When investigating, the question raised:
'why are elf files so huge in comparison to actual work been done?'. File contains `.comment`,
`.symtab`, `.shstrtab`, `.strtab` sections. Apparently only a part of sections are being flashed into device 
(still need to figure what rules are used for it).
2. reset sequence  
One last thing to know when starting is a reset sequence. This will explain the need for `.word _start` when writing code.
Best described by paragraph from cortex-m3/4 book:
> After reset and before the processor starts executing the program, the Cortex-M
processors read the first two words from the memory. The beginning of
the memory space contains the vector table, and the first two words in the vector table are the
initial value for the Main Stack Pointer (MSP), and the reset vector, which
is the starting address of the reset handler. After these two words are read by the processor, the processor then
sets up the MSP and the Program Counter (PC) with these values.  
3. `.ARM.attributes`  
`.ARM.attributes` section holding specific instruction arm instructions needed to view them in objdump.  
in case `.ARM.attributes` is removed from binary, disassembly instructions will be shown as invalid ones.  
4. sections of objdump that can be omited:
- `.comment`
- `.symtab`
- `.strtab`  

## 002_asm_blink
blinking onboard LED.  
Period is defined by delay `0xFFFFF` which is about 1 mil,
loop is taking few cycles.
With 16 MHz default clock speed, it would give us few blinks in a second.

### Lessons Learned
1. Compare instructions  
Compare instructions such as `cmp` updates `cpsr` register,
which is giving branch instructions such as `bne` to check
a compare results and make a decision.

## 003_asm_led_button
Turn on LED if onboard button is pushed.

### Lessons Learned
1. Button State  
If button is not pushed, IDR register outputs 1, otherwise 0.

## 004_asm_blink_button
LED starts blinking when onboard button is pushed.

<br>

## 011_led_minimal
Now to use zig i'll add `main.zig` file to put there logic for turning on led.  
Important thing is to add `export` to main function as it will allow to expose it to compiler, same logic as with `.global` in assembly.  

Files used:
- `main.s` - contains vector table 
- `main.zig` code to blink LED
- `linker.ld` - linker script file  

commands to build and flash program:
- `zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf --verbose-link --verbose-cc --strip -fno-compiler-rt`  
- `openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"`  

### Problems during implementation
1. `.ARM.exidx` missing region  
When compiling, error from linker with message `no memory region specified for section '.ARM.exidx'` occurs.
This section is needed for 'unwinding the stack', procedure for handling exceptions. Given that zig have no exceptions,
`exidx` sections is useless. Nevertheless it's required for linker script, for some reason.
To work around this issue, add `-fno-unwind-tables` to issue.

2. Code from startup file not appearing in disassembly  
Either linker or compiler removing startup file part from object file. Changing section name from `.text` to `.isr_vector` helped the issue.  
Probably startup file require different section name than the main one.  

### Lessons Learned
1. `.c` alternative  
Ways to access memory in both languages:  
`(*(volatile unsigned int *) (0x12345678)) |= 0x1;` - `.c` version  
`@intToPtr(*volatile u32, 0x12345678)).* |= 0x1;` - `.zig` version (old)  
`(@as(*volatile u32, @ptrFromInt(0x12345678))).* |= 0x1;` - `.zig` version (0.13.0)

<br>

## 012_blinky_minimal
Same as [012_blinky_minimal](#011_blinky_minimal) but with blinky led


<br>

## 021_led_registers
Adding complexity by presenting Memory Mapped structures. 
In previous examples i was using pure values when accessing memory regions.
Default approach is to map memory into structure, this way everything is organized and in one place. 

Files used:
- `main.s` - contains vector table 
- `main.zig` code to blink LED
- `registers.zig` - file with memory mapped structures
- `linker.ld` - linker script file  

Also added `_estack = ORIGIN(SRAM) + LENGTH(SRAM);` to linker script. `_estack` is required symbol
and in case if it's unavailable we'll get an error `error: ld.lld: undefined symbol: _estack`.  
`_estack` is a stack that is pointing to end of SRAM memory.  

### Problems during implementation
1. packed struct  
`zig 0.10` still have some issues with packed structs, specifically when nesting them together.
For this reason registers will have flat structure for now.

### Lessons Learned
1. bit-banding
Accessing of a single bit of MMIO is called bit-banding.
Cortex-m4 does support this ([Arm Cortex-M4 Processor About bit-banding](https://developer.arm.com/documentation/100166/0001/Programmers-Model/Bit-banding/About-bit-banding?lang=en)), but when zig (or LLVM) compiles code it does so that bit-banding is not working.  
So then this it will not work.  
```zig
MODER: packed struct {
    MODER0: u1,
    MODER1: u1,
    MODER2: u1,
    MODER3: u1,
    ...
},
```
Minimum length of bit is should be `u8`: 
```zig
MODER: packed struct {
    MODER0: u8,
    MODER1: u8,
    MODER2: u8,
    MODER3: u8,
    ...
},
```

## 022_led_library
Move every hex literal and bit shift from right side of `=` to `registers.zig`
to have cleaner code in main:
`regs.RCC.AHB1ENR |= 0x1;` --> `regs.RCC.AHB1ENR |= regs.RCC_AHB1ENR_GPIOAEN;`

## 023_blink
In this exercise i'll try to explore the concept of using variables and loops to count down the blink time.

### Problems during implementation
1. Optimization  
When a simple loop `while (count > 0) : (count -= 1) {}` compiled, disassembly looks weird, and the program
will not perform as expected. Objdump:
```
 8000040: 6801         	ldr	r1, [r0]
 8000042: f081 0120    	eor	r1, r1, #32
 8000046: 6001         	str	r1, [r0]
 8000048: 6801         	ldr	r1, [r0]
 800004a: f081 0120    	eor	r1, r1, #32
 800004e: 6001         	str	r1, [r0]
 8000050: 6801         	ldr	r1, [r0]
 8000052: f081 0120    	eor	r1, r1, #32
 8000056: 6001         	str	r1, [r0]
 8000058: 6801         	ldr	r1, [r0]
 800005a: f081 0120    	eor	r1, r1, #32
 800005e: 6001         	str	r1, [r0]
```
To resolve this issue, adding line that prevents optimization is required:
```
while (count > 0) : (count -= 1) {
    @import("std").mem.doNotOptimizeAway(count);
}
```

<br>

## 024_heap
In this example we'll define heap section in linker script and use this values in main file.  
Linker script will have 2 values:
```ld
_heap_start = ORIGIN(SRAM);
_heap_end = _heap_start + 0x8000; /* 32K */
```
By setting `_heap_start` to `ORIGIN(SRAM)` it will be placed at the bottom of `SRAM` memory.
`_heap_end` shows that heap overall will be 32K bits length.  

This variables will be exposed at runtime:
```zig
extern var _heap_start: u32;
extern var _heap_end: u32;
```

And the trick to make this 2 variable as array(slice) of bytes:
```zig
const base: [*]u8 = @ptrFromInt(_heap_start);
const heap = base[0.._heap_start - _heap_end];
```
Where `[*]u8` is many-item pointer to unknown number of items.

### Lessons Learned
1. Heap Allocation Strategies
Apperently heap allocaton is complex topic which does not have 1 clear solution,
it's either simple but very specific or broad (general, that can fit different problems) but
quite complex at it's implementaiton and subsequently slower than simple sulution.  

<br>

## 031_usart
USART/UART (Universal Synchronous/Asynchronous Receiver-Transmitter)  
there are 6 available in STM32F446RE (USART1, USART2, USART3, USART6, UART4, UART5)  

Sending char (u8) through USART.  
Data is received in terminal via `screen /dev/ttyACM0 115200`, 115200 is baud rate.
This example is limited to sending only one char `u8`.

Files used:
- `main.s` 
- `main.zig`
- `registers.zig`
- `linker.ld` 

<br>

## 032_usart_writer
Point of this example is to show how to send any type of data through USART.
To achieve this goal, `writer` from standard library can be used (`std.io.Writer`).
It will allow to use `print` method to convert any types to string and send it through.
Also transform raw values to constants from registers file.

### Problems during implementation
1. Sending String  
`writer` function is required to return bytes written.
It is very important to send the actual number of bytes, otherwise it will mess up the sending.

### Lessons Learned
1. USART type
Data is sent using `[]u8`, transformation from `u32` to `[]u8` is required.
It is done via `print` function.

<br>

## 041_adc
Convert input analog signal to digital, result is sent to USART. 

Files used:
- `main.s`
- `main.zig`
- `registers.zig`
- `linker.ld`

### Problems during implementation
1. building this program requires `compiler-rt` libraries.  
Command will look like this after removing `-fno-compiler-rt`:  
`zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip`

<br>

## 042_adc_fraction
Convert input analog signal to digital, result is sent to USART.
The result from register is previously adjusted to sent range [0..1000] instead of [0..4095] 

Files used:
- `main.s`
- `main.zig`
- `registers.zig`
- `linker.ld`

<br>

## 051_tim_blink
Using general purpose timers, instead of loop, to blink onboard LED.
Timer is set by prescaler and auto reload registers.  
- `prescaler` - value which is used to divide clock speed (16MHz/PSC)
- `auto reload register (ARR)` - start value that is used to count down
After timer is counted from 0 to ARR, it requires reset by updating SR register (first bit).

Files used:
- `main.s`
- `main.zig`
- `registers.zig`
- `linker.ld`

<br>

## 052_tim_output
Configure TIM to blink LED not by software, but automatically by outputting TIM signal straight to PIN5.
PA5 need to be configured as an alternate function for TIM2.
This can also be considered as PWM mode.

<br>

## 53_tim_change
Changing the pulse with with potentiometer.

Move ADC and USART enabling to separate functions.

<br>

## 100_regs_blink
For this example, approach with generated mmio file will be taken.
to generate file we need source file and a tool, as source file `.svd` is used,
can find one in this repository https://github.com/cmsis-svd/cmsis-svd-data,
for pareser use `regs` from `microzig` https://github.com/ZigEmbeddedGroup/microzig.  
generated file also requires `microzig` as dependecie, this can be avoided by adding function
to generated file:
```zig
const mmio = struct {
    pub fn Mmio(comptime PackedT: type) type {
        ...
        ...
    }
    ...
    ...
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Digital camera interface
        pub const DCMI = extern struct {
            ///  control register 1
            CR: mmio.Mmio(packed struct(u32) {
                ///  Capture enable
                CAPTURE: u1,
                ...
            }
            ...
        }
        ...
    }
    ...
};

```

`0.13.0` version of `mmio` also had bugged `.toggle` and can be fixed by changing for loop,
where commented lines are old ones.
```zig
pub inline fn toggle(addr: *volatile Self, fields: anytype) void {
    var val = read(addr);
    inline for (fields) |field| {
    // inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
        @field(val, @tagName(field)) = if (@field(val, @tagName(field)) == 1) 0 else 1;
        // @field(val, @tagName(field.default_value.?)) = !@field(val, @tagName(field.default_value.?));
    }
    write(addr, val);
}
```

<br>

## 101_regs_usart
same as [032_usart_writer](#032_usart_writer) but with using generated `regs`  
```zig
while(periph.USART2.SR.read().TXE == 0) {}
periph.USART2.DR.modify(.{ .DR = byte });
// while((regs.USART2.SR & regs.USART_SR_TXE) != regs.USART_SR_TXE) {}
// regs.USART2.DR = byte;
```
### lessons learned
1. `read()` method of `MMIO` returns full struct with actual bits:
```zig
pub inline fn read(addr: *volatile Self) PackedT {
    return @bitCast(addr.raw);
}
...
AHB2RSTR: Mmio(packed struct(u32) {
    DCMIRST: u1,
    reserved7: u6,
    OTGFSRST: u1,
    padding: u24,
}),

```
2. The equivalent of `regs.USART2.BRR = value` is `periph.USART2.BRR.write_raw(value)`  

<br>

## 200_build_blinky
introduce build zig's build system into our flow  
start with simple blinky program  
build for command:  
`zig build-exe main.zig startup.s -target thumb-freestanding-none -mcpu cortex_m4 -O ReleaseSafe -Tlinker.ld --name main.elf -fstrip -fno-compiler-rt`   

- `build-exe main.zig`
```zig
b.addExecutable(.{
    .root_source_file = b.path("main.zig"),
}
```
- `--name main.elf`
```zig
b.addExecutable(.{
    .name = "main.elf",
});
```
- `-target thumb-freestanding-none -mcpu cortex_m4`
```zig
const target = b.resolveTargetQuery(.{
    .cpu_arch = .thumb,
    .os_tag = .freestanding,
    .abi = .eabi,
    .cpu_model = std.zig.CrossTarget.CpuModel{ 
        .explicit = &std.Target.arm.cpu.cortex_m4 
    },
});
```
- `-O ReleaseSafe`
```zig
const exe = b.addExecutable(.{
    .optimize = .ReleaseSafe
});
```
- `startup.s`
```zig
exe.addAssemblyFile(b.path("startup.s"));
```
- `-Tlinker.ld`
```zig
exe.setLinkerScript(b.path("linker.ld"));
```
- `-fstrip`
```zig
b.addExecutable(.{
    .strip = true,
});
```
- `-fno-compiler-rt`
```zig
exe.bundle_compiler_rt = false;
```
And the final result will be:
```zig
pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .os_tag = .freestanding,
        .abi = .eabi,
        .cpu_model = std.zig.CrossTarget.CpuModel{
            .explicit = &std.Target.arm.cpu.cortex_m4,
        },
    });

    const exe = b.addExecutable(.{
        .name = "main.elf",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = .ReleaseSafe,
        .strip = true,
    });

    exe.addAssemblyFile(b.path("startup.s"));
    exe.setLinkerScript(b.path("linker.ld"));
    exe.bundle_compiler_rt = false;

    b.install_prefix = "";
    b.installArtifact(exe);
}
```

<br>

## 201_build_openocd
Added step in build system to allow user to call `openocd` command: `openocd -f board/st_nucleo_f4.cfg -c "program zig-out/bin/main.elf verify reset exit"`
- `zig build`
- `zig build opeocd`

```zig
const run_cmd = b.addSystemCommand(&[_][]const u8{"openocd", "-f", "board/st_nucleo_f4.cfg", "-c", "program zig-out/bin/main.elf verify reset exit"});
b.step("openocd", "runs openocd to flash file into the board").dependOn(&run_cmd.step);
```
This does require to define every argument of `openocd` one by one

<br>

## 202_build_lib
Instread of using `STM32F446.zig` file inside the directory of example, use one from parent directory.  
This will require to add module in build system.  
```zig
const mmio_mod = b.addModule("mmio", .{
    .root_source_file = b.path("../STM32F446.zig"),
});
exe.root_module.addImport("mmio", mmio_mod);
```
Structure:  
```zig
/202_build_lib
  - main.zig
  - build.zig
STM32F446.zig
```

<br>

## 210_build_protobuf
Sending protobuf structure over USART  
For this example will be added `build.zig.zon` file for external dependencies.  
https://github.com/Arwalk/zig-protobuf is used for generating and serializing.  

### Problems during implementation
1. `error: ld.lld: undefined symbol: __aeabi_memset` when buildind executable.  
Caused by `exe.bundle_compiler_rt = false;` in build file, should be removed to solve problem.
<br>

## Future Examples
- floating point `@intToPtr(*volatile u32, 0xE000ED88).* = ((3 << 10*2)|(3 << 11*2));`

## 110_proto_usart
send protobuf data over usart using `microzig` `regs`  
writer requires update for sending data  
