
STRING DB 'This is a sample string', '$' 
 mov DX,STRING 
  
 ;output the string
 ;loaded in dx 
 MOV AH,09H
 int  0x21 
  
 ;interrupt to exit
 MOV ax,0x4c00
 int 0x21 
