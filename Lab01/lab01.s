lui s1,7245
addi s1,s1,-1578
lui s2,0x7aaaa
addi s2,s2,0x7aa
and s3, s1, s2
or s4, s1, s2
xor s5, s1, s2
slli s6,s1,7
srli s7,s6,7
srai s8,s6,7
addi sp, sp,-36
sw s1,0x00(gp)# substitue gp by sp for stack
sw s2,0x04(gp)
sw s3,0x08(gp)
sw s4,0x0C(gp)
sw s5,0x10(gp)
sw s6,0x14(gp)
sw s7,0x18(gp)
sw s8,0x1C(gp)
add x0,x0,x0 # nop