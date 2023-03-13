; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Program to add two numbers by taking user input

.model small
.stack 100h
.data
	msg db "The sum is $" 
.code
	mov ax, @data 
	mov ds, ax
	mov ah, 1	; Taking input from the user in ASCII format
	int 21h
	sub al, 30h ; Convert to Binary
	mov bl, al
	mov ah, 1	; Taking input from the user in ASCII format
	int 21h
	sub al, 30h ; Convert to Binary
	
	mov ah, 0	; Sending 0 to AH
	add al, bl 	; Adding the numbers into Assembler
	aaa  		; ASCII Adjust After Addition
	add al, 30h ; Converting to ASCII for lower bit
	add ah, 30h ; Converting to ASCII for higher bit

	mov bx, ax
	mov ah, 09h ; Printing the message
	lea dx, msg
	int 21h
	mov dl, bh
	mov ah, 02h ; Printing the first digit
	int 21h
	mov dl, bl
	mov ah, 02h ; Printing the second digit
	int 21h
	
	mov ax, 4c00h	; Exit
	int 21h
end