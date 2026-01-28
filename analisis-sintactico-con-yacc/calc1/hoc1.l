%{
#include "y.tab.h"
extern YYSTYPE yylval;
extern int myDebug;
// declare atof
#include <stdlib.h>
%}
number [0-9]+
%%
\s+    ;
{number} { 
    yylval = atoi(yytext); 
    if (myDebug) {
        printf("number detected = %d\n", yylval);
    }
    return NUMBER; 
    }
.|\n     { 
    if (myDebug) {
        printf("char detected = %c\n", yytext[0]);
    }   
    return yytext[0];
    }
%%
int yywrap() { return 1; }

