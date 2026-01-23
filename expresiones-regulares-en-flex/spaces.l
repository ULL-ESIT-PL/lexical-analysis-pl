/* > cat spaces.l 
Véase sección "Espacios en blanco dentro de la expresión regular" en https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823
*/
%option main
%%
one two { printf("spaces\n"); }
%%
/*
➜  expresiones-regulares-en-flex git:(main) ✗ flex spaces.l
➜  expresiones-regulares-en-flex git:(main) ✗ gcc lex.yy.c 
spaces.l:4:1: error: use of undeclared identifier 'two'
    4 | two { printf("spaces\n"); }
      | ^
1 error generated.
SOLUCION: Deberíamos escapar el blanco entre one y two o bien proteger la cadena poniéndola entre comillas: "one two".
*/