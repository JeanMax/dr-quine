;
;    Grace.s
;

%define QUOTE 34
%define ENDL 10

%macro FT 0
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    lea rdi, [rel filename]
    lea rsi, [rel oflags]
    call fopen

    mov rbx, rax
    mov rdi, rax
    mov rax, 0
    lea rsi, [rel code]
    mov rdx, ENDL
    mov rcx, QUOTE
    mov r8, rsi
    call fprintf

    mov rdi, rbx
    call fclose

    mov rax, 0
    add rsp, 16
    pop rbp
    ret
%endmacro

section .text
    global start
    global main
    extern fopen
    extern fprintf
    extern fclose

start:
    call main
    ret

FT

section .data
    filename db "Grace_kid.s", 0
    oflags db "w", 0
    code db ";%1$c;    Grace.s%1$c;%1$c%1$c%%define QUOTE 34%1$c%%define ENDL 10%1$c%1$c%%macro FT 0%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel oflags]%1$c    call fopen%1$c%1$c    mov rbx, rax%1$c    mov rdi, rax%1$c    mov rax, 0%1$c    lea rsi, [rel code]%1$c    mov rdx, ENDL%1$c    mov rcx, QUOTE%1$c    mov r8, rsi%1$c    call fprintf%1$c%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$c    mov rax, 0%1$c    add rsp, 16%1$c    pop rbp%1$c    ret%1$c%%endmacro%1$c%1$csection .text%1$c    global start%1$c    global main%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c%1$cstart:%1$c    call main%1$c    ret%1$c%1$cFT%1$c%1$csection .data%1$c    filename db %2$cGrace_kid.s%2$c, 0%1$c    oflags db %2$cw%2$c, 0%1$c    code db %2$c%3$s%2$c, 0%1$c", 0
