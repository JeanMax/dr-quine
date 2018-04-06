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

prolog:
    push rbp
    mov rbp, rsp
    ret

epilog:
    mov eax, YAY
    pop rbp
    ret

main:
;
;    this is the tricky part
;
    call prolog

    lea edi, [rel code]
    mov esi, ENDL
    mov edx, QUOTE
    lea ecx, [rel code]
    mov eax, YAY
    call printf

    call epilog
    ret

section .data
    code db ";%1$c;    Colleen.s%1$c;%1$c%1$c%%define QUOTE 34%1$c%%define ENDL 10%1$c%%define YAY 0%1$c%1$csection .text%1$c    global start%1$c    global main%1$c    extern printf%1$c%1$cstart:%1$c    call main%1$c    ret%1$c%1$cprolog:%1$c    push rbp%1$c    mov rbp, rsp%1$c    ret%1$c%1$cepilog:%1$c    mov eax, YAY%1$c    pop rbp%1$c    ret%1$c%1$cmain:%1$c;%1$c;    this is the tricky part%1$c;%1$c    call prolog%1$c%1$c    lea edi, [rel code]%1$c    mov esi, ENDL%1$c    mov edx, QUOTE%1$c    lea ecx, [rel code]%1$c    mov eax, YAY%1$c    call printf%1$c%1$c    call epilog%1$c    ret%1$c%1$csection .data%1$c    code db %2$c%3$s%2$c%1$c"
