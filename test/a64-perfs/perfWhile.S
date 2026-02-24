# to communicate with the host
# check riscv-software-src/riscv-tests

.section .text.init
.global _start
_start:

    mov     x0, #((0b11<<20) | (0b11 << 16))
    msr     cpacr_el1, x0        // enable floating point and SVE

    movz    x2,  #0x400,lsl 16
    mov     x1, #10
    mov     x3, #10
    mov     x4, #10
    mov     x5, #10
    mov     x6, #10
    mov     x7, #10
    mov     x8, #10
    mov     x9, #10
    mov     x0, #3

loop:
    whilelo p0.b,x0, x1
    mrs     x10, nzcv
    whilelo p1.b,x0, x8
    mrs     x11, nzcv
    whilelo p2.b,x0, x9
    mrs     x12, nzcv
    whilelo p3.b,x0, x3
    mrs     x13, nzcv
    whilelo p4.b,x0, x4
    mrs     x14, nzcv
    whilelo p5.b,x0, x5
    mrs     x15, nzcv
    whilelo p6.b,x0, x6
    mrs     x16, nzcv
    whilelo p7.b,x0, x7
    mrs     x17, nzcv
    subs    x2,x2,#1
    b.gt    loop

exit: 
    # exit VADL virt (HTIF)
    mov     x0, #1           // cmd: exit 0
    ldr     x1, =tohost      // Load address of 'tohost' into x1
    str     x0, [x1]         // Store a0 to 'tohost'

    # exit upstream virt (semihosting)
    ldr     x1, =args
    mov     w0, #0x20        // SYS_EXIT operation
    hlt     #0xF000          // Trigger semihosting call

1:  b       1b               // Infinite loop

.section .data
.align 3
args: 
.xword 0x20026     // ADP_Stopped_ApplicationExit command
.xword 0x0         // Exit Code 

.section .tohost, "aw", @progbits
.align 6
.global tohost
tohost: .xword 0
.size tohost, 8

.align 6
.global fromhost
fromhost: .xword 0
.size fromhost, 8
