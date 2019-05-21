jmp abc

str1 db 'Consider a pro string of your choice, calculate its length and display the result on screen with the message. For example, if length of string is 19, your program would display The length of string is=19 characters. Your program should work for any string length.',0;
scan db 'length',0;
count_scan db ?
total_count dw ?

abc:
lea si,scan;
mov cx,0xffff;

lop_count_scan:
lodsb;
cmp al,0;
je label1;
inc dl;
loop lop_count_scan;
  
label1:
mov count_scan,dl;
lea si,str1;
lea di,scan;
mov cx,0xffff;

int 0
lop_scan:
lodsb;
cmp al,0;
je exit;
scasb;
jz count
mov bl,0;
lea di,scan;
conti:

loop lop_scan
 
count:
inc bl;
cmp count_scan,bl;
je count_plus_plus
jmp conti

count_plus_plus:
inc bp;
jmp conti

exit:
mov total_count,bp;
ret;