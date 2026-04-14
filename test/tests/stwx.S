.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0007    # loop counter
    lis      2, 0x0001
    li       1, 4

    li 4 , 0
    li 5 , 4
    li 6 , 8
    li 7 , 12
    li 8 , 16
    li 9 , 20
    li 10, 24
    li 11, 28
    li 12, 32
    li 13, 36
    li 14, 40
    li 15, 44
    li 16, 48
    li 17, 52
    li 18, 56
    li 19, 60
    li 20, 64
    li 21, 68
    li 22, 72
    li 23, 76

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 500
        add 2, 2, 1
        stwx 4 , 2, 4
        stwx 5 , 2, 5
        stwx 6 , 2, 6
        stwx 7 , 2, 7
        stwx 8 , 2, 8
        stwx 9 , 2, 9
        stwx 10, 2, 10
        stwx 11, 2, 11
        stwx 12, 2, 12
        stwx 13, 2, 13
        stwx 14, 2, 14
        stwx 15, 2, 15
        stwx 16, 2, 16
        stwx 17, 2, 17
        stwx 18, 2, 18
        stwx 19, 2, 19
        stwx 20, 2, 20
        stwx 21, 2, 21
        stwx 22, 2, 22
        stwx 23, 2, 23
    .endr
    lis      2, 0x0001

    addi    3, 3, -1      # loop counter--
    b       loop
