.global _start
.section .data
    file1: .asciz "/path/to/file1"
    file2: .asciz "/path/to/file2"
    files: .quad file1, file2, 0

.section .text
_start:
    mov x19, files
loop:

    ldr x0, [x19], 8
    cbz x0, exit
    bl unlink
    b loop
exit:
    mov x8, 60
    xor x0, x0
    svc 0

    .global _start
.section .data
    dir: .asciz "/path/to/directory"
    statbuf: .space 144