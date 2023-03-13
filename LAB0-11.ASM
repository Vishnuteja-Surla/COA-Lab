; Program for adding two numbers in MASM using call and ret

.model small
.stack 100h
.data
        msg1 db "The sum is$"
        res dw '0'
.code
        mov ax, @data
        mov ds, ax
        
        mov cx, '3'     ; Moving 3 to cx
        sub cx, '0'     ; Coverting ASCII to number
        mov bx, '5'     ; Moving 5 to bx
        sub bx, '0'     ; Coverting ASCII to number
        clc             ; Clearing carry flag
        call sum        ; Calling sum function
        mov [res], ax   ; Storing the result in res

        mov ah, 09h     ; Printing the result
        lea dx, msg1
        int 21h

        mov dl, 10       ; Printing new line
        mov ah, 02h
        int 21h

        mov dx, res      ; Printing the result
        mov ah, 02h
        int 21h

sum:
        mov ax, cx      ; Moving cx to ax
        add ax, bx      ; Adding bx to ax
        add ax,'0'      ; Coverting number to ASCII
        ret        ; Returning to the caller
        
        mov ax, 4c00h   ; Exit
        int 21h
end