#!/bin/bash -ex

SRC=Colleen.c
LOG=test.log
EXE=test.out

clang -Wall -Wextra -Werror $SRC -o $EXE
./$EXE > $LOG
diff --color=always $SRC $LOG || cat $LOG
rm $LOG $EXE


# bonus
SRC=Colleen.py

./$SRC > $LOG
diff --color=always $SRC $LOG || cat $LOG
rm $LOG
