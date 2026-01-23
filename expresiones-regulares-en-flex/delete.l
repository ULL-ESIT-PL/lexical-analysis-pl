/* delete all entries of zap me. Seccion "Suprimir" del curso OCW de la ULL: https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823 */
%option main
%%
"zap me"
%%
/*
$ flex delete.l ; gcc lex.yy.c -lfl -o delete; ./delete
this is zap me a first zap me phrase <- input
this is  a first  phrase             <- output
*/