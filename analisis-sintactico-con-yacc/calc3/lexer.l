%{   
#include "parser.h"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}

/* The option yylineno makes flex increments yylineno automatically whenever \n is matched. 
Make yylineno visible to Bison by adding 
   extern int yylineno;
in the file parser.y and add a custom "yyerror" with line numbers 
*/
%option yylineno 
%option noyywrap


DIGIT    [0-9]
ID   [a-zA-Z_][a-zA-Z0-9_]*
%%
[ \t\r]+       ;
\n             ;
"//".*         {/* ignore single-line comments */}
"/*"([^*]|\*+[^*/])*\*+"/"   {/* ignore multi-line comments */}
"print"        {return PRINT;}
{ID} {
    yylval.sval = strdup(yytext);
    return ID;
}
"-"            {return MINUS;}
"+"            {return PLUS;}
"*"            {return MULT;}
"/"            {return DIV;}
"="            {return EQUAL;}
"("            {return L_PAREN;}
")"            {return R_PAREN;}
","            {return COMMA;}
(\.{DIGIT}+)|({DIGIT}+(\.{DIGIT}*)?([eE][+-]?[0-9]+)?)   {yylval.dval = atof(yytext); return NUMBER;}

.              {printf("Error at line %d: unrecognized symbol \"%s\"\n", yylloc.first_line, yytext); exit(0);}

%%
