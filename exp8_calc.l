
%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"
%}

%%

[ \t]+              ;  // ignore whitespace
[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[\+\-\*/\^\(\)]     { return yytext[0]; }
\n                  { return '\n'; }
.                   { fprintf(stderr, "Unknown character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
