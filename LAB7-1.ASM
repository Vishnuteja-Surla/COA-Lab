; S.Vishnu Teja, CS21B2037

; Program to display the current time in DOS

.model small
.stack 100h

.data
         name1 db "S.Vishnu Teja, CS21B2037$"
         statement db "Current time is : $"

.code
         mov ax, @data
         mov ds, ax
 
         lea dx, name1   ; Printing my name
         mov ah, 09h
         int 21h
 
         mov dl, 10     ; New line
         mov ah, 02h
         int 21h         
 
         lea dx, statement  ; Printing the statement
         mov ah, 09h
         int 21h
 
         mov ah, 2ch     ; Get System time
         int 21h
         mov al, ch      ; To send hours to accumilator
         aam             ; To convert BCD to Binary
         mov bx, ax      ; To send hours to BX
         call DISPLAY    ; To display hours
 
         mov dl, ':'
         mov ah, 02h     ; Print : in DOS
         int 21h
 
         mov ah, 2ch     ; Get System time
         int 21h
         mov al, cl      ; To send minutes to accumilator
         aam             ; To convert BCD to Binary
         mov bx, ax      ; To send minutes to BX
         call DISPLAY    ; To display minutes
 
         mov dl, ':'
         mov ah, 02h     ; Print : in DOS
         int 21h
 
         mov ah, 2ch     ; Get System time
         int 21h
         mov al, dh      ; To send seconds to accumilator
         aam             ; To convert BCD to Binary
         mov bx, ax      ; To send seconds to BX
         call DISPLAY    ; To display seconds
 
         mov dl, '.'
         mov ah, 02h     ; Print : in DOS
         int 21h
 
         mov ah, 2ch     ; Get System time
         int 21h
         mov al, dl      ; To send milli-seconds to accumilator
         aam             ; To convert BCD to Binary
         mov bx, ax      ; To send milli-seconds to BX
         call DISPLAY    ; To display milli-seconds
 
         mov ah, 4ch     ; To exit from DOS
         int 21h

DISPLAY proc
         mov dl, bh
         add dl, 30h     
         mov ah, 02h     ; To Print Higher bit in DOS
         int 21h
         mov dl, bl       
         add dl, 30h     
         mov ah, 02h     ; To Print Lower bit in DOS
         int 21h
         ret
         DISPLAY ENDP

end
