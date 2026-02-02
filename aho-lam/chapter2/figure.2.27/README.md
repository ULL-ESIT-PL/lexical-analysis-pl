# Figure 2.27: Java program to translate infix expressions into postfix form 

Este programa en Java corresponde a la Figura 2.27 del libro "Compilers: Principles, Techniques, and Tools" de Aho, Lam, Sethi y Ullman. El programa traduce expresiones infijas a su forma postfija.

1. Compilar: Usa el comando javac Postfix.java en tu terminal.
2. Correr: Usa java Postfix.
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