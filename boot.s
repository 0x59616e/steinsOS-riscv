.option norvc
.section .reset.boot, "ax",@progbits
.global _start
.global abort

_start:
    /* Set up stack pointer. */
    la      sp, STACK
    addi    sp, sp, 1024
    /* Now jump to the rust world; __start_rust.  */
    j       __start_rust

.bss
