.model small
.stack 100h
.code

main proc
mov AX,@data
mov DS, AX

mov DI, offset array1 ; give the array the adress of array1
mov SI, offset array2 ; give the si the offset adress of array2
mov cx, 05 ; initialize the counter and store 5 in it

again: mov al, [si]
    mov bl , [di]

    mov [si], bl
    mov [di], al

    inc DI
    inc SI
    dec CX

    jnz again

mov ah,4ch ;for the termination of the program
int 21h

main endp

.data
array1 db 2, 3, 4, 5, 6
array2 db 7, 7, 8, 9, 9



end main