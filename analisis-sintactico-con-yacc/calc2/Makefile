CC = gcc
OPT = -O3 -std=c11
simple-c: lexer.c parser.c 
	$(CC) $(OPT) $^ -o $@

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l 

parser.h parser.c: parser.y
	bison -d -v -o parser.c parser.y

example1: simple-c example1.calc
	./simple-c example1.calc
	
clean:
	rm -f simple-c lexer.c lexer.h parser.c parser.h parser.output CMakeLists.txt
