# Introducción al análisis de ámbito

Sigue la definición dirigida por la sintáxis de la Figura 2.38 de la sección 2.7 del libro "Compilers: Principles, Techniques, and Tools" de Aho, Lam, Sethi y Ullman para hacer el análisis de ámbito de un lenguaje minimal con bloques anidados y declaraciones de variables. El lenguaje admite frases como:

```C
{
    int x; char y;
    {
        bool y;
        x;
        y;
    }
    x;
    y;
}
```

```antlr
program → { top = null; } block
block → '{' 
            { stmts = top; top = new Env(top); print("{"); } 
            decls stmts 
        '}' {  top = saved; print("}"); }
decls → decl decls | ε
decl → type ID ';' {
                      s = new Symbol;
                      s.type = type.lexeme;
                      top.put(id.lexeme, s);
                }
stmts → stmt stmts | ε
stmt →  block | factor ';' { print(";"); }
factor → ID {
                      s = top.get(id.lexeme);
                      print(id.lexeme);
                      print(":" + s.type);
                }
```