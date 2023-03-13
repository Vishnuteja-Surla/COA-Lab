; Printing the sum of 3 and 4

.model small
.stack 100h

.data
        msg1 db "The sum is $"

.code
        mov ax, @data
        mov ds, ax
        
        mov al, 03h     ; 3
        mov bl, 04h     ; 4
        add al,bl       ; 3 + 4 = 7
        
        add al, 30h     ; Convert to ASCII
        mov cl, al      ; Save the result
        mov ah, 09h     ; Write string to screen
        lea dx, msg1
        int 21h
        
        mov dl, cl      ; Print the result
        mov ah, 02h
        int 21h
        
        mov ax, 4c00h
        int 21h
end
