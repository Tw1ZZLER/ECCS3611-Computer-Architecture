initarray:
    addi a0, zero, 0x400 # base of the string
    addi t0, zero, 0x42 # hex representation of B
    sb t0, 0(a0)
    addi t0, zero, 0x49 # hex representation of I
    sb t0, 1(a0)
    addi t0, zero, 0x50 # hex representation of P
    sb t0, 2(a0)
    addi t0, zero, 0x42 # hex representation of B
    sb t0, 3(a0)
    addi t0, zero, 0x49 # hex representation of I
    sb t0, 4(a0)
    addi t0, zero, 0x50 # hex representation of P
    sb t0, 5(a0)
    sb zero, 6(a0) # terminate the string with 0
    addi a1,zero,2 # example of shift amount
    addi s0,zero,0 # i=0
    addi s1, zero, 26 # total number of alphabets
    addi s2, zero, 65 # A in ASCII
# encrypt the string using caesar cipher
# bipbip 2.0
loop:
    lb t1, 0(a0) # load the character
    beqz t1, encrypt_done # if character is null, we are done
    blt t1, s2, not_upper # if character < 'A', not an uppercase letter
    addi t2, t1, -65 # t2 = character - 'A'
    add t2, t2, a1 # shift the character
    rem t2, t2, s1 # wrap around using modulo 26
    addi t2, t2, 65 # convert back to ASCII
    sb t2, 0(a0) # store the encrypted character
    j next
not_upper:
    addi s2, zero, 97 # a in ASCII
    bge t1, s2, not_lower # if character >= 'a', go to not_lower
    j next # if character is not an alphabet, skip it
not_lower:
    addi t2, t1, -97 # t2 = character - 'a'
    add t2, t2, a1 # shift the character
    rem t2, t2, s1 # wrap around using modulo 26
    addi t2, t2, 97 # convert back to ASCII
    sb t2, 0(a0) # store the encrypted character
next:
    addi a0, a0, 1 # move to the next character
    j loop
encrypt_done:
    nop # finished  
    # 44 4B 52 44 4B 52 00 = `DKRDKR`

# decrypt the string using caesar cipher
# you are doing everything oppositely so instead of adding the shift amount you are subtracting
# the shift amount. Again, if the letter position after being shifted is negative just add 26.
decrypt:
    addi a0, zero, 0x400 # base of the string
    addi s2, zero, 65 # A in ASCII
    addi s1, zero, 26 # total number of alphabets
    addi s0, zero, 0 # i=0
loop_decrypt:
    lb t1, 0(a0) # load the character
    beqz t1, decrypt_done # if character is null, we are done
    blt t1, s2, not_upper_decrypt # if character < 'A', not an uppercase letter
    addi t2, t1, -65 # t2 = character - 'A'
    sub t2, t2, a1 # shift the character
    bltz t2, add_26_upper # if t2 < 0, add 26
    j store_upper
add_26_upper:
    add t2, t2, s1 # add 26 to wrap around
store_upper:
    addi t2, t2, 65 # convert back to ASCII
    sb t2, 0(a0) # store the decrypted character
    j next_decrypt
not_upper_decrypt:
    addi s2, zero, 97 # a in ASCII
    bge t1, s2, not_lower_decrypt # if character >= 'a', go to not_lower_decrypt
    j next_decrypt # if character is not an alphabet, skip it
not_lower_decrypt:
    addi t2, t1, -97 # t2 = character - 'a'
    sub t2, t2, a1 # shift the character
    bltz t2, add_26_lower # if t2 < 0, add 26
    j store_lower
add_26_lower:
    add t2, t2, s1 # add 26 to wrap around
store_lower:
    addi t2, t2, 97 # convert back to ASCII
    sb t2, 0(a0) # store the decrypted character
next_decrypt:
    addi a0, a0, 1 # move to the next character
    j loop_decrypt
decrypt_done:
    nop # finished