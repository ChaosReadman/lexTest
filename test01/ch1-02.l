%{
    /*
    * めっちゃ簡単サンプル（動詞か動詞ではないかの判定）
    */
%}
%%

[\t ]+      /* 空白やTABを無視 */

is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go { printf("%s: は動詞\n", yytext); }
[a-zA-Z]+ { printf("%s: は動詞ではない\n", yytext); }
.|\n   { ECHO; /* .や改行は単純に出力する */ }
%%
int main(void)
{
    yylex();
    return 0;
}

int yywrap(){return(1);}

