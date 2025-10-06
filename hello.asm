section .data
    msg db "Hello, Assembly!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; write(1, msg, len) -- macOS x86_64 syscall
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; exit(0) -- macOS x86_64 syscall
    mov rax, 0x2000001
    xor rdi, rdi
    syscall
