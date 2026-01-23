hoc1: y.tab.c lex.yy.c
	gcc -DYYDEBUG=1 -g -o hoc1 y.tab.c lex.yy.c
y.tab.c y.tab.h: hoc1.y
	yacc -d -v hoc1.y
lex.yy.c: hoc1.l y.tab.h
	flex -l hoc1.l
clean:
	- rm -fR y.tab.c y.tab.h lex.yy.c *.o core hoc1 subst.dSYM
