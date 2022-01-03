#define NSYMS 20

struct symtab{
    char *name;
    double value;
}symtab[NSYMS];

struct symtab *symlook();
int yylex();
void yyerror(const char *s);