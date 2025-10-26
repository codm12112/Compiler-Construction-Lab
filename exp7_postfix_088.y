%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER PLUS MULT

%%

line:
    expr '\n'       { printf("Result: %d\n", $1); }
  | '\n'
  ;

expr:
    NUMBER          { $$ = $1; }
  | expr expr PLUS  { $$ = $1 + $2; }
  | expr expr MULT  { $$ = $1 * $2; }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a postfix expression:\n");
    yyparse();
    return 0;
}
