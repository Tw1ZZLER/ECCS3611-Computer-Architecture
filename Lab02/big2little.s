# big2little.s
initarray:
    addi a0, zero, 0x300
    addi t0, zero, 32 # number of bytes
    addi t1, zero, 0 # index
    lui t2, 0xABCDE # t2 = 0xABCDE123 (random value)
    addi t2, t2, 0x123
L1:
    beq t0, t1, doneinit
    add t3, a0, t1 # t3 = address to write to
    sw t2, 0(t3) # [t3] = t2
    addi t1, t1, 4 # t1 += 4 (address of next word)
    slli t2, t2, 8 # change value in t2
    add t2, t2, t1
    j L1 # repeat loop
doneinit:
    li s0, 0x300 # store memory address
    li t1, 32 # byte counter
storeinstack:
    beq t1, zero, donestore # check byte counter, stop if zero
    lb t0, 0(s0) # load byte from memory portion
    addi sp, sp, -1 # decrement stack pointer by 1 byte
    sb t0, 0(sp) # store byte in stack
    addi t1, t1, -1 # decrement the byte counter
    addi s0, s0, 1 # increment memory pointer by 1 byte
    j storeinstack
donestore:
    li s0, 0x300 # reset memory address
    li t1, 8 # word counter, we will do by words to reduce instructions for efficiency
restore:
    beq t1, zero, donedone # check word counter, stop if zero
    lw t0, 0(sp) # load word from stack
    addi sp, sp, 4 # increment stack pointer by 1 word (4 bytes)
    sw t0, 0(s0) # store word in memory portion
    addi t1, t1, -1 # decrement the word counter
    addi s0, s0, 4 # increment memory pointer by 1 word (4 bytes)
    j restore
donedone:
    add zero, zero, zero # no op