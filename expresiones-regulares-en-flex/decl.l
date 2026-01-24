/*
See section Declaración de yylex() at the OCW course of ULL: https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823
$ cat decl.l
*/
%{
#define YY_DECL char *scanner(int *numcount, int *idcount)
%}
 
num [0-9]+
id [a-z]+
%%
{num} {(*numcount)++;}
halt  {return ((char *) strdup(yytext));}
{id}  {(*idcount)++;}
%%
int main() {
  int a,b;
  char *t;
 
  a = 0; b = 0;
  t = scanner(&a, &b);
  printf("numcount = %d, idcount = %d, yytext = %s\n",a,b,t);
  t = scanner(&a, &b);
  printf("numcount = %d, idcount = %d, yytext = %s\n",a,b,t);
}
 
int yywrap() {
  return 1;
}
/*
➜  expresiones-regulares-en-flex git:(main) ✗ make clean
rm -fR subst.c subst -fR subst.dSYM a.out lex.yy.c delete decl
➜  expresiones-regulares-en-flex git:(main) ✗ make decl
flex decl.l && gcc lex.yy.c -o decl; ./decl
32 a 45 b c halt
     numcount = 2, idcount = 3, yytext = halt

numcount = 2, idcount = 3, yytext = (null)
*/