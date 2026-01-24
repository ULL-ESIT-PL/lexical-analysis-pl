#include <stdio.h>
#include "scanner.h"

/* ⚠️ Important rule: The order of strings must match the enum exactly. If you change the enum for TokenTypein scanner.h, 
update the table. A good practice is to never insert enum values in the middle once established. */
const char* tokenTypeName(TokenType type) {
    static const char* names[] = {
        // Single-character tokens.
        "LEFT_PAREN",
        "RIGHT_PAREN",
        "LEFT_BRACE",
        "RIGHT_BRACE",
        "LEFT_SQUARE",
        "RIGHT_SQUARE",
        "COLON",
        "COMMA",
        "DOT",
        "MINUS",
        "PERCENT",
        "PLUS",
        "SEMICOLON",
        "SLASH",
        "STAR",

        // One or two character tokens.
        "BANG",
        "BANG_EQUAL",
        "EQUAL",
        "EQUAL_EQUAL",
        "GREATER",
        "GREATER_EQUAL",
        "LESS",
        "LESS_EQUAL",

        // Literals.
        "IDENTIFIER",
        "STRING",
        "NUMBER",

        // Keywords.
        "AND",
        "CLASS",
        "ELSE",
        "FALSE",
        "FOR",
        "FUN",
        "IF",
        "NIL",
        "OR",
        "PRINT",
        "RETURN",
        "SUPER",
        "THIS",
        "TRUE",
        "VAR",
        "WHILE",

        "ERROR",
        "EOF"
    };

    if (type < 0 || type >= (int)(sizeof(names) / sizeof(names[0]))) {
        return "UNKNOWN_TOKEN";
    }

    return names[type];
}

int main(int argc, char* argv[]) {

    char* source = (argc > 1) ? argv[1] : 
        "var x = 42;\n"
        "print x + 1;\n"
        "print \"hello world!\"";

    Scanner scanner;                      // <-- real instance
    initScanner(&scanner, source);        // <-- pass pointer

    for (;;) {
        Token token = scanToken(&scanner);  // <-- pass pointer

        printf(
            "type (number): %d type(name): %s lexeme: '%.*s' line: %d\n",
            token.type,
            tokenTypeName(token.type),
            token.length,
            token.start,
            token.line
        );

        if (token.type == TOKEN_EOF) break;
    }

    return 0;
}
