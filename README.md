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

lexとyaccは何者かというと、  
lexは字句解析をする。  
yaccは構文解析をする。  

lexのゴールは、yylex()というCの関数をつくることだ。  
この関数は引数無しで呼び出し、ファイルの終わりで0を返す。 
yylex()は、字句解析をしてトークンに分解し、そのトークンの種類に応じた値を返す。  
  
この時、yytextという名前の文字列を外部データように作成する。  
yytextはyyinから字句解析して読み取れたトークン文字列が入っている。  
  
また同時に、yylengにはyytextの文字数が入っている。  
yacc側に渡すために、yylval というオブジェクトを使う。  
yylex()が整数トークンを読んだとき、yytextには整数の文字列が入るが、  
yylvalには実際に数値をいれることで、yacc側に渡すのが通例となっている。  

yaccのゴールは、yyparse()というCの関数をつくることで、  
yyparse()はlexの出力するyylex()を呼び出すようになっている。  

