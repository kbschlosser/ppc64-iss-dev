.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x000A    # loop counter
    lis      4, 0x0001    # store address

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    addi 1, 1, 1
    .rept 10000
        stwx 1, 0, 4
    .endr
    add 2, 1, 0

    addi    3, 3, -1      # loop counter--
    b       loop
