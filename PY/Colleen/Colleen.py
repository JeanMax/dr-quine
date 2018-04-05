#!/usr/bin/python

#
#   Colleen.py
#

CODE='#!/usr/bin/python%c%c#%c#   Colleen.py%c#%c%cCODE=%c%s%c%c%cdef print_it():%c    print(CODE %c (10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, 10, 37, 10, 10, 10, 10, 10, 10, 10, 10))%c%cdef main():%c#%c#   this is the tricky part%c#%c    print_it()%c%cmain()'

def print_it():
    print(CODE % (10, 10, 10, 10, 10, 10, 39, CODE, 39, 10, 10, 10, 37, 10, 10, 10, 10, 10, 10, 10, 10))

def main():
#
#   this is the tricky part
#
    print_it()

main()
