.global main
main:
    // Open file
    mov x0, #0x2
    adr x1, filename
    mov x2, #0x0
    svc #0x80

    // Write to file
    mov x0, #0x1
    mov x1, x0
    adr x2, message
    mov x3, #0x5
    svc #0x80

    // Close file
    mov x0, #0x3
    svc #0x80

    // Exit
    mov x0, #0x0
    ret

filename: .ascii "example.txt\0"
message: .ascii "Hello, world!\n\0"