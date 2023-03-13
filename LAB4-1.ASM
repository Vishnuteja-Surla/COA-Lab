; Printing the number of 1s in the binary form of a given number

.MODEL SMALL
.STACK 100H

.DATA
         MSG1 DB "Enter a number : $"
         MSG2 DB "The number of 1s in Binary : $"
         NAME1 DB "S.VISHNU TEJA, CS21B2037$"
         COUNT EQU 0

.CODE
         MOV AX, @DATA
         MOV DS, AX

         MOV AH, 09H     ; Displaying the name
         LEA DX, NAME1
         INT 21H

         MOV DL, 10     ; New Line
         MOV AH, 02H
         INT 21H

         MOV AH, 09H    ; Displaying the message
         LEA DX, MSG1
         INT 21H

         MOV AH, 01H    ; Taking the input
         INT 21H

         MOV BL, 00     ; Initializing the count
         MOV CL, 04H    ; Looping 4 times

AGAIN:
         ROL AL, 1      ; Rotating the bits
         JNC NEXT       ; If the carry flag is not set, then jump to NEXT
         INC BL         ; Else increment the count

NEXT:
         LOOP AGAIN     ; Looping again

         MOV AH, 09H    ; Displaying the message
         LEA DX, MSG2
         INT 21H

         ADD BL, 30H    ; Converting the count to ASCII
         MOV AH, 02H    ; Displaying the count
         MOV DL, BL     ; Displaying the count
         INT 21H
         SUB BL, 30H    ; Converting the count back to binary

         MOV AH, 4CH    ; Exiting the program
         INT 21H
END
