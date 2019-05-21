jmp abc
arr db 'COMPUTER ORGANIZATION AND ASSEMBLY LANUGUAGE,COAL',0;
size dw ?

abc:
mov ax,0x1452;
mov es,ax;
lea bx,arr;
mov di,0;
mov ax,0;

lop1:
mov al,[bx+si];
stosb;
inc si;
mov al,[bx+si];
cmp al,0;
je label1;
jmp lop1

label1:
mov ax,0x1452;
mov ds,ax;
mov ax,0xAB10;
mov es,ax;
mov si,0;
mov di,0;
mov cx,0;

lop2:
movsb;
inc cx;
mov al,[si];
cmp al,0;
je exit;
jmp lop2;

exit:
mov size,cx; 
ret;