; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Calculating the value of pow(a,b) in MASM

.model small
.stack 100h
.data
	msg db "(a^b) : $"
	a equ 04h
	b equ 02h

.code
	mov ax, @data
	mov ds, ax
	
	mov ah, 09h 	; Printing "(a^b) : "
	lea dx, msg
	int 21h
	mov bl, a		; Storing a in bl
	mov cl, b		; Storing b in cl
	mov al, 01h

power:
	mul bl
	aam 			; ASCII Assembly Multiplication
	dec cl 			; Decreasing the counter
	jnz power
	
	add al, 30h 	; Converting to ASCII
	add ah, 30h 	; Converting to ASCII
	mov bx, ax 		; Moving answer to bx
	
	mov dl, bh 		; Printing the first digit
	mov ah, 02h
	int 21h
	mov dl, bl 		; Printing the second digit
	mov ah, 02h
	int 21h
	mov ax, 4c00h	; Exiting the program
	int 21h
end	