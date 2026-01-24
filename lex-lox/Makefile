##################################################
### Makefile for C Projects using GCC or Clang ###
##################################################

CFLAGS     = -Wall -Wextra -Og -g -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer
LDFLAGS    = -Og -g -fsanitize=address -fsanitize=undefined
LDLIBS     = -lm
TESTLDLIBS = -lm

testlexer: scanner.c scanner.h testlexer.c
	gcc  -I. scanner.c testlexer.c -o testlexer

# Run all tests.
.PHONY: clean
clean: 
	rm -fR  *.o testlexer

