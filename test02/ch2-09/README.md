C言語のソースから、コード、コメント、空白を数える  
コメントを扱うのが少し難しく、  
コメントのスタート状態を考慮しないといけない。  

=== test.c ===  
/* aiueo */  
int main(void)  
{  
        printf("aiueo\n");      /* 後半に置くコメント */  
/*  
 * 複数行にわたるコメント  
 */  
        return 0;  
}  

./a.out < test.c  
code :5, comments: 4, whiteSpace: 0  
  
正規表現で、行やコメント、空白行を数え、  
コメント行とコード行が同時に数え、結果を出力している。  
プログラムでは空白行は無いのでwhiteSpace: 0 になっている。  


特筆するべきは  
^[ \t]*"/*"             { BEGIN COMMENT; /* enter comment eating state */ }  
この部分で、最初にスタート状態を持つ条件を書くことで、うまく機能しているようだ。  
