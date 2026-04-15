.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x02A0    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1000
        subf 4 , 4 , 1
        subf 5 , 4 , 1
        subf 6 , 5 , 1
        subf 7 , 6 , 1
        subf 8 , 7 , 1
        subf 9 , 8 , 1
        subf 10, 9 , 1
        subf 11, 10, 1
        subf 12, 11, 1
        subf 13, 12, 1
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
