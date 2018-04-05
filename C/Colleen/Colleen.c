/*
    Colleen.c
*/
#define CODE "/*%c    Colleen.c%c*/%c#define CODE %c%s%c%c#include <stdio.h>%c%cstatic void print() {%c	printf(CODE, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main() {%c/*%c    this is the tricky part%c*/%c	print();%c	return 0;%c}%c"
#include <stdio.h>

static void print() {
	printf(CODE, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main() {
/*
    this is the tricky part
*/
	print();
	return 0;
}
