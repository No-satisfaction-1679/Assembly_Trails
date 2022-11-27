%include "util.asm"
global _start

section .text

_start:
    mov rdi,msg
    call printstr 
    call readint ; Use atoi function which converts string to int 
    mov [user_value],rax ; Used bracket so that the value TO the variable address where is points not ON the variable address itself
    mov rbx,1

_multiply:
    mov rcx,[user_value]
    imul rcx,rbx ; Result will be saved on first register, so here it is RCX
    mov rdi,rcx
    call printint
    call endl
    add rbx,1
    cmp rbx,11 
    jne _multiply
    call exit0

section .data
    msg: db "Enter Number: ",0 ; Null byte 

section .bss
    user_value: resb 8

