%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+ {
    yylval = atoi(yytext);  /* yacc側に渡すyylvalを用意する */
    return NUMBER;
 }
[ \t] ;         /* ignore whitespace */
\n  return 0;   /* ignore EOF */
.   return yytext[0];
%%

int yywrap(){return(1);}