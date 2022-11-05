.model small
.stack
.data
 inp  db 1(0)
 inpc db 10(0)
 msg1 db 10,13,'welcome to our word game $'
 msg2 db 10,13,'choose a field$'
 msg3 db 10,13,'Wrong input (input must be from 1-3)$'
 msg4 db 10,13,'wrong answer try again'
 msg41 db 10,13,'press 1 for more hint 2 to reveal 2 letters 3 quit$'
 msg5 db 10,13,'Correct answer '
 msg6 db 10,13,'press q to quit or press any key to play again$'
 msg7 db 10,13,'Your score is $'
 mnu1 db 10,13,'1)Country$'
 mnu2 db 10,13,'2)Food$'
 mnu3 db 10,13,'3)Animal$'
 newl db 10,13,'$'
 score dw 0h
 


 
 countryh1 db 10,13,'Hint: A country that has never been colonized (8 letters)$'
 countryh2 db 10,13,'Hint: East african country$'
 revealc1 db 10,13,'E_h______$'
 countryn1 db 'Ethiopia$'
 
 animalh1 db 10,13,'Only found in Ethiopia (5 letters)$'
 animalh2 db 10,13,'On the bale mountain$'
 reveala1 db 10,13,'_a_y_$'
 animaln1 db 'Walya$'
 
 
 foodh1 db 10,13,'staple food of in Ethiopia$'
 foodh2 db 10,13,'used as a bread$'
 revealf1 db 10,13,'I_j___$'
 foodn1 db 'Injera$'
.code

MOV AX,@DATA
MOV DS,AX

LEA dx,msg1;welcome
mov ah,9
int 21h

l4:LEA dx,msg2;field
mov ah,9
int 21h

LEA dx,mnu1;country
mov ah,9
int 21h

LEA dx,mnu2;food
mov ah,9
int 21h

LEA dx,mnu3;animal
mov ah,9
int 21h

LEA dx,newl;new line
mov ah,9
int 21h

mov ah,1; input from user 1,2,3
int 21h
mov inp,al

cmp inp,'1'
je l1
cmp inp,'2'
je k2

cmp inp,'3'
je kl

lea dx,msg3; wrong input not 1-3
mov ah,9
int 21h
jmp l4


;input 
l8:
mov si,offset inpc ;input si
cmp inp,'1'
je c8
cmp inp,'2'
je c6
cmp inp,'3'
je c5

c8: mov ax,8
jmp lx
c6: mov ax,6
jmp lx
c5: mov ax,5

lx:mov cx,ax
loop1:
mov ah,1
int 21h
mov [si],al
inc si
loop loop1
inc si


;compare
cmp inp,'1'
je com8
cmp inp,'2'
je com6
cmp inp,'3'
je com5

com8: mov ax,8
mov di,offset countryn1;ethiopia
jmp ly
com6: mov ax,6
mov di,offset animaln1;ethiopia
jmp ly
com5: mov ax,5
mov di,offset foodn1;ethiopia

ly:mov si,offset inpc;user input
mov cx,ax
loop2: 
mov al,[si]
mov bl,[di]
cmp al,bl
jne l5
inc si
inc di
loop loop2

cmp inp,'1'
je l11
cmp inp,'2'
je l22
cmp inp,'3'
je l33

l1:
lea dx,countryh1;hint 1
mov ah,9
int 21h
jmp l8
l11:



lea dx,msg5;correct answer
mov ah,9
int 21h
inc score

mov ah,1
int 21h
cmp al,'q'
je endl1
jmp l4
k2:jmp l2

l5:
lea dx,msg4;wrong answer 1 hint,2 reveal,3 quit
mov ah,9
int 21h

mov ah,1
int 21h
cmp al,'1'
je h1
cmp al,'2'
je r1
;cmp al,'3'
endl1:
lea dx,msg7;score display
mov ah,9
int 21h
mov dx,score
add dx,30h;
mov ah,2
int 21h
mov ah,4ch
int 21h
kl:jmp l3

h1:
lea dx,countryh2;hint 2
mov ah,9
int 21h
jmp l1

r1:
lea dx,revealc1;2 letters 
mov ah,9
int 21h
jmp l1
 



l2:
lea dx,foodh1
mov ah,9
int 21h


jmp l8

l22:

mov si,offset inpc
mov di,offset foodn1
mov cx,6
loop2f: 
mov al,[si]
mov bl,[di]
cmp al,bl
jne l5f
inc si
inc di
loop loop2f

lea dx,msg5
mov ah,9
int 21h
inc score
mov ah,1
int 21h
cmp al,'q'
je endl2
jmp l4
endl2:
lea dx,msg7
mov ah,9
int 21h
mov dx,score
add dx,30h
mov ah,2
int 21h
mov ah,4ch
int 21h

l5f:
lea dx,msg4
mov ah,9
int 21h

mov ah,1
int 21h
cmp al,'1'
je h1f
cmp al,'2'
je r1f
cmp al,'3'
je endl3

endl3:lea dx,msg7
mov ah,9
int 21h
mov dx,score
add dx,30h
mov ah,2
int 21h
mov ah,4ch
int 21h
h1f:
lea dx,animalh2
mov ah,9
int 21h
jmp l2

r1f:
lea dx,reveala1
mov ah,9
int 21h 
jmp l2




l3:
lea dx,animalh1
mov ah,9
int 21h

jmp l8
l33:
mov si,offset inpc
mov di,offset animaln1
mov cx,5
loop2a: 
mov al,[si]
mov bl,[di]
cmp al,bl
jne l5a
inc si
inc di
loop loop2a

lea dx,msg5
mov ah,9
int 21h
inc score
mov ah,1
int 21h
cmp al,'q'
je endl
jmp l4


l5a:
lea dx,msg4
mov ah,9
int 21h

mov ah,1
int 21h
cmp al,'1'
je h1a
cmp al,'2'
je r1a
cmp al,'3'
je endl

h1a:
lea dx,animalh2
mov ah,9
int 21h
jmp l3

r1a:
lea dx,reveala1
mov ah,9
int 21h
jmp l3

endl:
lea dx,msg7
mov ah,9
int 21h
mov dx,score
add dx,30h
mov ah,2
int 21h
mov ah,4ch
int 21h

mov ah,4ch
int 21h
end
