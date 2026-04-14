.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x000C    # loop counter
    lis      1, 0x7abc

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
    li 14, 14
    li 15, 15
    li 16, 16
    li 17, 17
    li 18, 18
    li 19, 19
    li 20, 20
    li 21, 21
    li 22, 22
    li 23, 23

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero

    .rept 500
        add 1, 1, 1
        divw 4 , 1, 4
        divw 5 , 1, 5
        divw 6 , 1, 6
        divw 7 , 1, 7
        divw 8 , 1, 8
        divw 9 , 1, 9
        divw 10, 1, 10
        divw 11, 1, 11
        divw 12, 1, 12
        divw 13, 1, 13
        divw 14, 1, 14
        divw 15, 1, 15
        divw 16, 1, 16
        divw 17, 1, 17
        divw 18, 1, 18
        divw 19, 1, 19
        divw 20, 1, 20
        divw 21, 1, 21
        divw 22, 1, 22
        divw 23, 1, 23
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
