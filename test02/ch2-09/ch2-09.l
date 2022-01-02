%{
/*
 * C言語のソース解析プログラム
 * （コードやコメント、空白行を数えるだけの機能しかない）
 */
#define YY_SKIP_YYWRAP
int yywrap();
int comments, code, whiteSpace;
%}

%s COMMENT
%%
^[ \t]*"/*"             { BEGIN COMMENT; /* enter comment eating state */ }
^[ \t]*"/*".*"*/"[ \t]*\n {
    comments ++; /* self-contained comment */
}

<COMMENT>"*/"[ \t]*\n   { BEGIN 0; comments++; }
<COMMENT>"*/"           { BEGIN 0;}
<COMMENT>\n             { comments++; }
<COMMENT>.\n            { comments++; }
^[ \t]*\n               { whiteSpace++; }
.+"/*".*"*/"\n          { code++; }
.*"/*".*"*/".+\n        {code++;}
.+"/*".*\n              {code++; BEGIN COMMENT; }
.\n                     {code++; }
.                       ;   /* igonore everything else */
%%

int main(void)
{
    yylex();
    printf("code :%d, comments: %d, whiteSpace: %d\n", code, comments, whiteSpace);
}

int yywrap(){return(1);}