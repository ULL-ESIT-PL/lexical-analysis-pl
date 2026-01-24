#include <stdio.h>
#include "scanner.h"

int main(void) {
    const char* source =
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
