add t0, zero, zero # initialize sum to 0
loop:
    beq a1, zero, done # if n == 0, skip loop
    add t0, a0, t0  # sum += a0
    addi a1, a1, -1 # n--
    j loop # jump back to loop
done:
    jr ra # return to caller