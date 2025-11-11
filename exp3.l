%{
#include<stdio.h>
int count = 0;
%}

%%
[aA][a-zA-Z]*   { count++; }
[a-zA-Z]+       { }
.|\n            { }
%%

int main( )
{
    yylex();
    printf("Number of words starting with 'a' or 'A': %d\n", count);
    return 0;
}
int yywrap( ){
return 1;
)
