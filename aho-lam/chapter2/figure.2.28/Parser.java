import java.io.*;
import java.util.*;

class Parser {
    private Lexer lex;
    private Token lookahead;

    public Parser(Lexer l) throws IOException { lex = l; move(); }

    void move() throws IOException { lookahead = lex.scan(); }

    void error(String message) {
        throw new Error("\n[ERROR SINTÁCTICO] Línea " + lookahead.lineNum + ": " + message + 
          " (se encontró: '" + lookahead.tokenName()+"')");
    }

    void match(int t) throws IOException {
        if (lookahead.tag == t) move();
        else error("Se esperaba un símbolo diferente");
    }

    public void analyze() throws IOException {
        expr();
        if (lookahead.tag != (char)-1) error("Símbolo inesperado después de la expresión");
    }

    void expr() throws IOException {
        term();
        while (lookahead.tag == '+' || lookahead.tag == '-') {
            int op = lookahead.tag;
            move(); term();
            System.out.print((char)op + " ");
        }
    }

    void term() throws IOException {
        factor();
        while (lookahead.tag == '*' || lookahead.tag == '/') {
            int op = lookahead.tag;
            move(); factor();
            System.out.print((char)op + " ");
        }
    }

    void factor() throws IOException {
        if (lookahead.tag == '(') {
            match('('); expr(); match(')');
        } else if (lookahead.tag == Tag.NUM) {
            System.out.print(((Num)lookahead).value + " ");
            match(Tag.NUM);
        } else if (lookahead.tag == Tag.ID) {
            System.out.print(((Word)lookahead).lexeme + " ");
            match(Tag.ID);
        } else {
            throw new Error("Factor inesperado en línea " + lookahead.lineNum+" cerca de '"+lookahead.tokenName()+"'");
        }
    }
}
