; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Program to add two numbers in assembler and print a double digit number

.model small
.stack 100h
.data
        msg db "Sum of two numbers : $"
.code
        mov ax, @data
        mov ds, ax
        
        mov al, 08h     ; Taking 8 as input
        mov bl, 09h     ; Taking 9 as input
        
        mov ah, 0       ; Sending 0 to AH
        add al, bl       ; Adding the numbers into Assembler
        
        aaa             ; ASCII Adjust After Addition
        
        add al, 30h      ; Converting to ASCII for lower bit
        add ah, 30h      ; Converting to ASCII for higher bit
        mov bx, ax
        
        mov ah, 09h      ; Printing the message
        lea dx, msg
        int 21h
        
        mov dl, bh       ; Printing the first digit
        mov ah, 02h
        int 21h
        mov dl, bl       ; Printing the second digit
        mov ah, 02h
        int 21h
        
        mov ax, 4c00h    ; Exiting the program
        int 21h
end