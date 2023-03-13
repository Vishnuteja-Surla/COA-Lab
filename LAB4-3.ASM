; Program to count the number of vowels in a string

.MODEL SMALL
.STACK 100H

.DATA
         STRING DB "computer organisation$"
         VOWEL DB ?
         NAME1 DB "S.VISHNU TEJA, CS21B2037$"

.CODE
         MOV AX, @DATA
         MOV DS, AX

         MOV AH, 09H     ; My details to the screen
         LEA DX, NAME1
         INT 21H

         MOV DL, 10     ; New line
         MOV AH, 02H
         INT 21H
         
         MOV SI, OFFSET STRING      ; String to be checked
         MOV BL, 00     
        
BACK: 
         MOV AL, [SI]   ; Sending a character to AL
         CMP AL,'$'     ; Checking for end of string
         JZ FINAL       ; If end of string, go to FINAL
         CMP AL,'a'     ; Checking for a
         JZ COUNT       ; If vowel, go to COUNT
         CMP AL,'e'     ; Checking for e
         JZ COUNT       ; If vowel, go to COUNT
         CMP AL,'i'     ; Checking for i
         JZ COUNT       ; If vowel, go to COUNT
         CMP AL,'o'     ; Checking for o
         JZ COUNT       ; If vowel, go to COUNT
         CMP AL,'u'     ; Checking for u
         JZ COUNT       ; If vowel, go to COUNT
         INC SI         ; If not a vowel, increment SI
         JMP BACK       ; Go to BACK
         
COUNT:
         INC BL         ; Increment BL
         INC SI         ; Increment SI
         JMP BACK       ; Go to BACK
         
FINAL: 
         ADD BL, 30H    ; Converting BL to ASCII
         MOV AH, 02H    ; Printing the number of vowels
         MOV DL, BL     ; to the screen
         INT 21H        
         SUB BL, 30H    ; Converting BL to integer

         MOV AH, 4CH    ; Exit
         INT 21H
END  
