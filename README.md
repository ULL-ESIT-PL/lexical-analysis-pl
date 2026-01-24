See in the ULL OCW course [PROCESADORES DE LENGUAJES](https://campusvirtual.ull.es/ocw/course/view.php?id=45#section-0) the sections

* Folder [analisis-sintactico-con-yacc`](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/analisis-sintactico-con-yacc) contains a version of the examples in section [Análisis Sintáctico con yacc](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1835)
* Folder [expresiones-regulares-enflex] contains a version of the examples in section [Expresiones Regulares en Flex](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823)
* Folder [lex-lox](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/lex-lox) contains the [lexical analyzer of the lox interpreter](https://craftinginterpreters.com/scanning-on-demand.html#the-scanner-scans) from the book Crafting Interpreters. 
* Folder [.devcontainer](https://github.com/ULL-ESIT-PL/ocw-pl/tree/main/.devcontainer) contains a development container to work with the examples in a GitHub Codespace, installing flex, bison, etc. 

## Installing Flex in Codespaces

To install Flex in a GitHub Codespace, you can add the following commands to your `.devcontainer/Dockerfile`:

```Dockerfile
# Install Flex
RUN apt-get update && apt-get install -y flex
``` 