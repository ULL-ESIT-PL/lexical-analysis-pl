CC = gcc
OPT = -O3 -std=c11
calc: lexer.c parser.c symboltable.h
	$(CC) $(OPT) lexer.c parser.c -o $@

lexer.h lexer.c: lexer.l
	flex --header-file=lexer.h -o lexer.c lexer.l 

parser.h parser.c: parser.y
	bison -d -v -o parser.c parser.y

example%: calc example%.calc
	./calc example$*.calc
clean:
	rm -f calc lexer.c lexer.h parser.c parser.h parser.output CMakeLists.txt 
