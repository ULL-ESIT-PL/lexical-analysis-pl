##################################################
### Makefile for C Projects using GCC or Clang ###
##################################################

CFLAGS     = -Wall -Wextra -Og -g -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer
LDFLAGS    = -Og -g -fsanitize=address -fsanitize=undefined
LDLIBS     = -lm
TESTLDLIBS = -lm

scanner: scanner.c scanner.h
	gcc scanner_test.c scanner.c -o scanner_test

# Run all tests.
.PHONY: clean
clean: 
	rm -fR  *.o scanner_test

