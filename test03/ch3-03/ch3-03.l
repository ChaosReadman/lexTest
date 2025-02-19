%{
#include "y.tab.h"
#include<math.h>
extern double vbtable[26];
%}

%%
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
    yylval.dval = atof(yytext);
    return NUMBER;
 }
[ \t] ;         /* ignore whitespace */
[a-z] { yylval.vblno = yytext[0] - 'a'; return NAME; }
"$" { return 0; /* end of input */ }
\n |
.   return yytext[0];
%%

int yywrap(){return(1);}
