import java.io.*;
import java.util.*;

class Token {
    public final int tag;
    public Token(int t) { tag = t; }
}

class Tag {
    public final static int NUM = 256, ID = 257, TRUE = 258, FALSE = 259;
}

class Num extends Token {
    public final int value;
    public Num(int v) { super(Tag.NUM); value = v; }
}

class Word extends Token {
    public final String lexeme;
    public Word(String s, int tag) { super(tag); lexeme = s; }
}

class Lexer {
    public int line = 1;
    private char peek = ' ';
    private Hashtable<String, Word> words = new Hashtable<>();

    void reserve(Word w) { words.put(w.lexeme, w); }

    public Lexer() {
        reserve(new Word("true", Tag.TRUE));
        reserve(new Word("false", Tag.FALSE));
    }

    void readch() throws IOException { peek = (char) System.in.read(); }

    public Token scan() throws IOException {
        // Ignorar espacios en blanco y manejar comentarios
        for ( ; ; readch() ) {
            if ( peek == ' ' || peek == '\t' ) continue;
            else if ( peek == '\n' ) line++;
            else if ( peek == '/' ) { // Manejo de comentarios //
                readch();
                if (peek == '/') {
                    while (peek != '\n' && peek != (char)-1) readch();
                    continue;
                } else return new Token('/');
            }
            else break;
        }

        // Manejar Números
        if ( Character.isDigit(peek) ) {
            int v = 0;
            do {
                v = 10 * v + Character.digit(peek, 10);
                readch();
            } while ( Character.isDigit(peek) );
            return new Num(v);
        }

        // Manejar Identificadores y Palabras Reservadas
        if ( Character.isLetter(peek) ) {
            StringBuilder b = new StringBuilder();
            do {
                b.append(peek);
                readch();
            } while ( Character.isLetterOrDigit(peek) );
            String s = b.toString();
            Word w = words.get(s);
            if ( w != null ) return w;
            w = new Word(s, Tag.ID);
            words.put(s, w);
            return w;
        }

        Token t = new Token(peek);
        peek = ' ';
        return t;
    }
}
