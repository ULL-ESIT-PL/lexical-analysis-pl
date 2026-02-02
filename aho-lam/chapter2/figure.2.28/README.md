## Gramática

Véase el esquema de traducción para traducir de expresiones en infijo a postfijo en la figura 2.28 del libro *Compilers: Principles, Techniques, and Tools (2nd Edition)*.

```
expr   → expr + term { print('+') }
       | expr - term { print('-') }
       | term

term   → term * factor { print('*') }
       | term / factor { print('/') }
       | factor
factor → ( expr )
         | NUM        { print(NUM.value) }
         | ID         { print(ID.lexeme) }
```

## Ejecución del programa

Para compilar y ejecutar el programa que traduce expresiones infijas a postfijas, sigue estos pasos en tu terminal:

```bash
➜  figure.2.28 git:(main) ✗ javac *.java
```
Luego, ejecuta el programa con el siguiente comando:

```
➜  figure.2.28 git:(main) ✗ echo '(x + 5)*2' | java Main 
x 5 + 2 * 
```

También:

```
➜  figure.2.28 git:(main) ✗ java Main < input.txt 
2 5 b 4 / - * 
```

O simplemente:

```
➜  figure.2.28 git:(main) make clean; make run
rm -f *.class
javac Lexer.java
javac Main.java
cat input.txt | java Main
2 5 b 4 / - * 
```

Con una entrada con errores:

```
➜  figure.2.28 git:(main) make error
cat input-error.txt | java Main
20 5 b 
Factor inesperado en línea 4
```

## Referencias

- Libro: *Compilers: Principles, Techniques, and Tools (2nd Edition)* Sección 2.6 "Lexical Analysis".
- Repo [lu1s/dragon-book-source-code](https://github.com/lu1s/dragon-book-source-code/tree/master)