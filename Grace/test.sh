#!/bin/bash -ex

SRC=Grace.c
LOG=Grace_kid.c
EXE=test.out

clang -Wall -Wextra -Werror $SRC -o $EXE
./$EXE
diff --color=always $SRC $LOG || cat $LOG
rm $LOG $EXE


# bonus
SRC=Grace.py
LOG=Grace_kid.py

./$SRC
diff --color=always $SRC $LOG || cat $LOG
rm $LOG
