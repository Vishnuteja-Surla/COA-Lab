; Printing Hello World

.model small
.stack 100h

.data
        msg db "Hello World$"
.code
        mov ax, @data
        mov ds, ax

        mov ah, 09h     ; write string to screen
        lea dx, msg
        int 21h

        mov ax, 4c00h   ; exit to DOS
        int 21h
end
