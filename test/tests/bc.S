.machine power10
.globl _start
.section .text
_start:
    nop
    lis      3, 0x000C    # loop counter

loop:
    cmpli   0, 0, 3, 0
    beqa    0xfc          # branch to exit if loop counter equals zero
    
    .rept 10000
        beq 4
    .endr

    addi    3, 3, -1      # loop counter--
    b       loop
