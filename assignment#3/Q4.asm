
jmp start

str1 db 'AAZKA THE GREAT xD',0;
size dw ?

start:
mov cx,0xffff;
lea si,str1; 

lol:
lodsb
cmp al,0;
je label1;
inc size;
loop lol;

label1:  
 
mov ax, 0xb800;
Mov es, ax;
mov di,0  
mov bp,di;
lea si, str1;
mov ah, 0x1A;
mov sp,0;
lop:
mov cx,size;
lea si, str1
mov bp,sp;
mov di,sp;
l1:
Mov al, [si];
Inc si;
Mov es:[di],ax;	
Add di,2;
loop l1

;int 0;
mov cx, size;	.
mov ax, 0x0720; 
l2:
Mov es:[bp],ax;
Add bp,2;
cmp bp,154;
je exit;
loop l2 
add sp,2;

jmp lop;

exit:
jmp label1;
;ret
