#include <stdio.h>
#include "scanner.h"

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
            "type: %d lexeme: '%.*s' line: %d\n",
            token.type,
            token.length,
            token.start,
            token.line
        );

        if (token.type == TOKEN_EOF) break;
    }

    return 0;
}
