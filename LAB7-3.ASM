; S.Vishnu Teja, CS21B2037

; Program to check whether a given number is prime or not from the keyboard.

.model small
.stack 100h

.data
         msg db '$'
         name1 db "S.Vishnu Teja, CS21B2037$"
         msg1 db 'Enter a number: $'
         msg2 db 'The given number is prime. $'
         msg3 db 'The  given number is not prime. $'
         cr   db 0dh, 0ah, '$'
.code
         mov ax, @data
         mov ds, ax
         mov ah, 09h
         lea dx, name1    
         int 21h
         mov dl, 10
         mov ah, 02h
         int 21h

         mov ah, 09h
         lea dx, msg1
         int 21h
         mov ah, 01h
         int 21h
         sub al, 30h    
         mov bl, al

         mov ah, 09h
         lea dx, cr
         int 21h

         mov cx, 2      
         mov dx, 0      
         mov ax, bx      
         test ax, 1      
         jz EVENNUM  
     
PRIME:
         cmp cx, ax      
         jae PRIMENUM      
     
         div cx          
         cmp dx, 0                              ; CHECKING THE PRIMES
         je NONPRIME    
     
         add cx, 2      
         jmp PRIME

EVENNUM:
         cmp ax, 2      
         je PRIMENUM
         jmp NONPRIME                           ; CHECKING FOR EVEN

NONPRIME:
   
         mov ah, 09h
         lea dx, msg3			; NOT PRIME
         int 21h
         jmp ENDING

PRIMENUM:
   
         mov ah, 09h
         lea dx, msg2
         int 21h

ENDING:
   
         mov ah, 09h
         lea dx, cr
         int 21h
         mov ah, 4ch
         int 21h


END