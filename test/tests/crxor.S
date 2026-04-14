.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0024    # loop counter
    lis      1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 500
        add 1, 1, 1
        crxor 4 , 4 , 1
        crxor 5 , 5 , 4
        crxor 6 , 6 , 5
        crxor 7 , 7 , 6
        crxor 8 , 8 , 7
        crxor 9 , 9 , 8
        crxor 10, 10, 9
        crxor 11, 11, 10
        crxor 12, 12, 11
        crxor 13, 13, 12
        crxor 14, 14, 13
        crxor 15, 15, 14
        crxor 16, 16, 15
        crxor 17, 17, 16
        crxor 18, 18, 17
        crxor 19, 19, 18
        crxor 20, 20, 19
        crxor 21, 21, 20
        crxor 22, 22, 21
        crxor 23, 23, 22
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
