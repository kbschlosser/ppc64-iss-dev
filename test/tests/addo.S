.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0020    # loop counter
    li       1, 1

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 1000
        addo 4 , 4 , 1
        addo 5 , 4 , 1
        addo 6 , 5 , 1
        addo 7 , 6 , 1
        addo 8 , 7 , 1
        addo 9 , 8 , 1
        addo 10, 9 , 1
        addo 11, 10, 1
        addo 12, 11, 1
        addo 13, 12, 1
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
