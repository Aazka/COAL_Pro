jmp abc
msg db 'aazka the great',0;

abc:
mov di,0;
lea si,msg;
mov ax,0xB800;
mov es,ax;
mov ah,0x7;

lop:
lodsb;
cmp al,0;
je exit;
stosw;
jmp lop;

exit: 
;int 0;
mov ah,2;
mov dx,15; set your cursor
mov dh,0;
int 10h;
mov ax,di;
mov ah,0;
int 16h
mov ah,0x0E
int 10h;