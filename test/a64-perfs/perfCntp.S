# to communicate with the host
# check riscv-software-src/riscv-tests

.section .text.init
.global _start
_start:

    mov     x0, #((0b11<<20) | (0b11 << 16))
    msr     cpacr_el1, x0        // enable floating point and SVE

    movz    x2,  #0x200,lsl 16
    mov     x1, #10
    mov     x0, #3

loop:
    cntp   x10,p0,p0.b
    cntp   x11,p1,p1.b
    cntp   x12,p2,p2.b
    cntp   x13,p3,p3.b
    cntp   x14,p4,p4.b
    cntp   x15,p5,p5.b
    cntp   x16,p6,p6.b
    cntp   x17,p7,p7.b
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
