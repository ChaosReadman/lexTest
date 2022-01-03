#define NSYMS 20

struct symtab{
    char *name;
    double (*funcptr)(double);
    double value;
}symtab[NSYMS];

struct symtab *symlook();


extern double sqrt(double), log(double), exp(double);


int yylex();
void yyerror(const char *s);
int yyparse(void);