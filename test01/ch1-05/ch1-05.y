%{
/*
 * 英語のセンテンスを扱う基本文法の字句解析器
 */
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION

%%
sentence: subject VERB object{ printf("センテンスは妥当\n"); };
subject: NOUN
        | PRONOUN
        ;
object: NOUN
        ;
%%
extern FILE *yyin;

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1],"r");
    if (!yyin){
        printf("%s のオープン失敗\n", argv[1]);
    }
    while(!feof(yyin)){
        yyparse();
    }
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s:\n", s);
}

