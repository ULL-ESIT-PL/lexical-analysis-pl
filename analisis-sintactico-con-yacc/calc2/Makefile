CC = gcc
OPT = -O3 -std=c11
calc: lexer.c parser.c 
	$(CC) $(OPT) $^ -o $@

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l 

parser.h parser.c: parser.y
	bison -d -v -o parser.c parser.y

example1: calc example1.calc
	./calc example1.calc
	
clean:
	rm -f calc lexer.c lexer.h parser.c parser.h parser.output CMakeLists.txt
