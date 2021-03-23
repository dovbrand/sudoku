.model small

.code
org 100h

start:
jmp real_start
board   db '0','8','2','3','0','x','0','0','0','6','0','y'
        db '4','7','z','y','2','0','1','0','0','0','3','0'
        db 'y','0','0','0','0','0','9','8','7','0','2','0'
        db '6','0','0','4','0','0','0','2','y','0','1','x'
        db '8','y','7','0','z','0','6','0','4','0','0','1'
        db '0','0','0','7','0','0','8','9','2','3','y','0'
        db '0','9','3','0','0','5','7','0','0','0','0','8'
        db '0','0','0','8','0','y','0','x','z','0','0','9'
        db '7','2','8','z','0','0','4','0','3','0','0','0'
        db '0','4','5','0','0','7','2','0','0','y','z','3'
        db '9','0','1','9','x','0','0','z','0','0','5','0'
        db '3','0','y','0','4','0','x','0','0','0','0','0','$'

boardAns  db '1','8','2','3','9','x','z','4','5','6','7','y'
          db '4','7','z','y','2','8','1','6','x','9','3','5'
          db 'y','3','x','1','5','6','9','8','7','z','2','4'
          db '6','5','9','4','7','z','3','2','y','8','1','x'
          db '8','y','7','2','z','9','6','3','4','5','x','1'
          db '5','x','6','7','1','4','8','9','2','3','y','z'
          db 'z','9','3','x','6','5','7','y','1','2','4','8'
          db '2','1','4','8','3','y','5','x','z','7','6','9'
          db '7','2','8','z','y','1','4','5','3','x','9','6'
          db 'x','4','5','6','8','7','2','1','9','y','z','3'
          db '9','6','1','9','x','2','y','z','8','4','5','7'
          db '3','z','y','5','4','3','x','7','6','1','8','2','$'

inst    db 'C', 'O', 'N', 'T', 'R', 'O', 'L', 'S', '$'
inst1   db 119, 58, 32, 117, 112, '$'
inst2   db 97, 58, 32, 108, 101, 102, 116, '$'
inst3   db 100, 58, 32, 114, 105, 103, 104, 116, '$'
inst4   db 115, 58, 32, 100, 111, 119, 110, '$'
inst5   db 113, 58, 32, 113, 117, 105, 116, '$'
inst6   db 'c',':',' ','c','h','e','c','k',' ','p','u','z','z','l','e','$'
inst7   db 'r',':',' ','r','e','s','e','t',' ','p','u','z','z','l','e','$'

real_start:
mov ax, 0003h
int 10h

mov bx, 0b800h
mov es, bx
mov bx, 32
mov dx, 0

call draw
call instructions
call board1
call cursor


mov ax, 00h
int 16h

mov ax, 4c00h
int 21h

draw:
call drawdoubletop
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawdoublebottom
add bx, 88
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawdoublebottom
add bx, 88
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawhoriz
call drawvert
call drawdoublebottom
ret

drawdoubletop:
mov ah, 201
mov es:[bx], ah
add  bx, 2
mov ah, 205
mov cx, 8

startloop:
mov es:[bx], ah
add bx, 2
loop startloop

mov ah, 187
mov es:[bx], ah
inc dx
cmp dx, 4
jne drawdoubletop
mov dx, 0
add bx, 88; next line
ret

drawvert:
mov dx, 0

draw1:
mov ah, 186
mov es:[bx], ah

add bx , 6
mov ah, 179
mov cx, 2

startloop1:
mov es:[bx], ah
add bx, 6
loop startloop1
inc dx
cmp dx, 4
jne draw1
mov dx, 0

mov ah, 186
mov es:[bx], ah

add bx, 88
ret

drawhoriz:

mov ah, 186
mov es:[bx], ah
add bx, 2

mov dx, 0

draw2:
mov ah, 196
mov cx, 2
drawH:
mov es:[bx], ah
add bx, 2
mov es:[bx], ah
add bx, 2
mov ah, 197
mov es:[bx], ah
add bx, 2
mov ah, 196

loop drawH
mov es:[bx], ah
add bx, 2
mov es:[bx], ah
add bx, 2
mov ah, 186
mov es:[bx], ah
add bx, 2
inc dx
cmp dx, 4
jne draw2
mov dx, 0
add bx, 86;
ret

drawdoublebottom:
mov ah, 200
mov es:[bx], ah
add  bx, 2
mov ah, 205
mov cx, 8

startloop2:
mov es:[bx], ah
add bx, 2
loop startloop2

mov ah, 200
mov es:[bx], ah
inc dx
cmp dx, 4
jne drawdoublebottom

ret

instructions:

mov bx, 920
mov cx, 8
mov si, offset inst
i0:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i0

add bx, 144
mov si, offset inst1
mov cx, 5
i1:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i1

add bx, 150
mov si, offset inst2
mov cx, 7
i2:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i2

add bx, 146
mov si, offset inst4
mov cx, 7
i4:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i4

add bx, 146
mov si, offset inst3
mov cx, 8
i3:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i3

add bx, 144
mov si, offset inst6
mov cx, 15
i6:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i6

add bx, 130
mov si, offset inst7
mov cx, 15
i7:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i7

add bx, 130
mov si, offset inst5
mov cx, 7
i5:
mov ah, [si]
mov es:[bx], ah
inc si
add bx, 2
loop i5


ret

board1:
mov si, offset board
mov ah, 01h
mov cx, 07h
int 10h
mov bl, 12h
mov cl, 01h
jmp l1

l1:
mov ah, 02h
mov bh, 00h
mov dl, bl
mov dh, cl
int 10h

mov ah, 09h
mov al, [si]
cmp al, '$'
je finboard
cmp al, '0'
je skip
mov dl, bl
mov dh, cl
mov bl, 09h
mov cx, 1
int 10h
inc si
mov bl, dl
mov cl, dh
add bl, 3h
cmp bl, 36h
je nextline
jmp l1

skip:
mov al, 0h
mov ah, 0ah
mov dh, cl
mov cx, 1
int 10h
mov cl, dh
inc si
add bl, 3h
cmp bl, 36h
je nextline
jmp l1

nextline:
mov bl, 12h
add cl, 02h
jmp l1

finboard:
ret


cursor:
mov ah, 01h
mov cx, 07h
int 10h

mov bl, 12h
mov cl, 01h
mov al, 64h
jmp checkpos
jmp mouse

mouse:
mov ah, 02h
mov bh, 00h
mov dl, bl
mov dh, cl
int 10h
mov ah, 00h
int 16h
cmp al ,'1'
je input
cmp al ,'2'
je input
cmp al ,'3'
je input
cmp al ,'4'
je input
cmp al ,'5'
je input
cmp al ,'6'
je input
cmp al ,'7'
je input
cmp al ,'8'
je input
cmp al ,'9'
je input
cmp al ,'x'
je input
cmp al ,'y'
je input
cmp al ,'z'
je input
cmp al ,'r'
je resetpuz
cmp al, 08h
je delete1
cmp al, 73h
je down
cmp al, 77h
je up
cmp al, 61h
je left
cmp al, 64h
je right
cmp al, 'c'
je check5
cmp al, 113
je endmouse
jmp mouse
input:
mov ah, 09h
mov bl, 0fh
mov cx, 1
int 10h
mov bl, dl
mov cl, dh
mov al, 64h
jmp right
jmp mouse

delete1:    jmp delete

resetpuz:
      call board1
      jmp cursor
check5:
      jmp check

endmouse:
      mov ax, 4c00h
      int 21h

down: cmp cl, 17h
      je resetup
      add cl, 2h
      jmp checkpos
      jmp mouse
resetup:
      mov cl, 01h
      sub cl, 02h
      jmp down

up:   cmp cl, 01h
      je resetdown
      sub cl, 2h
      jmp checkpos
      jmp mouse
resetdown:
      mov cl, 17h
      add cl, 02h
      jmp up

right:cmp bl, 33h
      je resetleft
      add bl, 3h
      jmp checkpos
      jmp mouse
resetleft:
      mov bl, 12h
      sub bl, 3h
      jmp right

left: cmp bl, 12h
      je resetright
      sub bl, 3h
      jmp checkpos
      jmp mouse
resetright:
      mov bl, 33h
      add bl, 3h
      jmp left

extrastep:
            mov ah, 0h
            cmp al, 73h
            je down
            cmp al, 77h
            je up
            cmp al, 61h
            je left
            cmp al, 64h
            je right

mouse2: jmp cursor

check:  mov bl, 12h
        mov cl, 1h
        mov si, offset boardAns
        jmp check2


check2: cmp bl, 36h
        je checknextline
        mov ah, 02h
        mov bh, 00h
        mov dl, bl
        mov dh, cl
        int 10h
        mov ch, [si]
        cmp ch, '$'
        je mouse2
        mov ah, 08h
        int 10h
        cmp al, ch
        jne turnred
        inc si
        add dl, 3h
        mov bl, dl
        mov cl, dh
        jmp check2


turnred:mov ah, 09h
        mov bl, 04h
        mov cx, 1
        int 10h
        inc si
        add dl, 3h
        mov bl, dl
        mov cl, dh
        jmp check2

checknextline:
        mov bl, 12h
        add cl, 2h
        jmp check2

checkpos:
      mov ah, 02h
      mov bh, 00h
      mov dl, bl
      mov dh, cl
      int 10h
      mov ch, al
      mov ah, 08h
      mov bh, 00h
      int 10h
      mov al, ch
      cmp ah, 09h
      je extrastep
      jmp mouse

delete:
      mov dh, cl
      mov al, ' '
      mov ah, 0ah
      mov cx, 1
      int 10h
      mov cl, dh
      jmp mouse


ret



end start
