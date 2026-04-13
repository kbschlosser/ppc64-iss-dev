.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0004    # loop counter

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    li 1, -1
    .rept 10000
        sraw 1, 1, 1
    .endr
    add 2, 2, 1

    addi    3, 3, -1      # loop counter--
    b       loop
