.global _start
.section .data
size: .quad 4096  // size of memory to allocate

.section .text
_start:
    mov x0, 0         // address
    ldr x1, =size     // size
    mov x2, 7         // prot
    mov x3, 34        // flags
    mov x4, -1        // fd
    mov x5, 0         // offset
    mov x8, 222       // syscall number for mmap
    svc 0             // make the system call

    mov x8, 93        // syscall number for exit
    mov x0, 0         // exit code
    svc 0             // make the system call