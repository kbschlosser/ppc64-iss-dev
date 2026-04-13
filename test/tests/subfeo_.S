.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0010    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 10000
        subfeo. 1, 1, 1
    .endr
    add 2, 1, 0

    addi    3, 3, -1      # loop counter--
    b       loop
