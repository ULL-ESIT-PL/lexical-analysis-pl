## Open Coursware PL at ULL: Flex examples

See the ULL OCW course [PROCESADORES DE LENGUAJES](https://campusvirtual.ull.es/ocw/course/view.php?id=45#section-0)

* Folder [expresiones-regulares-en-flex](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/expresiones-regulares-en-flex) contains a version of the examples in section [Expresiones Regulares en Flex](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823)

### Analisis Sintactico con yacc y flex

Folder [analisis-sintactico-con-yacc`](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/analisis-sintactico-con-yacc) contains a version of the examples in section [Análisis Sintáctico con yacc](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1835). 
A very simple calculator. 

Just run `make`.

```
@crguezl ➜ /workspaces/ocw-pl/analisis-sintactico-con-yacc (main) $ make
yacc -d -v hoc1.y
flex -l hoc1.l
gcc -DYYDEBUG=1 -g -o hoc1 y.tab.c lex.yy.c
```
To run the executable:

```
@crguezl ➜ /workspaces/ocw-pl/analisis-sintactico-con-yacc (main) $ ./hoc1 
2+3
number detected = 2
char detected = +
number detected = 3
char detected = 

result =        5
```

## Development Container for GitHub Codespaces

* Folder [.devcontainer](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/.devcontainer) contains a development container to work with the examples in a GitHub Codespace, installing flex, bison, etc. See the [Makefile](xpresiones-regulares-en-flex/Makefile).

# Lox Interpreter: C Lexical Analyzer
* Folder [lox/C](/lox/C) contains the C version of the [lexical analyzer of the lox interpreter](https://craftinginterpreters.com/scanning-on-demand.html#the-scanner-scans) from the book [Crafting Interpreters](https://craftinginterpreters.com/). 


## Testing the Java Lox Scanner

See file [java/com/craftinginterpreters/lox/ScannerTest.java](lox/java/com/craftinginterpreters/lox/ScannerTest.java) for a simple test of the lexical analyzer of the Lox interpreter in Java.

Build the Java version:

```
lox git:(main) ✗ make jlox
   javac java/com/craftinginterpreters/tool/GenerateAst.java          -Werror
   javac java/com/craftinginterpreters/lox/AstPrinter.java            -Werror
   javac java/com/craftinginterpreters/lox/Environment.java           -Werror
   javac java/com/craftinginterpreters/lox/Expr.java                  -Werror
   javac java/com/craftinginterpreters/lox/Interpreter.java           -Werror
   javac java/com/craftinginterpreters/lox/Lox.java                   -Werror
   javac java/com/craftinginterpreters/lox/LoxCallable.java           -Werror
   javac java/com/craftinginterpreters/lox/LoxClass.java              -Werror
   javac java/com/craftinginterpreters/lox/LoxFunction.java           -Werror
   javac java/com/craftinginterpreters/lox/LoxInstance.java           -Werror
   javac java/com/craftinginterpreters/lox/Parser.java                -Werror
   javac java/com/craftinginterpreters/lox/Resolver.java              -Werror
   javac java/com/craftinginterpreters/lox/Return.java                -Werror
   javac java/com/craftinginterpreters/lox/RuntimeError.java          -Werror
   javac java/com/craftinginterpreters/lox/Scanner.java               -Werror
   javac java/com/craftinginterpreters/lox/ScannerTest.java           -Werror
   javac java/com/craftinginterpreters/lox/Stmt.java                  -Werror
   javac java/com/craftinginterpreters/lox/Token.java                 -Werror
   javac java/com/craftinginterpreters/lox/TokenType.java             -Werror
➜  lox git:(main) ✗ java -cp build/java com.craftinginterpreters.lox.ScannerTest
```

To run it:

```
➜  lox git:(main) ✗ java -cp build/java com.craftinginterpreters.lox.ScannerTest
type: VAR lexeme:var literal: null line: 1
type: IDENTIFIER lexeme:x literal: null line: 1
type: EQUAL lexeme:= literal: null line: 1
type: NUMBER lexeme:42 literal: 42.0 line: 1
type: SEMICOLON lexeme:; literal: null line: 1
type: PRINT lexeme:print literal: null line: 2
type: IDENTIFIER lexeme:x literal: null line: 2
type: PLUS lexeme:+ literal: null line: 2
type: NUMBER lexeme:1 literal: 1.0 line: 2
type: SEMICOLON lexeme:; literal: null line: 2
type: PRINT lexeme:print literal: null line: 2
type: STRING lexeme:"hello world!" literal: hello world! line: 2
type: EOF lexeme: literal: null line: 2
```

