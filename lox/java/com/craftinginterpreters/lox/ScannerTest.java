package com.craftinginterpreters.lox;

import java.util.List;

public class ScannerTest {
  public static void main(String[] args) {
    String source = "var x = 42;\nprint x + 1; print \"hello world!\"";
    Scanner scanner = new Scanner(source);
    List<Token> tokens = scanner.scanTokens();

    for (Token token : tokens) {
      System.out.print("type: " + token.type + 
        " lexeme:" + token.lexeme + 
        " literal: " + token.literal + 
        " line: " + token.line + 
        "\n");
      //System.out.println(token.toString());
    }
  }
}
