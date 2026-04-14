.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x03C0    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 500
        add 1 , 1 , 1
        ori 4 , 1 , 4
        ori 5 , 4 , 5
        ori 6 , 5 , 6
        ori 7 , 6 , 7
        ori 8 , 7 , 8
        ori 9 , 8 , 9
        ori 10, 9 , 10
        ori 11, 10, 11
        ori 12, 11, 12
        ori 13, 12, 13
        ori 14, 13, 14
        ori 15, 14, 15
        ori 16, 15, 16
        ori 17, 16, 17
        ori 18, 17, 18
        ori 19, 18, 19
        ori 20, 19, 20
        ori 21, 20, 21
        ori 22, 21, 22
        ori 23, 22, 23
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
