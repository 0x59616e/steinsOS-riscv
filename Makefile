TOOLPREFIX=riscv64-unknown-linux-gnu-
CC=$(TOOLPREFIX)gcc
AS=$(TOOLPREFIX)as
LD=$(TOOLPREFIX)ld
ROOTDIR=~/project/OS/steinsOS
BIN=steinsos

kernel:
	cargo build
	rm $(ROOTDIR)/$(BIN)
	mv $(ROOTDIR)/target/riscv64imac-unknown-none-elf/debug/$(BIN) $(ROOTDIR)

all: kernel

qemu: kernel
	qemu-system-riscv64 -nographic -machine virt -bios none -kernel steinsos
