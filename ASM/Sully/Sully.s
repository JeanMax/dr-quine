;
;    Sully.s
;

%define QUOTE 34
%define ENDL 10
%define UNDERSCORE 95
%define YAY 0
%define COUNTER 5

section .text
    global start
    global main
	extern strchr
    extern fopen
    extern fprintf
    extern fclose

start:
    call main
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

	mov rdi, [rsi]
	mov rsi, UNDERSCORE
	call strchr

	mov r9, COUNTER
	cmp rax, 0
	jne copy
	dec r9

copy:
    lea rdi, [rel filename]
    lea rsi, [rel oflags]
    call fopen

    mov rbx, rax
    mov rdi, rax
    mov rax, YAY
    lea rsi, [rel code]
    mov rdx, ENDL
    mov rcx, QUOTE
    mov r8, rsi
    call fprintf

    mov rdi, rbx
    call fclose

exec:
	cmp r9, 0
	je kthxbye
	;; call system

kthxbye:
    mov rax, YAY
    add rsp, 32
    pop rbp
    ret

section .data
    filename db "Sully_%d.s", 0
    exename db "./Sully_%d", 0
    oflags db "w", 0
    comp db "nasm -f macho64 --prefix _ Sully_%d.s -o tmp.o && clang tmp.o -o Sully_%d && rm -f tmp.o", 0
    code db "zboub%s", 0
