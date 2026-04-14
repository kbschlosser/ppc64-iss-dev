.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0004    # loop counter
    li       1, 1

    li 4 , 4
    li 5 , 5
    li 6 , 6
    li 7 , 7
    li 8 , 8
    li 9 , 9
    li 10, 10
    li 11, 11
    li 12, 12
    li 13, 13

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1000
        add 1, 1, 1
        sraw 14, 1, 4
        sraw 15, 1, 5
        sraw 16, 1, 6
        sraw 17, 1, 7
        sraw 18, 1, 8
        sraw 19, 1, 9
        sraw 20, 1, 10
        sraw 21, 1, 11
        sraw 22, 1, 12
        sraw 23, 1, 13
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
