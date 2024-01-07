.section .data
    a: .word 10
    b: .word 20
    c: .word 5
    d: .word 0

.section .text
    .global _start

_start:
    ; Load 'a' into 'x0'
    ldr x0, =a

    ; Load 'b' into 'x1'
    ldr x1, =b

    ; Load 'c' into 'x2'
    ldr x2, =c

    ; Load the value at address 'a' into 'x3'
    ldr w3, [x0]

    ; Load the value at address 'b' into 'x4'
    ldr w4, [x1]

    ; Load the value at address 'c' into 'x5'
    ldr w5, [x2]

    ; Add 'w3' and 'w4' and store the result in 'w6'
    add w6, w3, w4

    ; Subtract 'w5' from 'w6' and store the result in 'w7'
    sub w7, w6, w5

    ; Store the result in 'd'
    str w7, [x3]

    ; Exit the program
    mov x8, #93
    svc #0