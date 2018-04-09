;
;    Sully.s
;

%define COUNTER 5

%define QUOTE 34
%define ENDL 10
%define UNDERSCORE 95
%define YAY 0

%define OFFSET_A 6
%define OFFSET_B 33
%define OFFSET_C 78
%define OFFSET_D 8


section .text
    global start
    global main
    extern strchr
    extern fopen
    extern fprintf
    extern fclose
    extern system

start:
    call main
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

_init_counter:
    mov rdi, [rsi]
    mov rsi, UNDERSCORE
    call strchr

    mov cl, COUNTER
    add cl, '0'
    cmp rax, 0
    je _open
    dec cl

_open:
    lea rsi, [rel oflags]
    lea rdi, [rel filename]
    mov [rdi + OFFSET_A], cl
    mov r13, rcx
    call fopen

_print:
    mov rbx, rax
    mov rdi, rax
    mov rax, YAY
    lea rsi, [rel code]
    mov rdx, ENDL
    mov rcx, QUOTE
    mov r8, rsi
    mov r9, r13
    call fprintf

_close:
    mov rdi, rbx
    call fclose

_comp:
    mov rcx, r13
    lea rdi, [rel comp]
    mov [rdi + OFFSET_B], cl
    mov [rdi + OFFSET_C], cl
    call system
    cmp cl, '0'
    je _kthxbye

_exec:
    mov rcx, r13
    lea rdi, [rel exename]
    mov [rdi + OFFSET_D], cl
    call system

_kthxbye:
    mov rax, YAY
    add rsp, 16
    leave
    ret

section .data
    oflags db "w", 0
    filename db "Sully_A.s", 0
    comp db "nasm -f macho64 --prefix _ Sully_B.s -o tmp.o && clang         tmp.o -o Sully_C && rm -f tmp.o", 0
    exename db "./Sully_D", 0
    code db ";%1$c;    Sully.s%1$c;%1$c%1$c%%define COUNTER %4$c%1$c%1$c%%define QUOTE 34%1$c%%define ENDL 10%1$c%%define UNDERSCORE 95%1$c%%define YAY 0%1$c%1$c%%define OFFSET_A 6%1$c%%define OFFSET_B 33%1$c%%define OFFSET_C 78%1$c%%define OFFSET_D 8%1$c%1$c%1$csection .text%1$c    global start%1$c    global main%1$c    extern strchr%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c    extern system%1$c%1$cstart:%1$c    call main%1$c    ret%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c%1$c_init_counter:%1$c    mov rdi, [rsi]%1$c    mov rsi, UNDERSCORE%1$c    call strchr%1$c%1$c    mov cl, COUNTER%1$c    add cl, '0'%1$c    cmp rax, 0%1$c    je _open%1$c    dec cl%1$c%1$c_open:%1$c    lea rsi, [rel oflags]%1$c    lea rdi, [rel filename]%1$c    mov [rdi + OFFSET_A], cl%1$c    mov r13, rcx%1$c    call fopen%1$c%1$c_print:%1$c    mov rbx, rax%1$c    mov rdi, rax%1$c    mov rax, YAY%1$c    lea rsi, [rel code]%1$c    mov rdx, ENDL%1$c    mov rcx, QUOTE%1$c    mov r8, rsi%1$c    mov r9, r13%1$c    call fprintf%1$c%1$c_close:%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$c_comp:%1$c    mov rcx, r13%1$c    lea rdi, [rel comp]%1$c    mov [rdi + OFFSET_B], cl%1$c    mov [rdi + OFFSET_C], cl%1$c    call system%1$c    cmp cl, '0'%1$c    je _kthxbye%1$c%1$c_exec:%1$c    mov rcx, r13%1$c    lea rdi, [rel exename]%1$c    mov [rdi + OFFSET_D], cl%1$c    call system%1$c%1$c_kthxbye:%1$c    mov rax, YAY%1$c    add rsp, 16%1$c    leave%1$c    ret%1$c%1$csection .data%1$c    oflags db %2$cw%2$c, 0%1$c    filename db %2$cSully_A.s%2$c, 0%1$c    comp db %2$cnasm -f macho64 --prefix _ Sully_B.s -o tmp.o && clang         tmp.o -o Sully_C && rm -f tmp.o%2$c, 0%1$c    exename db %2$c./Sully_D%2$c, 0%1$c    code db %2$c%3$s%2$c, 0%1$c", 0
