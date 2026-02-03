import java.io.*;
import java.util.*;

class Token {
    public final int tag;
    public final int lineNum; // Almacena la línea donde se encontró el token
    public Token(int t, int line) { tag = t; lineNum = line; }
    public String tokenName() {
        // Si el tag es < 256, es un carácter simple (ASCII)
        if (tag < 256) return "'" + (char)tag + "'";
        
        switch (tag) {
            case Tag.NUM: return "NUM";
            case Tag.ID: return "ID";
            case Tag.TRUE: return "TRUE";
            case Tag.FALSE: return "FALSE";
            default: return Integer.toString(tag);
        }
    }
}

class Tag {
    public final static int NUM = 256, ID = 257, TRUE = 258, FALSE = 259;
}

class Num extends Token {
    public final int value;
    public Num(int v, int line) { super(Tag.NUM, line); value = v; }
}

class Word extends Token {
    public final String lexeme;
    public Word(String s, int tag, int line) { super(tag, line); lexeme = s; }
}

class Lexer {
    public int line = 1;
    private char peek = '\0';
    private Hashtable<String, Word> words = new Hashtable<>();

    void reserve(Word w) { words.put(w.lexeme, w); }

    public Lexer() throws IOException { // constructor
        readch();
        reserve(new Word("true", Tag.TRUE, 0));
        reserve(new Word("false", Tag.FALSE, 0));

    }

    void readch() throws IOException { peek = (char) System.in.read(); }

    Boolean isNotEOF() {
        return peek != (char)-1; // -1 indica EOF en Java
    }

    public Token scan() throws IOException {
        // Ignorar espacios en blanco y manejar comentarios
        for ( ; ; readch() ) {
            if ( peek == ' ' || peek == '\t' ) continue;
            else if ( peek == '\n' ) { line++; continue; }
            else if ( peek == '/' ) { // Manejo de comentarios //
                readch();
                if (peek == '/') {
                    while (peek != '\n' && isNotEOF()) readch();
                    if (peek == '\n') line++;
                    continue;
                } else return new Token('/', line); // No es un comentario      
            }
            else break;
        }

        // Manejar Números
        if ( Character.isDigit(peek) ) {
            int v = 0;
            int tokenLine = line; // Capturamos la línea actual
            do {
                v = 10 * v + Character.digit(peek, 10);
                readch();
            } while ( Character.isDigit(peek) );
            return new Num(v, tokenLine);
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
}
