# Figure 2.27: Java program to translate infix expressions into postfix form 

## Definiciòn dirigida por la sintaxis

La definición dirigida por la sintáxis para traducir expresiones infijas a postfijas en la figura 2.21:

```
expr  → expr + term { print('+') }
         | expr - term { print('-') }
         | term

term  → 0 { print('0') }
         | 1 { print('1') }
         | 2 { print('2') }
         | 3 { print('3') }
         | 4 { print('4') }
         | 5 { print('5') }     
         | 6 { print('6') }
         | 7 { print('7') }
         | 8 { print('8') }
         | 9 { print('9') }
```
Una vez eliminada la recursión por la izquierda aparece en la figura 2.23 (*Translation Scheme after left-recursion eliminatio*) en la sección 2.5 *A Translator for Simple Expressions* (pág 71) del libro *Compilers: Principles, Techniques, and Tools (2nd Edition)*. 

Para simplificar no hay espacios en blanco y los números son de un solo dígito:

```
expr   → term rest

rest   → + term { print('+') } rest
         | - term { print('-') } rest
         | ε

term   → 0 { print('0') }
         | 1 { print('1') }
         | 2 { print('2') }
         | 3 { print('3') }
         | 4 { print('4') }
         | 5 { print('5') }
         | 6 { print('6') }
         | 7 { print('7') }
         | 8 { print('8') }
         | 9 { print('9') }
```

## Descripción del programa

Este [programa en Java](Postfix.java) corresponde a la Figura 2.27 del libro "Compilers: Principles, Techniques, and Tools" de Aho, Lam, Sethi y Ullman. El programa traduce expresiones infijas a su forma postfija.

1. Compilar: Usa el comando `javac Postfix.java` en tu terminal.
2. Correr: Usa `java Postfix`.
3. Entrada: Escribe `9-5+2` y verás como salida `95-2+`.


```
➜  figure.2.27 git:(main) ✗ make clean
rm -f *.class
➜  figure.2.27 git:(main) ✗ make run  
javac Postfix.java
echo '5+4-3' | java Postfix
Escribe una expresión infija (ej: 9-5+2) y pulsa Enter:
54+3-
Traducción completada.
```

Se ha extendido el programa para manejar mejor los errores de sintaxis, añadiendo el control del 
conjunto FOLLOW de la variable `expr` :

```
➜  figure.2.27 git:(main) make error
javac Postfix.java
echo '5+x' | java Postfix
Escribe una expresión infija (ej: 9-5+2) y pulsa Enter:
5Exception in thread "main" java.lang.Error: Error de sintaxis: se esperaba un dígito pero se encontró 'x'.
        at Parser.term(Postfix.java:47)
        at Parser.expr(Postfix.java:20)
        at Postfix.main(Postfix.java:67)
make: *** [error] Error 1
➜  figure.2.27 git:(main) ✗ make error2
echo '5*y' | java Postfix
Escribe una expresión infija (ej: 9-5+2) y pulsa Enter:
5Exception in thread "main" java.lang.Error: Error de sintaxis: se esperaba un operador '+' o '-' pero se. encontró '*'.
        at Parser.expr(Postfix.java:33)
        at Postfix.main(Postfix.java:67)
make: *** [error2] Error 1
```