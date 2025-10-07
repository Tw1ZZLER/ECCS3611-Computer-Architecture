addi a0, zero, 10 # a0 = 6
addi a0, a0, -1 # a0 = 5, adjust for n
jal greet # initially call greet
j done

greet: 
    addi sp, sp, -8 # save registers
    sw a0, 4(sp) # store n in stack
    sw ra, 0(sp) # store return address in stack
    addi t0, zero, 1 # temporary = 1
    bgt a0, t0, else # if n > 1, go to else
    addi a0, zero, 1 # otherwise, return 1
    addi sp, sp, 8 # restore sp
    jr ra # return
else: 
    addi a0, a0, -1 # n = n − 1
    jal greet # recursive call
    lw t1, 4(sp) # restore n into t1
    lw ra, 0(sp) # restore ra
    addi sp, sp, 8 # restore sp
    add a0, t1, a0 # a0 = a0 + t1
    jr ra # return

done:
    nop # finished