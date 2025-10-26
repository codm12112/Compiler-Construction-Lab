//Preet Patel
//22070521088

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(char *s);
int yylex(void);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right '^'
%left '(' ')'

%%
program:
    program expr '\n'       { printf("Result: %d\n", (int)$2); }
  | program '\n'            { }
  |                         /* empty */
;

expr:
    NUMBER                  { $$ = $1; }
  | expr '+' expr           { $$ = $1 + $3; }
  | expr '-' expr           { $$ = $1 - $3; }
  | expr '*' expr           { $$ = $1 * $3; }
  | expr '/' expr           {
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
  | expr '^' expr           { $$ = (int)pow($1, $3); }
  | '(' expr ')'            { $$ = $2; }
;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter expressions (Ctrl+D to end):\n");
    yyparse();
    return 0;
}


