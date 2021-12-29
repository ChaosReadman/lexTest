bison -d ch1-05.y
lex ch1-05.l
gcc lex.yy.c ch1-05.tab.c -lfl -o a.out
./a.out example.txt
