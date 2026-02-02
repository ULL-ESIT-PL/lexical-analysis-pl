# Figure 2.27: Java program to translate infix expressions into postfix form 

## Definiciòn dirigida por la sintaxis

La definición dirigida por la sintáxis para traducir expresiones infijas a postfijas una vez eliminada la recursión por la izquierda aparece en la figura 2.23 (*Translation Scheme after left-recursion eliminatio*) del libro *Compilers: Principles, Techniques, and Tools (2nd Edition)*. 
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

Este programa en Java corresponde a la Figura 2.27 del libro "Compilers: Principles, Techniques, and Tools" de Aho, Lam, Sethi y Ullman. El programa traduce expresiones infijas a su forma postfija.

1. Compilar: Usa el comando `javac Postfix.java` en tu terminal.
2. Correr: Usa `java Postfix`.
3. Entrada: Escribe `9-5+2` y verás como salida `95-2+`.


```
➜  chapter2 git:(main) ✗ javac Postfix.java
➜  chapter2 git:(main) ✗ ls
Parser.class  Postfix.class Postfix.java
➜  chapter2 git:(main) ✗ java Postfix 
Escribe una expresión infija (ej: 9-5+2) y pulsa Enter:
9-5+2
95-2+
Traducción completada.
```