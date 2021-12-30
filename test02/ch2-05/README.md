inputとunputを自作して置き換えたというサンプル。  
lex.yy.cを見ると、以下の定義もしないとエラーになることがわかった  
#define YY_NO_INPUT  
