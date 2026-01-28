 %{
/* File: /home/pl/src/precedencia/hoc1/hoc1.y */
#define YYSTYPE int
#include <stdio.h>
#include <stdlib.h>

/* Declare yylex for the parser */
extern int yylex(void);
extern int yyparse(void);
extern FILE* yyin;
extern int yydebug;
int myDebug = 1;

/* Optional: For error reporting */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    if (argc > 1) yyin = fopen(argv[1],"r");
    //yydebug = 1;
    yyparse();
 }

%}
 
 %token NUMBER
 %left '+' '-'
 %left '*' '/'
 %%
 list
      :
      | list '\n'
      | list expr   { printf("result = %8i\n",$2);}
      ;

 expr
      : NUMBER { $$ = $1;}
      | expr '+' expr {$$ = $1 + $3;}
      | expr '-' expr {$$ = $1 - $3;}
      | expr '*' expr {$$ = $1 * $3;}
      | expr '/' expr {$$ = $1 / $3;}
      ;

  %%

