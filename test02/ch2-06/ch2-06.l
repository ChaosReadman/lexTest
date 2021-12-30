%{
#define YY_SKIP_YYWRAP
int yywrap();
#define YY_NO_INPUT
#undef input
#undef unput
int input(void);
void unput(int ch);
unsigned int verbose;
unsigned int fname;
char *progName;
%}

%s FNAME

%%
[ ]+            /* ignore blanks */
<FNAME>[ ]+     /* ignore blanks */

-h      |
"-?"    |
-help {
    printf("usage is: %s [-help|-h|-?] [-verbose|-v] [(-file|-f) filename]\n", progName);
}

-v      |
-verbose {
    printf("verbose mode is on\n");
    verbose = 1;
}

-f      |
-file {
    BEGIN FNAME; fname = 1;
}

<FNAME>[^ ]+ {
    printf("use file %s\n", yytext);
    BEGIN 0;
    fname = 2;
}

[^ ]+ ECHO;
%%
char **targv;
char **arglim;

int main(int argc, char **argv)
{
    progName = *argv;
    targv = argv + 1;
    arglim = argv + argc;
    yylex();
    if(fname < 2)
        printf("ファイル名が指定されていません\n");
}

static unsigned offset = 0;

int input(void)
{
    char c;
    if(targv >= arglim)
        return (0);
    if((c == targv[0][offset++]) != '\0')
        return(c);
    targv++;
    offset = 0;
    return(' ');
}

void unput(int ch)
{
    if(ch == 0)
        return;
    if(offset){
        offset--;
        return;
    }
    targv--;
    offset = strlen(*targv);
}

int yywrap(){return(1);}