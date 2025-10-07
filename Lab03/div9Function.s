# div9.s
addi a0, zero, 81 # load dividend
jal isdiv9 # => x1, 8
j done # => 

isdiv9:
  addi t0, zero, 9 # load modulus / divisor
  while:
    sub a0, a0, t0 # subtract divisor (a1) from dividend (a0)
    beq a0, zero, equal # if a0 = 0, branch to equal
    blt a0, zero, notequal # if a0 < 0, branch to notequal
    j while # if a0 > 0, subtract nine again

notequal:
    or a0, zero, zero # unset a1 if not equal
    j backtomain # jump to done to avoid notequal => jal x0, 8

equal:
    ori a0, zero, 1 # set a1 if equal

backtomain:
    ret

done:
    nop # => addi x0, x0, 0