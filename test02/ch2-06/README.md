ch2-05にFNAMEと-fileのオプションを追加  
> ./a.out  
-file aaa -verbose -help[CTRL+D]  
use file aaa  
verbose mode is on  
-help  

このプログラムはまったくもって動かない  
最後にCTRL+Dで終わらせると、何か動き始める  
yywrapが動きをおかしくしているのかもしれない  