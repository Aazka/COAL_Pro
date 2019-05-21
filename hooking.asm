jmp abc
msg db 'overflow',0;

abc: 
mov di,0;
mov es,di;
lea bx,isr0;
mov es:[10h*4],bx;
mov es:[10h*4+2],cs;
int 10h;
ret



isr0:
mov ax,0xB800;
mov es,ax;
mov ah,0x07;
mov di,0;
lea si,msg;
lop:
lodsb 
cmp al,0;
je exit;
stosb;
inc di
;mov es:ax,[di];
add di,2;
jmp lop;
exit:
iret;