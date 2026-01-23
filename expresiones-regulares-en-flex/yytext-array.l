/* file yytext-array.l */
%option main
%array
%%
hello {
        strcat(yytext, " world");
        printf("\n%lu: %s\n",strlen(yytext),yytext);
      };
%%
/*
➜  expresiones-regulares-en-flex git:(main) ✗ flex yytext-array.l
➜  expresiones-regulares-en-flex git:(main) ✗ gcc lex.yy.c       
➜  expresiones-regulares-en-flex git:(main) ✗ ./a.out            
hello

11: hello world

world
world
hello

11: hello world
*/