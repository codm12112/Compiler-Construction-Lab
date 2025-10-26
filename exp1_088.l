%{
# include <stdio.h>
%}
%%
one|ONE|One printf("1");
two|TWO|Two printf("2");
three|THREE|Three
four|FOUR|Four
five|FIVE|Five
six|SIX|Six
seven|SEVEN|Seven
%%
int main()
{ yylex();
 return 0;
 
 }
