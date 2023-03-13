; Printing Good Morning and Welcome to IIITDM in same line

.model small
.stack 100h
.data
        msg1 db "Good morning$"
        msg2 db "Welcome to IIITDM$"
.code
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h     ; print string
        lea dx, msg1
        int 21h

        mov ah, 09h     ; print string
        lea dx, msg2
        int 21h
        
        mov ax, 4c00h   ; exit to DOS
        int 21h
end
