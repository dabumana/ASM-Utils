// Define the system call numbers
.equ SYS_BRK, 214
.equ SYS_EXIT, 93

// Define the initial and maximum buffer size
.equ INITIAL_SIZE, 1024
.equ MAX_SIZE, 10240

// Function to allocate memory
allocate_memory:
    // Save the current registers
    sub sp, sp, #16
    stp x0, x1, [sp]
    stp x2, x3, [sp]

    // Allocate memory using brk
    mov x0, xzr            // Start with no allocated memory
    mov x8, #214           // SYS_BRK
    svc #0
    mov x19, x0            // Save the current break address

    // Request more memory
    add x0, x0, INITIAL_SIZE
    mov x8, #214           // SYS_BRK
    svc #0

    // Check if allocation failed
    cmp x0, #0
    b.lt allocation_failed

    // Restore registers
    ldp x2, x3, [sp]
    ldp x0, x1, [sp]
    add sp, sp, #16

    // Return the start of the allocated memory
    sub x0, x0, INITIAL_SIZE
    ret
