; Name: S. VISHNU TEJA
; Roll No: CS21B2037

; Finding the largest number in an array

.model small
.stack 100h
.data
    msg1 db "The larger number is : $"
    arr db 13h,20h,63h,58h,50h
.code
    mov ax, @data
    mov ds, ax

    mov cl, 0
    mov si, offset arr  ; State index initialization

    mov al, [si]        ; First Element of the array
    mov ah, 0

compare:
        inc si          ; Moving to next index
        cmp cl, 4       ; Loop exit condition
        jge exit
        inc cl          ; If not, increment cl
        cmp al, [si]    ; Comparing elements to find max
        jg compare
        cmp al, [si]
        jle move

move:
        mov al, [si]    ; Updating al with max value
        jmp compare

exit:
        aam
        add ax, 3030h   ; Converting ax to ascii
        mov cx,ax

        mov ah, 09h
        lea dx, msg1
        int 21h

        mov dl,ch       ; Printing first digit
        mov ah, 02h
        int 21h
        mov dl,cl       ; Printing second digit
        mov ah, 02h
        int 21h

        mov ax, 4c00h
        int 21h
end