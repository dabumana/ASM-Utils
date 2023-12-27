.global _start
.section .data
filename: .asciz "/path/to/file"
buffer: .skip 4096  // space for file contents
error_message: .asciz "An error occurred\n"

.section .text
_start:
    mov x0, filename  // filename
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