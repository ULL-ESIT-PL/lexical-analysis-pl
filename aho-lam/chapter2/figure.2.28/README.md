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