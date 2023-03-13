;S.Vishnu Teja, CS21B2037

; Program to reverse an array

.model small
.stack 100h

.data
    arr db 01h,02h,05h,03h,04h
    msg db "The reverse array is: $"
    count equ 05h
    name1 db "S.Vishnu Teja, CS21B2037$"

.code

    mov ax, @data
    mov ds, ax

    mov si, offset arr  ;First Position of the array
    mov di, offset arr  
    add di, count-1    ;Last Position of the array

    mov al, count
    mov bl, 2
    div bl
    mov cl, al        ; cl = count/2 so as to count for only half of the array

swap:
    mov al, [si]    ; Swapping the elements
    mov bl, [di]
    mov [di], al
    mov [si], bl

    inc si          ; Incrementing the pointers
    dec di
    loop swap         ; Loop until cl = 0

    mov si, offset arr      ; First Position of the array
    mov cx, count           ; Counting the number of elements in the array

    lea dx, msg
    mov ah, 09h
    int 21h

print:      ;Printing the array
    mov dl, [si]
    add dl, 30h
    mov ah, 02h
    int 21h

    add si, 1
    loop print      ;Loop until cx = 0

    mov dl, 10
    mov ah, 02h
    int 21h

    lea dx, name1
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

end