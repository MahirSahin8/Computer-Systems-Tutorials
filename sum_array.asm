section .data
    arr dq 3, 5, 8, 13, 21
    n   equ 5

    nl  db 0xA
    fmt db "Sum = ", 0

section .text
    global _start

_start:
    xor rax, rax            ; sum = 0
    xor rcx, rcx            ; i = 0
    lea rbx, [rel arr]      ; dizinin taban adresini RIP-relative al

.loop:
    cmp rcx, n
    jge .print
    add rax, [rbx + rcx*8]  ; rax += arr[i]
    inc rcx
    jmp .loop

.print:
    ; "Sum = " yaz
    mov rdx, 6
    lea rsi, [rel fmt]
    mov rdi, 1
    mov rax, 0x2000004      ; write
    syscall

    ; newline
    mov rdx, 1
    lea rsi, [rel nl]
    mov rdi, 1
    mov rax, 0x2000004      ; write
    syscall

    ; çık
    mov rax, 0x2000001      ; exit
    xor rdi, rdi
    syscall
