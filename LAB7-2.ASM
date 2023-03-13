; S.Vishnu Teja, CS21B2037

; Program to print a string in reverse order

.model small
.stack 100h

.data
         name1 db "S.Vishnu Teja, CS21B2037$"
         instring db "Computer Organization and Design Practice$"
         statement1 db "The String is : $"
         statement2 db "The Reverse String is : $"

.code
         mov ax, @data
         mov ds, ax
 
         lea dx, name1
         mov ah, 09h
         int 21h         ; Printing my name
 
         mov dl, 10
         mov ah, 02h
         int 21h         ; New line

         lea dx, statement1     ; Printing the statement-1
         mov ah, 09h
         int 21h

         lea dx, instring       ; Printing the string
         mov ah, 09h
         int 21h

         mov dl, 10
         mov ah, 02h
         int 21h         ; New line

         lea dx, statement2     ; Printing the statement-2
         mov ah, 09h
         int 21h

         mov si, 0              ; si is the index of the string
         mov cx, 0              ; cx is the length of the string

COUNTSTR:
         cmp instring[si], '$'  ; Checking for the end of the string
         je REVERSEPRINT        ; If end of string is reached, then print the string in reverse order
         inc si                 ; Else, increment the index
         inc cx                 ; and increment the length
         cmp instring[si], '$'  ; Checking for the end of the string
         jne COUNTSTR           ; If end of string is not reached, then continue
         
         mov bx, cx             ; bx is the length of the string
         mov si, bx             ; si is the index of the string

REVERSEPRINT:
         mov bl, instring[si-1] ; bl is the character at the index si-1
         mov ah, 02h            ; Printing the character
         mov dl, bl
         int 21h
         dec si                 ; Decrementing the index
         cmp si, 0              ; Checking if the index is 0
         jne REVERSEPRINT       ; If index is not 0, then continue

         mov ah, 4ch            ; Exit
         int 21h

end