/* file yytext-pointer.l */
%option main
%%
hello {
        strcat(yytext, " world");
        printf("\n%lu: %s\n",strlen(yytext),yytext);
      };
%%
/*
➜  expresiones-regulares-en-flex git:(main) ✗ make yytext-pointer
flex yytext-pointer.l && gcc lex.yy.c && ./a.out
hello

11: hello world

fatal flex scanner internal error--end of buffer missed
worldmake: *** [yytext-pointer] Error 2
*/