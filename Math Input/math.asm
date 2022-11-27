global main

section .text
main:
    mov rax,2
    add rax,3

    mov rdi,3
    sub rdi,3

    mov rsi,12
    imul rsi,rsi,2

    mov rdx,0   ; Since rdx register gets attached to rax turning 100 into 0100
    mov rax,100 ; Can't use rdx here due to its attachment to rax 
    mov rbx,2
    idiv rbx

_exit:
    mov rax,60
    mov rdi,22
    syscall


    