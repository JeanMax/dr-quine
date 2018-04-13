#!/usr/bin/python

#
#   Sully.py
#

import os
import sys

CODE='#!/usr/bin/python%c%c#%c#   Sully.py%c#%c%cimport os%cimport sys%c%cCODE=%c%s%c%c%ci=%d%cif i < 0:%c    sys.exit(0)%cif %c_%c in __file__:%c    i -= 1%cfilename=%cSully_%cd.py%c %c i%cf=open(filename, %cw%c)%cf.write(CODE %c (10, 10, 10, 10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, i, 10, 10, 10, 39, 39, 10, 10, 39, 37, 39, 37, 10, 39, 39, 10, 37, 10, 10, 10, 39, 39, 10))%cf.close()%cif i:%c    os.system(%cpython %c + filename)%c'

i=5
if i < 0:
    sys.exit(0)
if '_' in __file__:
    i -= 1
filename='Sully_%d.py' % i
f=open(filename, 'w')
f.write(CODE % (10, 10, 10, 10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, i, 10, 10, 10, 39, 39, 10, 10, 39, 37, 39, 37, 10, 39, 39, 10, 37, 10, 10, 10, 39, 39, 10))
f.close()
if i:
    os.system('python ' + filename)
