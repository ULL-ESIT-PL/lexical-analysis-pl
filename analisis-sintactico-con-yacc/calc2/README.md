This is a simple example of a calculator implemented using Bison (Yacc) and Flex (Lex). The calculator supports basic arithmetic operations such as addition, subtraction, multiplication, and division.

It is a bit more complex than the one in folder [calc1](../calc1) because 
it supports comments, unary minus, floats, parentheses, etc. See [example1.calc](example1.calc) for some test cases.    

``` 
➜  calc2 git:(main) make example1                                
bison -d -v -o parser.c parser.y
gcc -O3 -std=c11 lexer.c parser.c -o calc
./calc example1.calc
Reading from file example1.calc
6
-15
Error at line 7: syntax error, unexpected R_PAREN
```