/* calculator. */
%{
 #include <stdio.h>
 #include <stdlib.h>
 #include "lexer.h"
 void yyerror(const char *msg);

 // Here is an example how to create custom data structure
 typedef struct custom_data {
    char* name;
    int counter;
 } custom_data;

%}

%union{
  double dval;
  int ival;
  struct custom_data* cval; // define the pointer type for custom data structure
}

// generar mensajes de error de sintaxis más detallados.
%define parse.error verbose

%locations

%start input
%token MULT DIV PLUS MINUS EQUAL L_PAREN R_PAREN SEMICOLON
%token <dval> NUMBER
%type <dval> exp
%type <cval> input
%left PLUS MINUS
%left MULT DIV
%nonassoc UMINUS


%% 
input:	      line { $$ = malloc(sizeof(custom_data)); $$->name = "input"; $$->counter = 0; }
			| input SEMICOLON line  { $$ = $1; $1->counter++; }
			;

line:		exp EQUAL          { printf("\t%f\n", $1);}
			;

exp:		NUMBER                { $$ = $1; }
			| exp PLUS exp        { $$ = $1 + $3; }
			| exp MINUS exp       { $$ = $1 - $3; }
			| exp MULT exp        { $$ = $1 * $3; }
			| exp DIV exp         { if ($3==0) yyerror("divide by zero"); else $$ = $1 / $3; }
			| MINUS exp %prec UMINUS { $$ = -$2; }
			| L_PAREN exp R_PAREN { $$ = $2; }
			;
%%

int main(int argc, char **argv) {
   if (argc > 1) {
      if (strcmp(argv[1], "-h") == 0) {
         printf("Usage: %s [filename]\n", argv[0]);
         printf("If filename is not provided, input is read from standard input.\n");
         exit(0);
      }
      printf("Reading from file %s\n", argv[1]);
      yyin = fopen(argv[1], "r");
      if (yyin == NULL) {
         printf("Filename %s not found. Syntax is: %s filename\n", argv[1], argv[0]);
         exit(1);
      }//end if
   }
   else {
        printf("Reading from standard input. Use Ctrl-D (Unix) or Ctrl-Z (Windows) to end.\n");
   } //end if
   yyparse(); // Calls yylex() for tokens.
   return 0;
}

void yyerror(const char *msg) {
   printf("** Line %d: %s\n", yylloc.first_line, msg);
}
