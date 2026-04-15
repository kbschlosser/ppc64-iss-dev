.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x014A    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1000
        add. 4 , 4 , 1
        add. 5 , 4 , 1
        add. 6 , 5 , 1
        add. 7 , 6 , 1
        add. 8 , 7 , 1
        add. 9 , 8 , 1
        add. 10, 9 , 1
        add. 11, 10, 1
        add. 12, 11, 1
        add. 13, 12, 1
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
