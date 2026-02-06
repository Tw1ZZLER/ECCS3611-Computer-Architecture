# Exam3/question2.s
# Given a positive integer n in a1, compute the floor of log2(n)
# and return the result in a0.
addi a1, zero, 200 # example input
funct:
    addi t0, zero, 1 
    add a0, zero, zero
while:
    beq a1, t0, done
    blt a1, t0, sub1
    slli t0, t0, 2
    addi a0, a0, 1
    j while
sub1:
    addi a0, a0, -1
done:
    jr ra # return to caller