TOOLPREFIX=riscv64-unknown-linux-gnu-
CC=$(TOOLPREFIX)gcc
AS=$(TOOLPREFIX)as
LD=$(TOOLPREFIX)ld

boot.o: boot.s
	$(AS) $< -o $@

all: boot.o
