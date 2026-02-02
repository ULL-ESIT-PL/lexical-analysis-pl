import java.io.*;

class Parser {
    static int lookahead;

    public Parser() throws IOException {
        lookahead = System.in.read();
    }

    // Corresponde a la regla de la gramática para expresiones
    void expr() throws IOException {
        term();
        while (true) {
            if (lookahead == '+') {
                match('+');
                term();
                System.out.print('+');
            } else if (lookahead == '-') {
                match('-');
                term();
                System.out.print('-');
            } else {
                return;
            }
        }
    }

    // Corresponde a la regla para los operandos (dígitos)
    void term() throws IOException {
        if (Character.isDigit((char) lookahead)) {
            System.out.print((char) lookahead);
            match(lookahead);
        } else {
            throw new Error("Error de sintaxis: se esperaba un dígito.");
        }
    }

    // Compara el símbolo actual y avanza al siguiente
    void match(int t) throws IOException {
        if (lookahead == t) {
            lookahead = System.in.read();
        } else {
            throw new Error("Error de sintaxis: carácter inesperado.");
        }
    }
}

public class Postfix {
    public static void main(String[] args) throws IOException {
        System.out.println("Escribe una expresión infija (ej: 9-5+2) y pulsa Enter:");
        Parser parse = new Parser();
        parse.expr();
        System.out.println("\nTraducción completada.");
    }
}
