org 100h
jmp main
cols dw ?
rows dw ?
totalRows dw 24
totalcols dw 60
startCol dw ?
startRow dw ?
Dimention dw ?
TotalBox dw ?
WrongInput db 'You have entered a wrong Input',0
Input db 'Enter Dimention:',0     
R1 db 0x2
C1 db 0x4
Temp dw ?
size:    
    pop bp
    pop si
    mov cx,0
    L1:
    lodsb
    cmp al,0
    jz outer
    inc cx
    jmp L1          
    outer:
    push bp
    ret
cout:
    pop bp
    pop si
    pop cx 
    push cx
    mov di,0      
    mov ah,0x72
    L2:      
    lodsb     
    mov es:[di],ax
    add di,2
    loop L2
    push bp
    ret   
SmallBox:
    pop bp
    pop si
    pop dx
    push bp
    ret
GetRC:
    pop bp
    pop bx
    mov ax,totalRows
    mov dx,0
    div bx
    mov rows,ax
    mov ax,totalcols
    mov dx,0
    div bx
    mov cols,ax
    push bp
    ret            
Clear:
    pop dx    
    lea si,Input
    push si
    call size   
    add cx,2
    mov di,0
    mov ax,0x0000
    L8:
    mov es:[di],ax
    add di,2
    loop L8
    push dx
    ret
printBox:
    pop bp
    pop di
    mov bx,0
    mov cx,cols
    mov ah,0x04
    mov al,254
  L3:
    mov es:[di],ax
    add bx,2
    add di,2
  loop L3
    sub di,bx
    mov cx,rows
    mov dx,0
  L5:
    add di,160
    mov es:[di],ax
    inc dx
  loop L5 
  mov cx,cols
  L6:
    add di,2
    mov es:[di],ax 
  loop L6 
  mov cx,dx
  L7:
    sub di,160
    mov es:[di],ax
  loop L7        
  add di,2
  push di
   push bp  
    ret
printFilledBox:
    pop si
    pop di     
    mov bx,0      
    mov ah,0xff
    mov al,219
    mov cx,rows
    add cx,1
    L9:           
    mov dx,cols
       L10:       
          mov es:[di],ax
          add di,2
          add bx,2
          dec dx
       jnz L10 
     sub di,bx
     add di,160
     mov bx,0      
    loop L9
    mov cx,rows 
    add cx,1
    mov Temp , di
    L11:
    sub di,160
    loop L11
push di
call printbox
push si
ret
main:
    push 0xB800
    pop es
    lea si,Input
    push si
    call size  
    lea si,Input
    push cx
    push si 
    ;int 0
    call cout 
    mov ah,2
    pop dx
    mov dh,0
    int 0x10
    mov ah,0      
    int 16h          
    mov ah,0x0E
    int 10h         
    mov ah,0 
    sub al,48 
    push ax
    call clear
    pop ax
    cmp al,8 
    jne Wrong 
    mov Dimention,ax
    push Dimention   
    call GetRC
    Rowe:
        Cmp R1 , 0
        Je Exit
        Column:
        
          Cmp C1 , 0
          Je G   
          call PrintBox      
          call PrintFilledBox
          Dec C1
        Jmp Column
        G:          
        Mov C1 , 0x04 
        mov Ax , Temp
        Sub Ax , 112
        Push Ax 
        Column2:
        
          Cmp C1 , 0
          Je G2   
          call PrintFilledBox
          call PrintBox
          Dec C1
        Jmp Column2
        G2: 
        Dec R1   
        Mov C1 , 0x04 
        mov Ax , Temp
        Sub Ax , 96 
        
        Push Ax
    Jmp Rowe
Exit: 
int 20h
    Wrong:
        lea si,WrongInput
        push si
        call size
        lea si,WrongInput
        push cx
        push si 
        ;int 0
        call cout 
        pop cx
int 20h