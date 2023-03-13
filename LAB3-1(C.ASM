; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Program to add two numbers using procedure and printing two digit answer

.model small
.stack 100h
.data
	msg db "The sum is $" 
	res dw '0'
.code
	mov ax, @data 
	mov ds,ax


	mov cl, '8' ;Taking 8 as input
	sub cl, '0' ;Converting 8 to binary
	mov bl, '7' ;Taking 7 as input
	sub bl, '0' ;Converting 7 to binary
	clc
	call sum 	;Procedure calling
	
	mov bx, ax 	;Sending the output to bx
	mov ah, 09h ;Printing the message
	lea dx, msg
	int 21h

	mov dl, 10 	;New Line
	mov ah, 02h
	int 21h 
	mov dl, bh 	;Printing the first digit of answer
	mov ah, 02h
	int 21h
	mov dl, bl 	;Printing the second digit of answer
	mov ah, 02h
	int 21h

    mov ax, 4c00h	;Exit
	int 21h

sum:
	mov ah, 0
	mov al, cl
	add al, bl
	aaa
	add al, 30h
	add ah, 30h
	ret
end