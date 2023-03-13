; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Printing if a number is even or odd

.model small
.stack 100h
.data
	msg db "The Given Number is $"
	msg1 db "Even$"
	msg2 db "Odd$"
	num1 equ 07h

.code
	mov ax, @data
	mov ds, ax
	
	mov ax, num1 	; Storing the number in Assembler
	mov bl, 02h
	div bl 			; Dividing Assembler by 2
	add ah, 30h 	; Converting to ASCII
	mov ch, ah
	cmp ch, 00 		; Comparing remainder to 0
	je eve 			; Remainder=0 condition
	cmp ch, 00 		; Comparing remainder to 0
	jne od 			; Remainder!=0 condition

eve:
	mov ah, 09h 	;Print "The Given number is "
	lea dx, msg
	int 21h
	mov ah, 09h 	;Print "Even"
	lea dx, msg1
	int 21h
	mov dl, 10 		;Next Line
od:
	mov ah, 09h 	;Print "The Given number is "
	lea dx, msg
	int 21h
	mov ah, 09h 	;Print "Odd"
	lea dx, msg2
	int 21h
	mov dl, 10 		;Next Line
	
	mov ax, 4c00h	;Exit
	int 21h	
end