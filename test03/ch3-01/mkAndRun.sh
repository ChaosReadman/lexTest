yacc -d ch3-01.y
flex ch3-01.l
gcc -g y.tab.c lex.yy.c  -DYYDEBUG=1 -lfl -o a.out
./a.out

