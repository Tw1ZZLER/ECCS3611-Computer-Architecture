addi a0, zero, 232 # a0 = 232
addi a1, zero, 2 # a1 = 2

# 0x00000293
# 0b000000000000 00000 000 00101 0010011
addi t0, zero, 0 # initialize t0 at 0
  
# 0x00B54863
# 0b0000000 01011 01010 100 10000 1100011
# 16
# blt a0, a1, 16 
loop:
	blt a0, a1, done # if a0 < a1, exit loop
  
# 0x40B50533
# 0b0100000 01011 01010 000 01010 0110011
	sub a0, a0, a1
  
# 0x00128293
# 0b00000000000100101000 00101 0010011
	addi t0, t0, 1
  
# 0xFF5FF06F
# 0b11111111010111111111 00000 1101111
# jal zero,-12
	j loop
  
# 0x005005B3
# 0b0000000 00101 00000 000 01011 0110011
done:
	add a1, zero, t0
  
# 0x00008067
# 0b000000000000 00001 000 00000 1100111
# jalr zero, ra, 0
	jr ra

# C++ version
# int func(int a, int b) {
#     int i = 0;
#     while (a >= b) {
#         a = a - b;
#         i = i + 1;
#     }
#     return i;
# }