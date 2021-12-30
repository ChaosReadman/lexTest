magic でMAGIC状態になる。  
その後.+で任意の文字列の１回以上の繰り返しという条件でマッチさせると、  
BEGIN 0 で初期状態にし、printfでMagic:を表示、ECHOで入れた値をECHOする。  

>./a.out  
aaa  
aaa  
bbb  
bbb  
ccc  
ccc  
magic  
  
bbb  
Magic:bbb  

また、ファイルから読み込むことも出来る  
./a.out < input  
Magic:one  
two  
three  
