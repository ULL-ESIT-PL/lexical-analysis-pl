
#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H
typedef struct symbol {
    char *name;
    double value;
    struct symbol *next;
} symbol;

symbol *symtab = NULL;

symbol *lookup(char *name) {
    //printf("Looking up symbol: %s\n", name);
    for (symbol *s = symtab; s; s = s->next)
        if (strcmp(s->name, name) == 0)
            return s;
    return NULL;
}

symbol *install(char *name, double value) {
    //printf("Installing symbol: %s with value %g\n", name, value);
    symbol *s = malloc(sizeof(symbol));
    s->name = strdup(name);
    s->value = value;
    s->next = symtab;
    symtab = s;
    return s;
}
    
#endif /* SYMBOLTABLE_H */