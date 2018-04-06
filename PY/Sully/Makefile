#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcanal <mcanal@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/29 13:16:03 by mcanal            #+#    #+#              #
#    Updated: 2018/04/06 14:36:42 by mc               ###   ########.fr        #
#                                                                              #
#******************************************************************************#

##
## CUSTOM CONFIG
##

# name of the binary to make
PROJECT ?= Sully

# file-names of the sources
SRC_NAME = Sully.py

# folder-names of the sources
SRC_PATH = .


##
## GLOBAL VARIABLES
##

# specify flags for commands used in the following rules
RM =		rm -f
RMDIR =		rmdir
MKDIR =		mkdir -p
MAKE ?=		make -j$(shell nproc 2>/dev/null || echo 4)
SUB_MAKE =	make -C
PY =		/usr/bin/env python

# default to "pretty" Makefile, but you can run ´VERBOSE=t make´
# ifndef VERBOSE
#  ifndef TRAVIS
# .SILENT:
#  endif
# endif
# PRINTF = test $(VERBOSE)$(TRAVIS) || printf

# some colors for pretty printing
WHITE =		\033[37m
RED =		\033[31m
GREEN =		\033[32m
YELLOW =	\033[33m
BLUE =		\033[34m
BASIC =		\033[0m


##
## PUBLIC RULES
##

# release build
all:
	+$(MAKE) $(PROJECT)

# remove all generated cache
clean:
	$(RM) -r __pycache__
	$(RM) $(PROJECT)_[0-9] $(PROJECT)_[0-9].py

# remove the generated binary, and all cache
fclean: clean
	$(RM) $(PROJECT)
	$(RM) test

# clean build and recompile
re: fclean
	+$(MAKE) all

# run tests on project
test: all
	printf "#!/bin/bash -ex\n\n$(RM) $(PROJECT)_*\n./$(PROJECT)\ndiff $(PROJECT)_5.py $(PROJECT).py\nfor i in {5..1}; do\n diff $(PROJECT)_""$$""((i-1)).py $(PROJECT)_""$$""i.py || true\n done\n" > test
	chmod a+x test
	./test

##
## PRIVATE RULES
##

# create binary (link)
$(PROJECT): $(SRC_PATH)/$(SRC_NAME)
	printf "#!/bin/bash\n\n$(PY) $(PWD)/$<\n" > $@
	chmod a+x $@

# just to avoid conflicts between rules and files/folders names
.PHONY: all, $(PROJECT), clean, fclean, re, test
