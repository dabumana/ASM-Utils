.global _start
.section .data
size: .quad 4096  // size of memory to deallocate

.section .text
_start:
    mov x0, buffer    // address
    ldr x1, =size     // size
    mov x8, 215       // syscall number for munmap
    svc 0             // make the system call

    mov x8, 93        // syscall number for exit
    mov x0, 0         // exit code
    svc 0             // make the system call