; S.Vishnu Teja, CS21B2037

; Program to add two arrays and store the result in third array

.model small
.stack 100h

.data
      M db 01h, 02h, 03h, 04h
      N db 04h, 05h, 06h, 05h
      R db 01h, 02h, 03h, 04h
      output db "The Sum array is $"
      name1 db "S.Vishnu Teja, CS21B2037$"

.code
        mov ax, @data
        mov ds, ax

        mov si, 0       ; Setting offset for R array
        mov cx, 4       ; Setting the array counter to 4

        lea dx, name1   ; Printing the name
        mov ah, 09h
        int 21h

        mov dl, 10      ; Printing a new line
        mov ah, 02h
        int 21h

        lea dx, output  ; Printing the output string
        mov ah, 09h
        int 21h

ADDARRAYS:
        mov al, R[si]    ; Setting First Value in Accumilator
        mov bl, N[si]
        add al, bl    ; Adding second value to first
        mov R[si], al    ; Sending the output back to Array R
        inc si          ; Incrementing offsets
        dec cx          ; Decrementing counter
        cmp cx, 0
        jne ADDARRAYS  ; Looping Condition

        mov si, 0        ; Setting offset to Array R again
        mov cx, 4       ; Setting counter to 4 again

PRINT:
        mov bl, R[si]
        add bl, 30h
        mov ah, 02h
        mov dl, bl
        int 21h
        inc si
        dec cx
        cmp cx, 0
        jne PRINT

        mov ax, 4c00h
        int 21h

end



