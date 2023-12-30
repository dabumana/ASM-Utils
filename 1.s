.global _start
.section .data
filename: .asciz "/path/to/file"

.section .text
_start:
    mov x0, filename  // filename
    mov x8, 87        // syscall number for unlink
    svc 0             // make the system call

    mov x8, 93        // syscall number for exit
    mov x0, 0         // exit code
    svc 0             // make the system call