yacc -d ch3-03.y
flex ch3-03.l
gcc -g y.tab.c lex.yy.c  -DYYDEBUG=1 -lfl -o a.out
./a.out

