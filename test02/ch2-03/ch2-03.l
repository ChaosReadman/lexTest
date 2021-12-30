%{
unsigned long charCount = 0, wordCount = 0, lineCount = 0;
#undef yywrap
%}

word [^ \t\n]+
eol \n
%%
{word} {wordCount++; charCount += yyleng; }
{eol}  {charCount++; lineCount++; }
. charCount++;
%%

char **fileList;
unsigned int currentFile = 0;
unsigned int nFiles;
unsigned long totalCC = 0;
unsigned long totalWC = 0;
unsigned long totalLC = 0;

int main(int argc, char **argv){
    FILE *file;
    fileList = argv + 1;
    nFiles   = argc - 1;

    if (argc == 2){
        currentFile = 1;
        file = fopen(argv[1], "r");
        if(!file){
            fprintf(stderr,"オープンできませんでした %s \n",argv[1]);
            exit(1);
        }
        yyin = file;
    }
    if (argc > 2){
        yywrap();
    }
    yylex();
    if (argc > 2){
        printf("lineCount = %8lu, wordCount = %8lu, charCount = %8lu, fileName = %s\n"
        ,lineCount
        ,wordCount
        ,charCount
        ,fileList[currentFile - 1]);
        totalCC += charCount;
        totalWC += wordCount;
        totalLC += lineCount;
        printf ("totalLC = %8lu, totalWC = %8lu, totalCC = %8lu\n",totalLC, totalWC, totalCC);
    }else{
        printf ("lineCount = %8lu, wordCount = %8lu, charCount = %8lu\n",lineCount, wordCount, charCount);
    }
    return 0;
}

int yywrap(void)
{
    FILE *file = NULL;

    if((currentFile != 0) && (nFiles > 1) && (currentFile < nFiles)){
        printf ("lineCount = %8lu, wordCount = %8lu, charCount = %8lu fileName = %s\n",lineCount, wordCount, charCount, fileList[currentFile - 1]);
        totalCC += charCount;
        totalWC += wordCount;
        totalLC += lineCount;
        charCount = wordCount = lineCount = 0;
        fclose(yyin);
    }
    while(currentFile < nFiles){
        file = fopen(fileList[currentFile++], "r");
        if(file != NULL){
            yyin = file;
            return 0;
        }
        fprintf(stderr, "オープンできませんでした %s\n",fileList[currentFile - 1]);
    }
    
    return 1;
}
