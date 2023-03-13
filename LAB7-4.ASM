; S.Vishnu Teja, CS21B2037

; Program to sort an array using bubble sort

.model small
.stack 100h

.data
         name1 db "S.Vishnu Teja, CS21B2037$"
         arr db 09h, 03h, 07h, 08h, 02h, 01h
         count db 06h

.code
         mov ax, @data
         mov ds, ax
 
         lea dx, name1
         mov ah, 09h
         int 21h         ; Printing my name
 
         mov dl, 10
         mov ah, 02h
         int 21h         ; New line
         
         mov cx, 05h

         mov si, 0
         

OUTLOOP:
         inc si
         mov di, si
         dec si
INLOOP:
         mov al, arr[si]
         mov bl, arr[di]
         cmp al, bl
         jl NONEXCHANGE
         mov arr[si], bl
         mov arr[di], al
NONEXCHANGE:
         inc di
         cmp di, 6
         jne INLOOP

         inc si
         dec cx
         cmp cx, 0         
         jne OUTLOOP

         mov si, 0
         mov cx, 6

PRINTARRAY:
         mov bl, arr[si]
         add bl, 30h
         mov ah, 02h
         mov dl, bl
         int 21h
         inc si
         dec cx
         cmp cx, 0
         jne PRINTARRAY

         mov ah, 4ch
         int 21h
end         