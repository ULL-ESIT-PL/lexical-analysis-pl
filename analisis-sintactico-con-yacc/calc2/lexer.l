%{   
#include "parser.h"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}

%option yylineno
%option noyywrap


DIGIT    [0-9]
%%
[ \t\r]+       ;
\n             ;
"//".*         {/* ignore single-line comments */}
"/*"([^*]|\*+[^*/])*\*+"/"   {/* ignore multi-line comments */}
"print"        {return PRINT;}
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
