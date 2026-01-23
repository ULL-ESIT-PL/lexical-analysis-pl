/* delete all entries of zap me */
%option main
%%
"zap me"
%%
/*
$ flex delete.l ; gcc lex.yy.c -lfl; a.out
this is zap me a first zap me phrase <- input
this is  a first  phrase             <- output
*/