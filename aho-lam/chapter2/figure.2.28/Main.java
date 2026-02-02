import java.io.*;

public class Main {
    public static void main(String[] args) {
       
        try {
            // Inicializamos el analizador léxico con la entrada estándar
            Lexer lexer = new Lexer();
            
            // Pasamos el lexer al analizador sintáctico
            Parser parser = new Parser(lexer);
            
            // Iniciamos el análisis sintáctico y la traducción
            parser.analyze();
            
        } catch (IOException e) {
            System.err.println("Error de entrada/salida: " + e.getMessage());
        } catch (Error e) {
            // Captura los errores de sintaxis lanzados por el Parser
            System.err.println("\n" + e.getMessage());
        }
    }
}
