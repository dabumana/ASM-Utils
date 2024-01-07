.section .text
.global _start

_start:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x27, x28, [sp, #-16]!

    mov w0, #5 ; Input number
    bl factorial ; Call factorial function

    ldp x27, x28, [sp], #16
    ldp x25, x26, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

factorial:
    cmp w0, #1 ; Check if input is 1
    ble .base_case ; If input is 1, return 1

    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x27, x28, [sp, #-16]!

    sub w0, w0, #1 ; Decrement input
    bl factorial ; Call factorial function recursively

    ldp x27, x28, [sp], #16
    ldp x25, x26, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    mov sp, x29
    ldp x29, x30, [sp], #16

    mul w0, w0, x19 ; Multiply input by result of recursive call
    ret

.base_case:
    mov w0, #1 ; Return 1
    ret