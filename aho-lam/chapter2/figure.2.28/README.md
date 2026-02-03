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

El analizador léxico reconoce números (NUM) como `/[0-9]+/` y identificadores (ID) como `/[a-zA-Z][a-zA-Z0-9]*/`. Los operadores y paréntesis son reconocidos como tokens individuales. Los espacios en blanco y los comentarios de línea (`// comentario`) son ignorados.

### Palabras reservadas

En el analizador léxico las palabras `true`y `false` son introducidas como palabras reservadas, pero en esta gramática no están contempladas. 

```java
    ...
    private Hashtable<String, Word> words = new Hashtable<>();
    void reserve(Word w) { words.put(w.lexeme, w); }
    ... 
    public Token scan() throws IOException {
        // Ignorar espacios en blanco y manejar comentarios
        for ( ; ; readch() ) {
            ...
        }

        // Manejar Números
        if ( Character.isDigit(peek) ) {
            ...
        }

        // Manejar Identificadores y Palabras Reservadas
        if ( Character.isLetter(peek) ) {
            StringBuilder b = new StringBuilder();
            int tokenLine = line; // Capturamos la línea actual
            do {
                b.append(peek);
                readch();
            } while ( Character.isLetterOrDigit(peek) );
            String s = b.toString();
            Word w = words.get(s);
            if (w != null) return new Word(s, w.tag, tokenLine); // Retornar copia con línea actual

            w = new Word(s, Tag.ID, tokenLine);
            words.put(s, w);
            return w;
        }

        Token t = new Token(peek, line);
        peek = ' ';
        return t;
    }
```



Si se encuentran estas palabras en la entrada, el programa lanzará un error indicando que se ha encontrado un factor inesperado señalando la línea y el token problemático:

```
➜  figure.2.28 git:(main) cat input-error.2.txt 
// Factor inesperado en línea 2 cerca de 'TRUE'
true%                                                                                                                          
➜  figure.2.28 git:(main) make error2          
cat input-error.2.txt | java Main

Factor inesperado en línea 2 cerca de 'TRUE'
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

### Manejo de errores

Con una entrada con errores:

```
➜  figure.2.28 git:(main) cat -n input-error.txt 
     1  20
     2  *
     3  (5-
     4  b/ // Factor inesperado en línea ...
     5  )%                                                                                                                     
➜  figure.2.28 git:(main) ✗ make error
cat input-error.txt | java Main
20 5 b 
Factor inesperado en línea 5 cerca de '')''
```

## Referencias

- Libro: *Compilers: Principles, Techniques, and Tools (2nd Edition)* Sección 2.6 "Lexical Analysis".
- Repo [lu1s/dragon-book-source-code](https://github.com/lu1s/dragon-book-source-code/tree/master)