; Program to count the number of characters in a string and compare two strings

.model small
.stack 100h

.data
        name1 db "S.Vishnu Teja, CS21B2037$"
        msg1 db "Computer Organisation Practical$"
        msg2 db "Computer Organisation Practical$"
        msg3 db "Computer Organisation Practical$"
        msg4 db "Computer Organisation and Practical$"
        output1 db "The statements are equal$"
        output2 db "The statements are not equal$"
	output3 db "The counts are $"
	count dw 4 dup(?)

.code
	mov ax, @data
	mov ds, ax

	mov si, 0	; Setting the index to 0
	mov di, 0	; Setting the index to 0
	mov cx, 0	; Setting the counter to 0

COUNTSTR1:
	cmp msg1[si], '$'	; Checking for the end of the string
	je COUNTSTR2		; If end of string, jump to COUNTSTR2
	inc si				; Else increment the index
	inc cx				; Increment the counter
	mov count[di], cx	; Store the counter value in the array
	jmp COUNTSTR1		; Jump to COUNTSTR1

COUNTSTR2:
	mov si, 0			; Setting the index to 0
	mov cx, 0			; Setting the counter to 0
	inc di				; Increment the index
	STR2MINI:			
		cmp msg2[si], '$'	; Checking for the end of the string
		je COUNTSTR3		; If end of string, jump to COUNTSTR3
		inc si				; Else increment the index
		inc cx				; Increment the counter		
		mov count[di], cx	; Store the counter value in the array
		jmp STR2MINI		; Jump to STR2MINI
COUNTSTR3:					
	mov si, 0			; Setting the index to 0
	mov cx, 0			; Setting the counter to 0
	inc di				; Increment the index
	STR3MINI:
		cmp msg3[si], '$'	; Checking for the end of the string
		je COUNTSTR4		; If end of string, jump to COUNTSTR4
		inc si				; Else increment the index
		inc cx				; Increment the counter
		mov count[di], cx	; Store the counter value in the array
		jmp STR3MINI		; Jump to STR3MINI

COUNTSTR4:
	mov si, 0			; Setting the index to 0
	mov cx, 0			; Setting the counter to 0
	inc di				; Increment the index
	STR4MINI:
		cmp msg4[si], '$'	; Checking for the end of the string
		je PRINTCOUNT		; If end of string, jump to PRINTCOUNT
		inc si				; Else increment the index
		inc cx				; Increment the counter
		mov count[di], cx	; Store the counter value in the array
		jmp STR4MINI		; Jump to STR4MINI

PRINTCOUNT:
	lea dx, output3			; Print the output
	mov ah, 09h
	int 21h

	mov si, 0				; Setting the index to 0
	mov cx, 0				; Setting the counter to 0
	
	PRINT:
        mov bx, count[si]	; Printing the count
        add bl, 30h			
        mov ah, 02h
        mov dl, bl
        int 21h
        inc si				; Increment the index
        dec cx				; Decrement the counter
        cmp cx, 0			; Check if the counter is 0
        jne PRINT			; If not, jump to PRINT

	mov si, 0				; Setting the index to 0

COMPARET1:
        cmp msg1[si], '$'	; Checking for the end of the string
        je STRING1END		; If end of string, jump to STRING1END
        cmp msg2[si], '$'	; Checking for the end of the string
        je STRING2END		; If end of string, jump to STRING2END
        mov al, msg1[si]	; Comparing the strings
        mov bl, msg2[si]
        cmp al, bl
        jne NOTEQUALSTR1	; If not equal, jump to NOTEQUALSTR1
        inc si				; Else increment the index
        jmp COMPARET1		; Jump to COMPARET1

STRING1END:
        cmp msg2[si], '$'	; Checking for the end of the string
        jne NOTEQUALSTR1	; If not end of string, jump to NOTEQUALSTR1
        jmp EQUALSTR1		; Else jump to EQUALSTR1

STRING2END:
        cmp msg1[si], '$'	; Checking for the end of the string
        jne NOTEQUALSTR1	; If not end of the string, jumpto NOTEQUALSTR1
        jmp EQUALSTR1		; Else jump to EQUALSTR1

NOTEQUALSTR1:
        lea dx, output2		; Print the output-2
        mov ah, 09h
        int 21h
        jmp COMPARET2		; Jump to COMPARET2

EQUALSTR1:
        lea dx, output1		; Print the output-1
        mov ah, 09h
        int 21h
        jmp COMPARET2		; Jump to COMPARET2

; Applying same for set-2
COMPARET2:
	mov si, 0
	T2MINI:
        	cmp msg3[si], '$'
        	je STRING3END
        	cmp msg4[si], '$'
        	je STRING4END
        	mov al, msg3[si]
        	mov bl, msg4[si]
        	cmp al, bl
        	jne NOTEQUALSTR2
        	inc si
        	jmp T2MINI

STRING3END:
        cmp msg4[si], '$'
        jne NOTEQUALSTR2
        jmp EQUALSTR2

STRING4END:
        cmp msg3[si], '$'
        jne NOTEQUALSTR2
        jmp EQUALSTR2

NOTEQUALSTR2:
        lea dx, output2
        mov ah, 09h
        int 21h
        jmp ENDING

EQUALSTR2:
        lea dx, output1
        mov ah, 09h
        int 21h
        jmp ENDING

ENDING:
	mov ah, 4ch		; Exit the program
	int 21h
end      
