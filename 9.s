.global _start

_start:
    // Load a value from memory
    ldr x0, =0x1234

    // Load a pair of values from memory
    ldp x1, x2, [x0]

    // Add two numbers
    add x3, x1, x2

    // Subtract two numbers
    sub x4, x3, x2

    // Negate a number
    neg x5, x4

    // Multiply two numbers
    mov x6, #4
    mul x5, x5, x6

    // Unsigned division
    mov x6, #2
    udiv x5, x5, x6

    // Signed division
    mov x6, #-3
    sdiv x5, x5, x6

    // Logical shift left
    mov x6, #2
    lsl x5, x5, x6

    // Logical shift right
    mov x6, #3
    lsr x5, x5, x6

    // Bitwise OR
    mov x6, #0x0F
    orr x5, x5, x6

    // Bitwise XOR
    mov x6, #0x55
    eor x5, x5, x6

    // Bitwise NOT
    mvn x5, x5

    // Compare two numbers
    mov x6, #10
    cmp x5, x6

    // Conditional branch if zero
    cbz x5, zero

    // Conditional branch if not zero
    cbnz x5, not_zero

    // Store a value to memory
    str x5, [x0]

    // Exit the program
    mov x8, #93
    svc #0

zero:
    // Do something if x5 is zero
    b end

not_zero:
    // Do something if x5 is not zero
    b end

end:
    // End of program