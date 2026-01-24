/* file: yywrap.l 
Cuando el analizador léxico alcanza el final del fichero, 
el comportamiento en las subsiguientes llamadas a yylex resulta indefinido. 
En el momento en que yylex() alcanza el final del fichero llama a la función yywrap, 
la cual retorna un valor de 0 o 1 según haya mas entrada o no. Si el valor es 0, 
la función yylex asume que la propia yywrap se ha encargado de abrir el nuevo fichero y asignarselo a yyin . 
Otra manera de continuar es haciendo uso de la función yyrestart(FILE *file). 
El siguiente ejemplo cuenta el número de líneas, palabras y caracteres en una lista de ficheros proporcionados como entrada.
*/

%{
unsigned long charCount = 0, wordCount = 0, lineCount = 0;
%}

word [^ \t\n]+ 
eol \n 

%%
{word} { wordCount++; charCount += yyleng; }
{eol} { charCount++; lineCount++; }
. charCount++;

%%

char **fileList;
unsigned nFiles;
unsigned currentFile = 0;
unsigned long totalCC = 0;
unsigned long totalWC = 0;
unsigned long totalLC = 0;

int main ( int argc, char **argv) {
  FILE *file;

  fileList = argv + 1; nFiles = argc - 1;

  if (nFiles == 0) {
    fprintf(stderr,"Usage is:\n%s file1 file2 file3 ...\n",argv[0]);
    exit(1);
  }
  file = fopen (fileList[0], "r");
  if (!file) {
      fprintf (stderr, "could not open %s\n", argv[1]);
      exit (1);
  }
  currentFile = 1; yyrestart(file);
  yylex ();
  printf ("%8lu %8lu %8lu %s\n", lineCount, wordCount,
    charCount, fileList[currentFile - 1]);
  if (argc > 2) {
      totalCC += charCount; totalWC += wordCount; totalLC += lineCount;
      printf ("%8lu %8lu %8lu total\n", totalLC, totalWC, totalCC);
  }
  return 0;
}

int yywrap () {
  FILE *file;

  if (currentFile < nFiles) {
     printf ("%8lu %8lu %8lu %s\n", lineCount, wordCount,
       charCount, fileList[currentFile - 1]);
     totalCC += charCount; totalWC += wordCount; totalLC += lineCount;
     charCount = wordCount = lineCount = 0;
     fclose (yyin);

     while (fileList[currentFile] != (char *) 0) {
       file = fopen (fileList[currentFile++], "r");
       if (file != NULL) { yyrestart(file); break; }
	  fprintf (stderr, "could not open %s\n", fileList[currentFile - 1]);
     }
     return (file ? 0 : 1);
    }
    return 1;
}

/*
La figura muestra el proceso de compilación y la ejecución:

➜  expresiones-regulares-en-flex git:(main) ✗ flex yywrap.l 
➜  expresiones-regulares-en-flex git:(main) ✗ gcc lex.yy.c 
➜  expresiones-regulares-en-flex git:(main) ✗ ./a.out *.l
      38      143      921 decl.l
       9       53      325 delete.l
      15       77      583 spaces.l
      17       63      548 subst.l
      22       46      430 yytext-array.l
      17       48      395 yytext-pointer.l
      92      443     2931 yywrap.l
     210      873     6133 total
La diferencia esencial entre asignar yyin o llamar a la función yyrestart 
es que esta última puede ser utilizada para conmutar entre ficheros en medio de un análisis léxico. 
El funcionamiento del programa anterior no se modifica si se se intercambian asignaciones
 a yyin (yyin = file) y llamadas a yyrestart(file).
 */