; Finding the sum of the array

.model small
.stack 100h
.data
        msg1 db "The sum is $"
        x db 2,2,3
        sum dw '0'
.code
        mov ax, @data
        mov ds, ax
        
        mov ax, 3       ; length of array
        mov bx, 0       ; sum
        mov si, offset x        ; array offset

top:
        add bx, [si]    ; Adding an element of array to sum
        add si, 1       ; incrementing the offset
        dec ax          ; decrementing the length
        jnz top         ; if length is not zero, go to top
        add bx, '0'     ; converting the sum to ASCII
        mov [sum], bx   ; storing the sum in sum variable
        mov ah, 09h     ; printing the sum
        lea dx, msg1
        int 21h
        mov dl, 10      ; printing a new line
        mov ah, 02h
        int 21h
        mov dx, sum     ; printing the sum
        mov ah, 02h
        int 21h

        mov ax, 4c00h   ; terminating the program
        int 21h
end
