This is a simple example of a calculator implemented using Bison (Yacc) and Flex (Lex). The calculator supports basic arithmetic operations such as identifiers, assignment, commas, addition, subtraction, multiplication,  division, etc.

It is a bit more complex than the one in folder [calc2](../calc2). See [example3.calc](example3.calc) for some test cases.    

``` 
➜  calc3 git:(main) ✗ make example3                                             
flex --header-file=lexer.h -o lexer.c lexer.l 
bison -d -v -o parser.c parser.y
gcc -O3 -std=c11 lexer.c parser.c -o calc
./calc example3.calc
Reading from file example3.calc
6
60
```