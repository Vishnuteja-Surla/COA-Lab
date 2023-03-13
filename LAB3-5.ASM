; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Program to find the factorial of a number

.model small
.stack 100h
.data
        msg db "The Factorial of 3 is $"
        num1 equ 03h
        fact equ 01h
.code
        mov ax, @data
        mov ds, ax
                
        mov ah, 09h     ; Print "The Factorial of 3 is "
        lea dx, msg
        int 21h
        mov cl, num1    ; Move 3 to Counter
        mov al, fact    ; Move 1 to Accumilator

loop1:
        mul cl          ; Multiply Counter Value to fact
        dec cl          ; Decrease the counter
        jnz loop1
        
        add al, 30h     ; Converting to ASCII
        mov dl, al      ; Printing the answer
        mov ah, 02h
	int 21h
        
        mov ax, 4c00h   ; Exit
        int 21h
end