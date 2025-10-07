addi t4, a1, 0  
ori  a0, a0, 32 
sub  a1, a1, a0 
jal  ra, 36         
  
lw   t2, 4(a0)  
sw   t2, 16(a1) 
srli t3, t2, 8  
beq  t2, t3, 8  
jalr zero, ra, 0
addi a0, a0, 4  
jal  zero, -24