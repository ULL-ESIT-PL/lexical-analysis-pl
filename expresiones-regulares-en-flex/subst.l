/* Véase sección "Ejemplo Simple" en el curso OCW de la ULL: https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823 */
%option main
%{
#include <unistd.h>
%}
%%
username    printf("%s",  getlogin());
.+          printf("You wrote this: (%s)",  yytext);
%%
/*
➜  expresiones-regulares-en-flex git:(main) ✗ flex -o subst.c  subst.l
➜  expresiones-regulares-en-flex git:(main) ✗ gcc -o subst subst.c
➜  expresiones-regulares-en-flex git:(main) ✗ ./subst 
username
casianorodriguezleon
hello world
You wrote this: (hello world)
*/