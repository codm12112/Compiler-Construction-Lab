%{
#include <stdio.h>
int line_number = 0;
%}
// Preet Patel 22070521088 //
%option noyywrap

%%

.*com[[:space:]]*\n    {
    line_number++;
    char clean_line[1024];
    sscanf(yytext, "%[^\n]", clean_line);
    printf("Line %d ends with 'com': %s\n", line_number, clean_line);
}

.*\n    {
    line_number++;
}

.       ;   /* ignore single characters */

%%

int main() {
    printf("Lexical analysis started...\n");
    yylex();
    return 0;
}
