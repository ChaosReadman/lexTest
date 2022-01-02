%{
/*
 */
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%
statement: expression { printf("= %d\n", $1); }
    ;

expression: NUMBER '+' NUMBER   { $$ = $1 + $3; }
    |       NUMBER '-' NUMBER   { $$ = $1 - $3; }
    |       NUMBER '*' NUMBER   { $$ = $1 * $3; }
    |       NUMBER '/' NUMBER
           { 
                if($3==0)
                    yyerror("divide by zero");
                else
                    $$ = $1 / $3; 
            }
    |  '-' expression %prec UMINUS { $$= -$2; }
    |  '(' expression ')'       { $$ = $2; }
    |       NUMBER              { $$ = $1; }
    ;

%%

int main(void)
{
    if(yyparse()){
        /* yaccのつくったyyparse()からlexの作るyylex()が呼び出される */
        fprintf(stderr, "error\n");
        return 1;
    }
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s:\n", s);
}
