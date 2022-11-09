clone of [STM32F446RE-examples](https://github.com/mind-rot/STM32F446RE-examples) but written in `zig` instead of `c`

The purpose of this exercise is to explore both the world of embedded development and zig programming language.
I choose the bottom-up approach, this way exercises will be incrementally more complicated.
Each exercise will contain information i discovered during it's implementation and problems i faced.

# STM32F446RE
- [01_asm_led_minimal](#01_asm_led_minimal)
- [11_led_minimal](#11_led_minimal)

<br>

## 01_asm_led_minimal
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

<br>

## 11_led_minimal
Now to use zig i'll add `main.zig` file to put there logic for turning on led.  
Important thing is to add `export` to main function as it will allow to expose it to compiler, same logic as with `.global` in assembly.  

Files used:
- `main.s` - contains both vector table 
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
`@intToPtr(*volatile u32, 0x12345678)).* |= 0x1;` - `.zig` version

<br>

## 21_led_struct
Adding complexity by presenting Memory Mapped structures. 
In previous examples i was using pure values when accessing memory regions.
Default approach is to map memory into structure, this way everything is organized and in one place. 

Files used:
- `main.s` - contains both vector table 
- `main.zig` code to blink LED
- `registers.zig` - file with memory mapped structures
- `linker.ld` - linker script file 

### Problems during implementation
1. packed struct  
`zig 0.10` still have some issues with packed structs, specifically when nesting them together.
For this reason registers will have flat structure for now.
