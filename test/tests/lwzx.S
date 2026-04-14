.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x000A    # loop counter
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

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1000
        add 2, 2, 1
        lwzx 14, 2, 4
        lwzx 15, 2, 5
        lwzx 16, 2, 6
        lwzx 17, 2, 7
        lwzx 18, 2, 8
        lwzx 19, 2, 9
        lwzx 20, 2, 10
        lwzx 21, 2, 11
        lwzx 22, 2, 12
        lwzx 23, 2, 13
    .endr
    lis      2, 0x0001

    addi    3, 3, -1      # loop counter--
    b       loop
