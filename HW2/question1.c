// add t0, zero, zero # initialize sum to 0
// loop:
//     beq a1, zero, done # if n == 0, skip loop
//     add t0, a0, t0  # sum += a0
//     addi a1, a1, -1 # n--
//     j loop # jump back to loop
// done:
//     jr ra # return to caller

int sum_n(int value, int n) {
    // This function computes the sum of 'value' added 'n' times.
    // The result is stored in a register (t0 in assembly).
    int sum = 0;
    while (n > 0) {
        sum += value;
        n--;
    }
    return sum;
}