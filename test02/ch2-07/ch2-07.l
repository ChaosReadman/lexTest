%{
#define YY_SKIP_YYWRAP
int yywrap();
%}

%s MAGIC
%%
<MAGIC>.+   { BEGIN 0; printf("Magic:"); ECHO; }
magic       BEGIN MAGIC;
.+          ECHO;
%%

int main(void)
{
    yylex();
}

int yywrap(){return(1);}