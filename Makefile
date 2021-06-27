TOOLPREFIX=riscv64-unknown-linux-gnu-
CC=$(TOOLPREFIX)gcc
AS=$(TOOLPREFIX)as
LD=$(TOOLPREFIX)ld
ROOTDIR=~/project/OS/steinsOS

kernel:
	cargo build
	mv $(ROOTDIR)/target/riscv64imac-unknown-none-elf/debug/steinsos $(ROOTDIR)

all: kernel

qemu: kernel
	qemu-system-riscv64 -nographic -machine virt -bios none -kernel steinsos
