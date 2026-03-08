.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x0020    # loop counter

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 10000
        rlwimi 0, 1, 8, 0, 31
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
