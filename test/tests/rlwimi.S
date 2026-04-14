.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0020    # loop counter
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
        rlwimi 14, 1, 4 , 1, 31
        rlwimi 15, 1, 5 , 1, 31
        rlwimi 16, 1, 6 , 1, 31
        rlwimi 17, 1, 7 , 1, 31
        rlwimi 18, 1, 8 , 1, 31
        rlwimi 19, 1, 9 , 1, 31
        rlwimi 20, 1, 10, 1, 31
        rlwimi 21, 1, 11, 1, 31
        rlwimi 22, 1, 12, 1, 31
        rlwimi 23, 1, 13, 1, 31
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
