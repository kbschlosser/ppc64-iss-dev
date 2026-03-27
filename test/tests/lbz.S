.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0008    # loop counter

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 10000
        lbz 0, 50(0)
    .endr
    addi 1, 0, 0

    addi    3, 3, -1      # loop counter--
    b       loop
