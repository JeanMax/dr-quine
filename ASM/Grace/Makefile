#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcanal <mcanal@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/29 13:16:03 by mcanal            #+#    #+#              #
#    Updated: 2018/04/07 12:48:50 by mc               ###   ########.fr        #
#                                                                              #
#******************************************************************************#

##
## CUSTOM CONFIG
##

# name of the binary to make
PROJECT ?= Grace

# file-names of the sources
SRC_NAME = Grace.s

# folder-names of the sources
SRC_PATH = .

# folder-names containing headers files
INC_PATH =

# extra libraries needed for linking
LDLIBS =

# linking flags
LDFLAGS =

# compilation flags
CPPFLAGS =


##
## GLOBAL VARIABLES
##

# compilation/linking flags for the differents public rules
WFLAGS = -Wextra -Wall  # warnings
RCFLAGS = $(WFLAGS) -Werror -O2  # release
DCFLAGS = $(WFLAGS) -g -DDEBUG  # debug
SCFLAGS = -fsanitize=address,undefined -ferror-limit=5  # sanitize
WWFLAGS = $(WFLAGS) -Wpedantic -Wshadow -Wconversion -Wcast-align \
  -Wstrict-prototypes -Wmissing-prototypes -Wunreachable-code -Winit-self \
  -Wmissing-declarations -Wfloat-equal -Wbad-function-cast -Wundef \
  -Waggregate-return -Wstrict-overflow=5 -Wold-style-definition -Wpadded \
  -Wredundant-decls  # moar warnings

# folder used to store all compilations sub-products (.o and .d mostly)
OBJ_DIR ?= obj
OBJ_PATH ?= $(OBJ_DIR)/rel
OBJ = $(addprefix $(OBJ_PATH)/, $(SRC_NAME:.s=.o))
DEP = $(OBJ:%.o=%.d)

# includes
INC = $(addprefix -I, $(INC_PATH))

# specify flags for commands used in the following rules
RM =		rm -f
RMDIR =		rmdir
MKDIR =		mkdir -p
MAKE ?=		make -j$(shell nproc 2>/dev/null || echo 4)
SUB_MAKE =	make -C
ifeq ($(shell uname), Linux)
CC =		clang -no-pie
ASM =		nasm -f elf64
else
CC =		clang
ASM =		nasm -f macho64 --prefix _
endif

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
	+$(MAKE) $(PROJECT) "CFLAGS = $(RCFLAGS)" "OBJ_PATH = $(OBJ_DIR)/rel"

# build for gdb/valgrind debugging
dev:
	+$(MAKE) $(PROJECT).dev "PROJECT = $(PROJECT).dev" "CFLAGS = $(DCFLAGS)" \
		"OBJ_PATH = $(OBJ_DIR)/dev" "CPPFLAGS = -F dwarf"

# build for runtime debugging (fsanitize)
san:
	+$(MAKE) $(PROJECT).san "PROJECT = $(PROJECT).san" "CFLAGS = $(DCFLAGS)" \
		"CPPFLAGS = -F dwarf" "LDFLAGS = $(SCFLAGS)" "OBJ_PATH = $(OBJ_DIR)/san"

# masochist build
mecry:
	+$(MAKE) $(PROJECT) "CFLAGS = $(WWFLAGS)" "OBJ_PATH = $(OBJ_DIR)/rel"

# remove all generated .o and .d
clean:
	$(RM) $(OBJ) $(DEP)
	$(RM) $(OBJ:$(OBJ_DIR)/rel%=$(OBJ_DIR)/dev%) $(DEP:$(OBJ_DIR)/rel%=$(OBJ_DIR)/dev%)
	$(RM) $(OBJ:$(OBJ_DIR)/rel%=$(OBJ_DIR)/san%) $(DEP:$(OBJ_DIR)/rel%=$(OBJ_DIR)/san%)
	test -d $(OBJ_DIR) && find $(OBJ_DIR) -name '*.[od]' | xargs $(RM) || true
	$(RM) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)

# remove the generated binary, and all .o and .d
fclean: clean
	test -d $(OBJ_DIR) && find $(OBJ_DIR) -type d | sort -r | xargs $(RMDIR) || true
	$(RM) $(PROJECT){,.san,.dev}
	$(RM) test{,.san,.dev}

# some people like it real clean
mrproper:
	$(RM) -r $(OBJ_DIR)
	+$(MAKE) fclean

# clean build and recompile
re: fclean
	+$(MAKE) all

# run tests on project
test: all
	printf "#!/bin/bash -ex\n\n$(RM) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n./$(PROJECT)\ndiff $(SRC_PATH)/$(SRC_NAME) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n" > test
	chmod a+x test
	./test

# run tests on project (debug mode)
testdev: dev
	printf "#!/bin/bash -ex\n\n$(RM) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n./$(PROJECT).dev\ndiff $(SRC_PATH)/$(SRC_NAME) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n" > test.dev
	chmod a+x test.dev
	./test.dev

# run tests on project (sanitize mode)
testsan: san
	printf "#!/bin/bash -ex\n\n$(RM) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n./$(PROJECT).san\ndiff $(SRC_PATH)/$(SRC_NAME) $(SRC_PATH)/$(SRC_NAME:.s=_kid.s)\n" > test.san
	chmod a+x test.san
	./test.san


##
## PRIVATE RULES
##

# create binary (link)
$(PROJECT): $(OBJ)
	$(CC) $(CFLAGS) $(INC) $(LDFLAGS) $(OBJ) $(LDLIBS) -o $@

# create object files (compile)
$(OBJ_PATH)/%.o: $(SRC_PATH)/%.s | $(OBJ_PATH)
	$(ASM) $(CPPFLAGS) $(CFLAGS) $(INC) -MD $(@:%.o=%.d) $< -o $@

# create directory for compilation sub-products
$(OBJ_PATH):
	$(MKDIR) $(dir $(OBJ))

# read dependencies list generated by -MMD flag
-include $(DEP)

# just to avoid conflicts between rules and files/folders names
.PHONY: all, dev, san, mecry, $(PROJECT), clean, fclean, mrproper, re, test, testdev, testsan
