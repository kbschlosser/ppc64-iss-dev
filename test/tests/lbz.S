.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x000C    # loop counter
    lis      2, 0x0001
    li       1, 4

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 500
        add 2, 2, 1
        lbz 4 ,  0(2)
        lbz 5 ,  4(2)
        lbz 6 ,  8(2)
        lbz 7 , 12(2)
        lbz 8 , 16(2)
        lbz 9 , 20(2)
        lbz 10, 24(2)
        lbz 11, 28(2)
        lbz 12, 32(2)
        lbz 13, 36(2)
        lbz 14, 40(2)
        lbz 15, 44(2)
        lbz 16, 48(2)
        lbz 17, 52(2)
        lbz 18, 56(2)
        lbz 19, 60(2)
        lbz 20, 64(2)
        lbz 21, 68(2)
        lbz 22, 72(2)
        lbz 23, 76(2)
    .endr
    lis      2, 0x0001

    addi    3, 3, -1      # loop counter--
    b       loop
