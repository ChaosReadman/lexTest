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
int main(int argc, char *argv[]){
    if (argc > 1){
        FILE *file;
        file = fopen(argv[1],"r");
        if(!file){
            fprintf(stderr,"オープンできませんでした %s \n",argv[1]);
            exit(1);
        }
        yyin = file;
    }
    yylex();
    printf ("\nlineCount = %d, wordCount = %d, charCount = %d\n",lineCount,wordCount, charCount);
    return 0;
}

int yywrap(){return(1);}