%{
#include "y.tab.h"
#include "ch3hdr.h"
#include <math.h>
%}

%%
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
    yylval.dval = atof(yytext);
    return NUMBER;
 }
[ \t] ;         /* ignore whitespace */
[A-Za-z][A-Za-z0-9]* {
    struct symtab *sp = symlook(yytext);
    yylval.symp = sp;
    return NAME; 
}
"$" { return 0; /* end of input */ }
\n |
.   return yytext[0];
%%

int yywrap(){return(1);}
