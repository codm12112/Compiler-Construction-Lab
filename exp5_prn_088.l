%{
//preet patel 22070521088
#include <stdio.h>
#include <stdlib.h>

// Declare external functions and variables
int yywrap(void);
void convert_and_print(const char *text);
%}

%%

[0-9]+      { convert_and_print(yytext); }
[ \t\n]+    ;  // Ignore whitespace
.           ;  // Ignore any other characters

%%

/* Function: convert_and_print
 * ---------------------------
 * Converts a decimal string to an integer, then prints
 * the equivalent hexadecimal representation.
 */
void convert_and_print(const char *text) {
    int decimal_value = atoi(text);
    printf("Decimal: %s -> Hexadecimal: %X\n", text, decimal_value);
}

/* Function: yywrap
 * ----------------
 * Standard yywrap function required by Flex.
 */
int yywrap(void) {
    return 1;
}

/* Function: main
 * --------------
 * Opens the input file (if provided) and calls the lexer.
 */
int main(int argc, char *argv[]) {
    FILE *input_file;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);
    return 0;
}

