jmp abc;
str1 db 'aazka the great',0;
str2 db ' the length of string is =',0; 
str3 db 'character',0;
dev db 10 dup(?)          
length db ?

abc:
lea si, str1;
mov cx,0xffff;

lop1:
lodsb
cmp al,0;
je label1;
inc dl;
loop lop1;

label1:
mov length,dl;
mov al,dl;
mov cl,10;
mov si,0;
;int 0;

lop2:
div cl;
mov [dev+si],ah;
inc si;
inc di;
cmp al,0
jl label3;
jmp lop2;

label3:
mov bp,di;
mov ax,0xb800;
mov es,ax;
mov ah,0x07;
mov di,0;
lea si,str2;
mov cx,0xffff;

lop3: 
lodsb
cmp al,0;
je label4;
mov es:[di],ax;
add di,2;
loop lop3;

label4:   
dec bp
mov cx,bp;
inc cx;
int 0;

lop4: 
mov al,0;
mov al,[dev+bp];
add al,'0';
mov es:[di],ax;
add di,2;
dec bp;
;cmp bp,0;
;jl label5;
loop lop4;

label5:
lea si,str3;

lop5:
lodsb;
cmp al,0;
je exit;
mov es:[di],ax;
add di,2;
loop lop5

exit:
ret; 