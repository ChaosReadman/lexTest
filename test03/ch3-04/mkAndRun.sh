yacc -d ch3-04.y
flex ch3-04.l
gcc -g ch3-04.c y.tab.c lex.yy.c  -DYYDEBUG=1 -lfl -o a.out
./a.out

