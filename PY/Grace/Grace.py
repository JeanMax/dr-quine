#!/usr/bin/python

#
#   Grace.py
#

USEFUL_DEFINE1=42
USEFUL_DEFINE2=42
CODE='#!/usr/bin/python%c%c#%c#   Grace.py%c#%c%cUSEFUL_DEFINE1=42%cUSEFUL_DEFINE2=42%cCODE=%c%s%c%c%cf=open(%cGrace_kid.py%c, %cw%c)%cf.write(CODE %c (10, 10, 10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, 39, 39, 39, 39, 10, 37, 10, 10))%cf.close()%c'

f=open('Grace_kid.py', 'w')
f.write(CODE % (10, 10, 10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, 39, 39, 39, 39, 10, 37, 10, 10))
f.close()
