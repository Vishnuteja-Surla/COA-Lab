; Printing the largest of three numbers

.model small
.stack 100h
.data
        msg db "The largest number is $"
        num1 db '4'
        num2 db '7'
        num3 db '8'
        large db ?
.code
        mov ax, @data
        mov ds, ax
        
        mov cl,[num1]   ; Move the first number into cl
        cmp cl,[num2]   ; Compare it with the second number
        jg third        ; If greater, jump to third
        mov cl,[num2]   ; If not, move the second number into cl
        cmp cl,[num3]   ; Compare it with the third number
        jg exit         ; If greater, jump to exit
        mov cl,[num3]   ; If not, move the third number into cl
        jmp exit        ; Jump to exit

third:
        cmp cl,[num3]   ; Compare the first number with the third number
        jg exit         ; If greater, jump to exit
        mov cl,[num3]   ; If not, move the third number into cl

exit:
        mov [large],cl  ; Move the largest number into large
        mov ah, 09h     ; Print the message
        lea dx, msg
        int 21h
        mov dl,10       ; New Line
        mov ah, 02h
        int 21h
        mov dl, large   ; Print the largest number
        mov ah, 02h
        int 21h
        mov ax, 4c00h   ; Exit
        int 21h
end
