.global _start
.section .data
buffer: .skip 4096  // space for file contents

.section .text
_start:
    ldr x0, [sp]      // argc
    add x1, sp, 8     // argv

    cmp x0, 2         // check if there are at least two arguments
    blt error         // if less than two, go to error

    ldr x0, [x1, 8]   // filename (second argument)
    mov x1, 0         // flags
    mov x2, 0         // mode
    mov x8, 56        // syscall number for openat
    svc 0             // make the system call

    cmp x0, 0         // check if the system call failed
    blt error         // if less than zero, go to error

    mov x1, x0        // fd
    mov x0, buffer    // buffer
    mov x2, 4096      // count
    mov x8, 63        // syscall number for read
    svc 0             // make the system call

    cmp x0, 0         // check if the system call failed
    blt error         // if less than zero, go to error

exit:
    mov x8, 93        // syscall number for exit
    mov x0, 0         // exit code
    svc 0             // make the system call

error:
    mov x0, 1         // file descriptor (stdout)
    mov x1, error_message  // buffer
    mov x2, 18        // count
    mov x8, 64        // syscall number for write
    svc 0             // make the system call
    b exit            // go to exit