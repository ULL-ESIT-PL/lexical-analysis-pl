This folder contains the [lexical analyzer of the lox interpreter](https://craftinginterpreters.com/scanning-on-demand.html#the-scanner-scans). 

```
@crguezl ➜ /workspaces/ocw-pl/lex-lox (main) $ make clean
rm -fR  *.o testlexer@crguezl ➜ /workspaces/ocw-pl/lex-lox (main) $ make
gcc  -I. scanner.c testlexer.c -o testlexer
@crguezl ➜ /workspaces/ocw-pl/lex-lox (main) $ ./testlexer 
type: 40 lexeme: 'var' line: 1
type: 23 lexeme: 'x' line: 1
type: 17 lexeme: '=' line: 1
type: 25 lexeme: '42' line: 1
type: 12 lexeme: ';' line: 1
type: 35 lexeme: 'print' line: 2
type: 23 lexeme: 'x' line: 2
type: 11 lexeme: '+' line: 2
type: 25 lexeme: '1' line: 2
type: 12 lexeme: ';' line: 2
type: 35 lexeme: 'print' line: 3
type: 24 lexeme: '"hello world!"' line: 3
type: 43 lexeme: '' line: 3
```