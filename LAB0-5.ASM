; Print the sum of two numbers using variables

.model small
.stack 100h
.data
        msg1 db "The sum is$"
        n1 db 05h
        n2 db 04h
.code
        mov ax, @data
        mov ds, ax
        
        mov al, n1      ; al = n1
        mov bl, n2      ; bl = n2
        add al, bl      ; al = n1 + n2
        
        add al, 30h     ; Convert to ASCII
        mov cl, al
        mov ah, 09h     ; Write string to screen
        lea dx, msg1
        int 21h
        
        mov dl, 10      ; New Line
        mov ah, 02h
        int 21h
        mov dl, cl      ; Write sum to screen
        mov ah, 02h
        int 21h
        mov ax, 4c00h   ; Exit
        int 21h
end
