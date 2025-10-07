# int tmp;
# if (n1 > n2) {
# tmp = n2;
# n2 = n1;
# n1 = tmp;
# }
# while (n2 != 0 & n1 != 0) {
# tmp = n2 % n1;
# n2 = n1;
# n1 = tmp;
# }
# if (n2 == 0) return n1;
# else return n2;

addi a1, zero, 64
addi a2, zero, 96
jal gcd


gcd:
    add t0, zero, zero # init tmp
    bge a2, a1, while # if (n2 <= n1) do execute the next 3 lines
    add t0, zero, a2 # tmp = n2
    add a2, zero, a1 # n2 = n1
    add a1, zero, t0 # n1 = tmp
    while:
        beqz a1, break # if n1 == 0, break
        beqz a2, break # if n2 == 0, break

        # tmp = n2 % n1
        add t0, zero, zero # tmp = 0
        div a3, a2, a1 # a3 = n2 / n1
        mul a3, a3, a1 # a3 = (n2 / n1) * n1
        sub t0, a2, a3 # tmp = n2 - ((n2 / n1) * n1)

        add a2, zero, a1 # n2 = n1
        add a1, zero, t0 # n1 = tmp
        j while
    break:
        beqz a2, returnn1 # if ( n2 == 0 ) return n1
        add a0, zero, a2 # return n2
        ret
        returnn1:
            add a0, zero, a1 # return n1
            ret
        
        
        