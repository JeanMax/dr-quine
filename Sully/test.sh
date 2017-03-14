#!/bin/bash -x

SRC=Sully.c
EXE=Sully

clang -Wall -Wextra -Werror $SRC -o $EXE
./$EXE

for i in {5..0}; do
    son=Sully_$i
    diff --color=always $SRC $son.c
    rm -f $son $son.c
done
rm -f $EXE


SRC=Sully.py
./$SRC

for i in {5..0}; do
    son=Sully_$i.py
    diff --color=always $SRC $son
    rm -f $son
done
