zig build-exe main.zig startup.s \
	-target thumb-freestanding-none \
	-mcpu cortex_m4 \
	-O ReleaseSafe \
	-Tlinker.ld \
	--name main.elf \
	-fstrip \
	-fno-compiler-rt \
&& openocd -f board/st_nucleo_f4.cfg -c "program main.elf verify reset exit"


