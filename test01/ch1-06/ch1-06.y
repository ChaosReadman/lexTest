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
sentence: simple_sentence   { printf("単純なセンテンスをパースしました。\n"); }
        | compound_sentence { printf("複合センテンスをパースしました\n"); }
        ;
simple_sentence: subject verb object
        | subject verb object prep_phrase
        ;
compound_sentence: simple_sentence CONJUNCTION simple_sentence
        | compound_sentence CONJUNCTION simple_sentence
        ;
subject: NOUN
        | PRONOUN
        | ADJECTIVE subject
        ;
verb: VERB
        | ADVERB VERB
        | verb VERB
        ;
object: NOUN
        | ADJECTIVE object
        ;
prep_phrase: PREPOSITION NOUN
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
        /* yyparseからyylexが呼ばれる */
        yyparse();
    }
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s:\n", s);
}

