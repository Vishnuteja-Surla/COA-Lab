; Printing numbers from 0 to 9 using loop

.model small
.stack 100h
.data
        msg db "The counting from 0 to 9 is $"
.code
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h     ; Print string to screen
        lea dx, msg
        int 21h
        mov cx, 0ah     ; Set counter to 10
        mov dl, 0h      ; Set dl to 0

loop1:
        add dl, 30h     ; Convert dl to ASCII
        mov ah, 02h     ; Print character to screen
        int 21h
        sub dl, 30h     ; Convert dl to number
        inc dl          ; Increment dl
        dec cx          ; Decrement counter
        jnz loop1       ; Jump to loop1 if cx is not 0
        
        mov ax, 4c00h   ; Exit program
        int 21h
end

