%{
int count = 0;
%}

%%
[aA][a-zA-Z0-9_]*   { count++; }
[a-zA-Z0-9_]+       { }
[ \t\n]+            { }
.|\n                {  }
%%

int main(int argc, char **argv)
{
    yylex();
    printf("Number of words starting with 'a' or 'A': %d\n", count);
    return 0;
}

