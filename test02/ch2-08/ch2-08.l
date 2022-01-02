%{
/*
 * ch2-07と比べて、<MAGIC>の位置を最後にしたもの
 * スタート状態を持った規則が、スタート状態をもたないきそくのうしろにくるようにした。
 * 位置関係が重要なようだ。
 */
#define YY_SKIP_YYWRAP
int yywrap();
%}

%s MAGIC
%%
magic       BEGIN MAGIC;
.+          ECHO;
<MAGIC>.+   { BEGIN 0; printf("Magic:"); ECHO; }
%%

int main(void)
{
    yylex();
}

int yywrap(){return(1);}