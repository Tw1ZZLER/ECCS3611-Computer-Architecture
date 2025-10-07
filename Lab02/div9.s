# div9.s
li a0, 27 # load dividend
li a1, 9 # load modulus / divisor

subnine:
    sub a0, a0, a1 # subtract divisor (a1) from dividend (a0)
    beq a0, zero, equal # if a0 = 0, branch to equal
    blt a0, zero, notequal # if a0 < 0, branch to notequal
    j subnine # if a0 > 0, subtract nine again

equal:
    ori s0, zero, 1 # set s0 if equal
    j done # jump to done to avoid notequal

notequal:
    or s0, zero, zero # unset s0 if not equal

done:
    addi t1, zero, 100
    add zero, zero, zero # no op