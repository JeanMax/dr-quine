/*
	Sully.c
*/
#define CODE "/*%c	Sully.c%c*/%c#define CODE %c%s%c%c%c#include <stdlib.h>%c#include <stdio.h>%c#include <string.h>%c%cint main() {%c	int i = %d;%c%c	if (i < 0) { // this test makes sense%c		return 0;%c	}%c%c	if (strchr(__FILE__, '_')) {%c		--i;%c	}%c%c	char filename[512];%c	char exename[512];%c	sprintf(filename, %cSully_%cd.c%c, i);%c	sprintf(exename, %c./Sully_%cd%c, i);%c%c	FILE *file = fopen(filename, %cw%c);%c	fprintf(file, CODE, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 37, 34, 10, 10, 34, 34, 10, 10, 10, 10, 10, 34, 37, 37, 34, 10, 10, 10, 10, 10, 10, 10);%c	fclose(file);%c%c	char cmd[1024];%c	sprintf(cmd, %cclang %cs -o %cs%c, filename, exename);%c	system(cmd);%c	if (i) {%c		system(exename);%c	}%c	return 0;%c}%c"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
	int i = 5;

	if (i < 0) { // this test makes sense
		return 0;
	}

	if (strchr(__FILE__, '_')) {
		--i;
	}

	char filename[512];
	char exename[512];
	sprintf(filename, "Sully_%d.c", i);
	sprintf(exename, "./Sully_%d", i);

	FILE *file = fopen(filename, "w");
	fprintf(file, CODE, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 34, 37, 34, 10, 10, 34, 34, 10, 10, 10, 10, 10, 34, 37, 37, 34, 10, 10, 10, 10, 10, 10, 10);
	fclose(file);

	char cmd[1024];
	sprintf(cmd, "clang %s -o %s", filename, exename);
	system(cmd);
	if (i) {
		system(exename);
	}
	return 0;
}
