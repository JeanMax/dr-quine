;
;    Colleen.s
;

section .text
global start
global _main
extern _printf

start:
    call _main
    ret

another_useful_function:
	ret

_main:
;
;    this is the tricky part
;
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rax, 0
    lea rdi, [rel code]
    lea rsi, [rel code]
    call _printf

	call another_useful_function
    leave
    ret

section .data
    code db ";", 10, ";    Colleen.s", 10, ";", 10, 10, "section .text", 10, "global start", 10, "global _main", 10, "extern _printf", 10, 10, "start:", 10, "    call _main", 10, "    ret", 10, 10, "_main:", 10, ";", 10, ";    this is the tricky part", 10, ";", 10, "    push rbp", 10 , "    mov rbp, rsp", 10, "    sub rsp, 16", 10, 10, "    mov rax, 0", 10, "    lea rdi, [rel code]", 10, "    call _printf", 10, 10, "    leave", 10, "    ret", 10, 10, "section .data", 10, "    code db %s", 10
