.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0100    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1250
        add 1, 1, 1
        cmpli   0, 0, 1, 0
        cmpli   1, 0, 1, 1
        cmpli   2, 0, 1, 2
        cmpli   3, 0, 1, 3
        cmpli   4, 0, 1, 4
        cmpli   5, 0, 1, 5
        cmpli   6, 0, 1, 6
        cmpli   7, 0, 1, 7
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
