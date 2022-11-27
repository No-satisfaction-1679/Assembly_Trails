global_start

section .text

_start:
    mov rax,1
    mov rdi,1
    mov rsi,hello
    mov rdx,helloLength
    syscall
    ; jmp _exiting ; Usage of lablels in 

_input:
    mov rax,0
    mov rdi,0
    mov rsi,input
    mov rdx,100
    syscall
    mov rbx,rax ; Saving the rax register input data for 
                ; "_printing_username" label since it needs the length of rax register during this time, which will be override in next operation
                ; hence copying it rbx and pasting it rdx of "_printing_username:""

_printing:
    mov rax,1
    mov rdi,1
    mov rsi,print
    mov rdx,printLength
    syscall

_printing_username:
    mov rax,1
    mov rdi,1
    mov rsi,input
    mov rdx,rbx
    syscall

_exiting:
    mov rax,60
    mov rdi,22
    syscall
    
section .data
    hello: db "Enter your name: "
    helloLength: equ $-hello
    print: db "hello, "
    printLength: equ $-print

section .bss
    input: resb 100 ; reserving bytes of size hundred
