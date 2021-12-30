ch2-05にFNAMEと-fileのオプションを追加  
> ./a.out  
-file aaa -verbose -help[CTRL+D]  
use file aaa  
verbose mode is on  
-help  

このプログラムはまったくもって動かない  
最後にCTRL+Dで終わらせると、何か動き始める  
yywrapが動きをおかしくしているのかもしれない  

本の解説では、次の通り  
定義部で%s FNAMEという行を追加して字句解析ルーチンに新たにスタート状態を定義している。  
規則部では<FNAME> から始まる規則を追加している。（ただしここが警告になっている）
ch2-06.l:16: warning, rule cannot be matched  
そして、16行目は次の通りだ  
<FNAME>[ ]+     /* ignore blanks */  
おそらくこれは35行目の部分と競合しているのではないだろうか  
<FNAME>[^ ]+ {  
    printf("use file %s\n", yytext);  
    BEGIN 0;  
    fname = 2;  
}  

とにかく-file という引数を取るとFNAME状態へ遷移し、ファイル名にマッチするパタンが有効になる。  
元のデフォルト状態に戻すにはBEGIN 0 を使う  
デフォルトのゼロ状態は INITIAL 状態という別名を持つ  
状態の追加以外にfname変数も追加した。  
fnameが2以外の時に、メインルーチンはエラーを出力する。  
このテストプログラムで注意するべきは、input関数だ。  
input関数は各コマンド行の引数を読み終えると、スペースを返すようになっている。  
規則では、空白はすべて無視しているが、このスペースが無いと、  
-f ile と-file が区別できない。  

