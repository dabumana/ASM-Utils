.global _start
.section .data
filename: .asciz "/path/to/file"
filestat: .skip 144  // space for struct stat

.section .text
_start:
    mov x0, filename  // filename
    mov x1, filestat  // struct stat
    mov x8, 4         // syscall number for stat
    svc 0             // make the system call

    ldr x0, [x1, 48]  // load st_size field from struct stat
    cmp x0, #1024     // compare file size with limit
    b.gt delete       // if greater, go to delete

exit:
    mov x8, 93        // syscall number for exit
    mov x0, 0         // exit code
    svc 0             // make the system call

delete:
    mov x0, filename  // filename
    mov x8, 87        // syscall number for unlink
    svc 0             // make the system call
    b exit            // go to exit