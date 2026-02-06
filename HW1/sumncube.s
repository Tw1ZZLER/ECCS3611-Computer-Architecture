addi a0, zero, 0 # sumncube(0) = 0
jal sumncube
addi a0, zero, 1 # sumncube(1) = 1
jal sumncube
addi a0, zero, 2 # sumncube(2) = 9
jal sumncube
addi a0, zero, 5 # sumncube(5) = 225
jal sumncube
nop

sumncube: 
    addi sp, sp, -8 # save registers
    sw a0, 4(sp) # store n in stack
    sw ra, 0(sp) # store return address in stack
    addi t0, zero, 0 # temporary = 0
    bgt a0, t0, else # if n > 0, go to else
    addi a0, zero, 0 # otherwise, return 0
    addi sp, sp, 8 # restore sp
    jr ra # return
else: 
    addi a0, a0, -1 # n = n − 1
    jal sumncube # recursive call
    lw t1, 4(sp) # restore n into t1
    lw ra, 0(sp) # restore ra
    addi sp, sp, 8 # restore sp
    mul t2, t1, t1 # t2 = n * n
    mul t2, t2, t1 # t2 = n * n * n
    add a0, a0, t2 # a0 = sumncube(n-1) + n*n*n
    jr ra # return