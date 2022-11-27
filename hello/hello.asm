global_start
section .text
_start:
    mov rax,1 ; 2. Then it get's to know if we are conducting write sys call since we used 1
    mov rdi,1 ; 3. This is first argument for the write sys call that is file discriptor and within that we used 1 (output)
    mov rsi,hello ; 4. Second argument is buffer that points to hello buff => hello => 'hello world'
    mov rdx,11 ; 5. Third argument count is used to declare the size of the buffer
    syscall ; 1. The program look for this 

    ;exit
    mov rax,60 ; exit the syscall 
    mov rdi,8 ; status code 8
    syscall 
section .data
    hello: db 'hello world'