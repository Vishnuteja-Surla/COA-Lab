; Performing Add, Subtract, Multiply and Divide on two numbers n1 and n2

.model small
.stack 100h
.data
        msg1 db "The sum is $"
        msg2 db "The difference is $"
        msg3 db "The product is $"
        msg4 db "The quotient is $"
        num1 equ 04h
        num2 equ 02h
.code
        mov ax, @data
        mov ds, ax
        
        ; Adding two numbers
        mov al, num1    ; Load the first number into AL
        mov bl, num2    ; Load the second number into BL
        add al, bl      ; Add the two numbers
        add al, 30h     ; Convert the result to ASCII
        mov cl, al      ; Move the result to CL
        mov ah, 09h     ; Print the msg1
        lea dx, msg1
        int 21h
        mov dl, cl      ; Print the result
        mov ah, 02h
        int 21h
        mov dl, 10      ; Print a new line
        mov ah, 02h
        int 21h
        
        ; Subtracting two numbers
        mov al, num1    ; Load the first number into AL
        mov bl, num2    ; Load the second number into BL
        sub al, bl      ; Subtract the two numbers
        add al, 30h     ; Convert the result to ASCII
        mov cl, al      ; Move the result to CL
        mov ah, 09h     ; Print the msg2
        lea dx, msg2
        int 21h
        mov dl, cl      ; Print the result
        mov ah, 02h
        int 21h
        mov dl, 10      ; Print a new line
        mov ah, 02h
        int 21h

        ; Multiplying two numbers
        mov al, num1    ; Load the first number into AL
        mov bl, num2    ; Load the second number into BL       
        mul bl          ; Multiply the two numbers
        add al, 30h     ; Convert the result to ASCII
        mov cl, al      ; Move the result to CL
        mov ah, 09h     ; Print the msg3
        lea dx, msg3
        int 21h
        mov dl, cl      ; Print the result
        mov ah, 02h
        int 21h
        mov dl, 10      ; Print a new line
        mov ah, 02h
        int 21h

        ; Dividing two numbers
        mov ax, num1    ; Load the first number into AX
        mov bl, num2    ; Load the Second number into BL
        div bl          ; Divide the two numbers
        add al, 30h     ; Convert the result to ASCII
        mov cl, al      ; Move the result to CL
        mov ah, 09h     ; Print the msg4
        lea dx, msg4
        int 21h
        mov dl, cl      ; Print the result
        mov ah, 02h
        int 21h
        mov dl, 10      ; Print a new line
        mov ah, 02h
        int 21h

        mov ax, 4c00h   ; Exit to DOS
        int 21h
end