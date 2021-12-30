# lex and yacc programming  
lex & Yacc プログラミングのコードをUbuntu20.04LTSで動くように修正したもの  
https://iss.ndl.go.jp/books/R100000002-I000002412297-00  

ubuntu20.04.LTSでは以下の様にリンクが貼られている。  

/usr/bin/lex -> flex  
/usr/bin/yacc -> /etc/alternatives/yacc  
/etc/alternatives/yacc -> /usr/bin/bison.yacc  
となっており、中身はシェルスクリプトでyacc流に合わせてbisonを動かしている。  

Cの書き方が古すぎて、コードの品質も納得できない所が多い。  
そもそも動かないところもあるので、  
元のコードをあまり直さないまま、動くように修整している。  
