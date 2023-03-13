; Program to print an array in a matrix form and print the number of rows and columns in the array

.model small
.stack 100h

.data
	arr db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h
	row db 03h
	col db 03h
	name1 db "S.Vishnu Teja, CS21B2037$"
	rowst db "The number of rows are $"
	colst db "The number of columns are $"

.code
	mov ax, @data
	mov ds, ax

	lea dx, name1	; print name
	mov ah, 09h
	int 21h

	mov dl, 10		; print new line
	mov ah, 02h
	int 21h

	mov cx, 09h		; set counter to 9
	mov si, 0
	mov bx, 0

PRINT:
	mov al, arr[si]		; sending a number from array to accumilator
	add al, 30h			; coverting it to ASCII
	mov ah, 02h			; sending it to screen
	mov dl, al
	int 21h
	inc si				; incrementing the index of array
	dec cx				; decrementing the counter
	add bl, 1			; incrementing the counter for printing new line
	cmp bl, 3			; checking if the counter is 3
	je NEWLINE			; if yes, print new line
	cmp cl, 0			; checking if the counter is 0
	jne PRINT			; if not, print the next number

NEWLINE:
	mov bl, 0			; reset the counter
	mov dl, 10			; print new line
	mov ah, 02h
	int 21h
	cmp cl, 0			; checking if the counter is 0
	jne PRINT			; if not, print the next number

	mov ah, 09h			; print the row statement
	lea dx, rowst	
	int 21h
	mov al, row			; sending the number of rows to accumilator
	add al, 30h			; coverting it to ASCII
	mov ah, 02h			; sending it to screen
	mov dl, al
	int 21h
	
	mov dl, 10			; print new line
	mov ah, 02h
	int 21h
	
	mov ah, 09h			; print the column statement
	lea dx, colst
	int 21h
	mov al, col			; sending the number of columns to accumilator
	add al, 30h			; coverting it to ASCII
	mov ah, 02h			; sending it to screen
	mov dl, al
	int 21h
	
	mov dl, 10			; print new line
	mov ah, 02h
	int 21h
	
	mov ax, 4c00h		; exit
	int 21h
end