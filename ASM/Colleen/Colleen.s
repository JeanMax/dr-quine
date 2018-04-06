;
;    Colleen.s
;

%define QUOTE 34
%define ENDL 10
%define YAY 0

section .text
    global start
    global main
    extern printf

start:
    call main
    ret

anotherusefulfunction:
    ret

main:
;
;    this is the tricky part
;
    push rbp
    mov rbp, rsp

    lea rdi, [rel code]
    mov rsi, ENDL
    mov rdx, QUOTE
    mov rcx, rdi
    mov rax, YAY
    call printf
    call anotherusefulfunction

    mov rax, YAY
    pop rbp
    ret

section .data
    code db ";%1$c;    Colleen.s%1$c;%1$c%1$c%%define QUOTE 34%1$c%%define ENDL 10%1$c%%define YAY 0%1$c%1$csection .text%1$c    global start%1$c    global main%1$c    extern printf%1$c%1$cstart:%1$c    call main%1$c    ret%1$c%1$canotherusefulfunction:%1$c    ret%1$c%1$cmain:%1$c;%1$c;    this is the tricky part%1$c;%1$c    push rbp%1$c    mov rbp, rsp%1$c%1$c    lea rdi, [rel code]%1$c    mov rsi, ENDL%1$c    mov rdx, QUOTE%1$c    mov rcx, rdi%1$c    mov rax, YAY%1$c    call printf%1$c    call anotherusefulfunction%1$c%1$c    mov rax, YAY%1$c    pop rbp%1$c    ret%1$c%1$csection .data%1$c    code db %2$c%3$s%2$c, 0%1$c", 0
