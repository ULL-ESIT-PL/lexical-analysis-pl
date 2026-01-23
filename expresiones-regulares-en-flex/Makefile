subst: subst.c 
	gcc -DYYDEBUG=1 -g -o subst subst.c 
subst.c: subst.l 
	flex -o subst.c -l subst.l
delete: delete.l 
	flex delete.l && gcc lex.yy.c -lfl -o delete; ./delete
yytext-array: yytext-array.l 
	flex yytext-array.l && gcc lex.yy.c && ./a.out
yytext-pointer: yytext-pointer.l 
	flex yytext-pointer.l && gcc lex.yy.c && ./a.out
clean:
	- rm -fR subst.c subst -fR subst.dSYM a.out lex.yy.c delete
