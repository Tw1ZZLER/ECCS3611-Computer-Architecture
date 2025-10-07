addi a0, zero, 120
addi a1, zero, 20
addi t2, zero, 0
add t3, a1, zero

blt a0, t3, 16
addi t2, t2, 1
add t3, t3, a1
jal zero, -12

add a0, t2, zero

nop