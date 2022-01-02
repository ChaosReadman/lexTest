%{
/*
 */
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}


%token NAME NUMBER
%%
statement: NAME '=' expression
    | expression { printf("= %d\n", $1); }
    ;

expression: NUMBER '+' NUMBER   { $$ = $1 + $3; }
    |       NUMBER '-' NUMBER   { $$ = $1 - $3; }
    |       NUMBER              { $$ = $1; }
    ;

%%

int main(void)
{
    if(yyparse()){
        fprintf(stderr, "error\n");
        return 1;
    }
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s:\n", s);
}
