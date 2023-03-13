; Printing Good Morning and Welcome to IIITDM in different lines
 
.model small
.stack 100h
.data
        msg1 db "Good morning$"
        msg2 db "Welcome to IIITDM$"
.code
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h     ; 09h is for printing string
        lea dx, msg1    ; lea is used to load effective address
        int 21h

        mov dl, 10       ; 10 is for new line
        mov ah, 02h      ; 02h is for printing character
        int 21h

        mov ah, 09h     ; 09h is for printing string
        lea dx, msg2    ; lea is used to load effective address
        int 21h
        
        mov ax, 4c00h
        int 21h
end
