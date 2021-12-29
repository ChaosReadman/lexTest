%{
unsigned charCount = 0, wordCount = 0, lineCount = 0;
%}

word [^ \t\n]+
eol \n
%%
{word} {wordCount++; charCount+= yyleng; }
{eol}  {charCount++; lineCount++; }
. charCount++;
%%
int main(void){
    yylex();
    printf ("\nlineCount = %d, wordCount = %d, charCount = %d\n",lineCount,wordCount, charCount);
}

int yywrap(){return(1);}