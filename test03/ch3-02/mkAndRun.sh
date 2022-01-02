yacc -d ch3-02.y
flex ch3-02.l
gcc -g y.tab.c lex.yy.c  -DYYDEBUG=1 -lfl -o a.out
./a.out

