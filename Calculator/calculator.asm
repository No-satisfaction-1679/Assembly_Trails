%include "util.asm"

global _start

section .text

_start:
    ; Taking the input from user_num1 and storing them in location pointed by num1
    mov rdi,num1
    call printstr
    call readint
    mov [user_num1],rax
    ; Taking the input from user_num2 and storing them in location pointed by num2
    mov rdi,num2
    call printstr
    call readint
    mov [user_num2],rax
    ; Taking the input from user_operation and storing them in location pointed by operations
    mov rdi,operations 
    call printstr
    mov rdi,user_operation
    mov rsi,2
    call readstr

cmp_operations:
    mov rdi,[user_operation]
    cmp rdi,43 ; HEX of +
    je addition
    cmp rdi,45 ; HEX of -
    je subtraction
    cmp rdi,42 ; HEX of *
    je multiplication
    cmp rdi,47 ; HEX of / 
    je division
    cmp rdi,37 ; HEX of %
    je percentage 

exception:
    mov rdi,error_msg
    call printstr
    call endl
    call exit0

addition:
    mov rdi,[user_num1]
    add rdi,[user_num2]
    jmp results

subtraction:
    mov rdi,[user_num1]
    sub rdi,[user_num2]
    call results

multiplication:
    mov rdi,[user_num1]
    imul rdi,[user_num2]
    call results

division:
    mov rdx,0
    mov rax,[user_num1]
    mov rbx,[user_num2]
    idiv rbx
    mov rdi,rax
    call results

percentage:
    mov rdx,0
    mov rax,[user_num1]
    mov rbx,[user_num2]
    idiv rbx
    mov rdi,rdx
    call results

results:
    call printstr
    call endl
    call exit0

section .data
    num1: db "Enter Number 1: ",0
    num2: db "Enter Number 2: ",0
    operations: db "Choose an operation (+,-,*,/,%): ",0
    error_msg: db "Operation out of scope",0 
    
section .bss
    user_num1: resb 8
    user_num2: resb 8
    user_operation:resb 2 ; Here we given 2 bytes due to the fact that when user press enter it add as byte along side with operation he choosen, but that "enter button byte" will be removed the "util.asm"