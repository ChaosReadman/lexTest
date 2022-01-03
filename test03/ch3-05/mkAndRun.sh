yacc -d ch3-05.y
flex ch3-05.l
gcc -g  y.tab.c lex.yy.c ch3-05.c -DYYDEBUG=1 -lfl -lm -o a.out
./a.out

