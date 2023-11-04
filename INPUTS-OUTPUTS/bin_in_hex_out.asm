

.model small
.stack 100h
.386 

.data
msg1 db "Enter the digit in binary: $"

; var dw ?
char_str db "The number in hex is: $"
new_line  db 10, 13, "$" ;new line character


.code


main proc 
    mov ax, @data
    mov ds, ax

    ;taking the input
    mov dx, offset msg1
    mov ah, 09
    int 21H

    mov cx, 16
    mov bx, 0000

    while_ :


        mov ah,01
        int 21H

        sub al ,30H
        ; mov bx, ax
        shl bx, 1

        or bl, al

        dec cx

    jnz while_

    mov DX, offset new_line
    mov AH, 09
    int 21H


    mov dx, offset char_str
    mov ah,09
    int 21H

    mov cl, 4

    again:
        rol bx, 4

        mov al, bl
        and al , 0Fh
        add al, 30h

        cmp al, 39h
        jle display

        add al , 7H
        mov dl, Al
        mov ah,02
        int 21H

        dec cl

        jnz again
        jmp exit

    display:
        mov dl ,al
        mov ah, 02
        int 21H

        dec cl
        jnz again

    exit:
        mov ah,4ch
        int 21H
    

main endp

    end main