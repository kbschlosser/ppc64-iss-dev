.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x00D0    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 500
        add 1, 1, 1
        andi. 4 , 1 , 4
        andi. 5 , 4 , 5
        andi. 6 , 5 , 6
        andi. 7 , 6 , 7
        andi. 8 , 7 , 8
        andi. 9 , 8 , 9
        andi. 10, 9 , 10
        andi. 11, 10, 11
        andi. 12, 11, 12
        andi. 13, 12, 13
        andi. 14, 13, 14
        andi. 15, 14, 15
        andi. 16, 15, 16
        andi. 17, 16, 17
        andi. 18, 17, 18
        andi. 19, 18, 19
        andi. 20, 19, 20
        andi. 21, 20, 21
        andi. 22, 21, 22
        andi. 23, 22, 23
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
