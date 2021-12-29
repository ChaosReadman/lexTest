bison -d ch1-06.y
lex ch1-06.l
gcc lex.yy.c ch1-06.tab.c -lfl -o a.out
./a.out example.txt
