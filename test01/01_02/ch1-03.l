%{

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

very |
simply |
gently |
quietly |
calmly |
angrily  { printf("%s: は副詞\n",yytext); }

to |
from |
behind |
above |
below |
between { printf("%s: は前置詞\n",yytext); }

if |
then |
and |
but |
or { printf("%s: は接続詞\n",yytext); }

their |
my |
your |
his |
her |
its  {printf("%s: は形容詞\n",yytext); }

I |
you |
he |
she |
we |
they {printf("%s: は代名詞\n",yytext); }

[a-zA-Z]+ {
     printf("%s: は認識できません。（おそらく名詞？）\n", yytext); 
     }

.|\n   { ECHO; /* .や改行は単純に出力する */ }

%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap(){return(1);}
