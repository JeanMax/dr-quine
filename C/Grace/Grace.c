/*
	Grace.c
*/
#define USEFUL_DEFINE 42

#define CODE "/*%c	Grace.c%c*/%c#define USEFUL_DEFINE 42%c%c#define CODE %c%s%c%c%c#include <stdio.h>%c%c#define FT(x) int main() {%c%c	FILE *file = fopen(%cGrace_kid.c%c, %cw%c);%c%c	fprintf(file, CODE, 10, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 92, 10, 34, 34, 34, 34, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10, 10);%c%c	fclose(file);%c%c	return 0;%c%c}%c%cFT()%c"

#include <stdio.h>

#define FT(x) int main() {\
	FILE *file = fopen("Grace_kid.c", "w");\
	fprintf(file, CODE, 10, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 92, 10, 34, 34, 34, 34, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10, 10);\
	fclose(file);\
	return 0;\
}

FT()
