;Nmuber Guessing Game
.model small
.stack 100h

.data
    secretnum dw ?
    usernum   dw ?

    chances db 10

    msg1 db 13,10,'Guess the number (100-999): $'
    msg2 db 13,10,'Congratulations! You guessed correctly.$'
    msg3 db 13,10,'Wrong guess.$'

    hintlow db 13,10,'Hint: Number is Higher!$'
    hinthigh db 13,10,'Hint: Number is lower Lower!$'

    msg4 db 13,10,'You lost! The number was: $'

.code

    mov ax, @data
    mov ds, ax

    
    ; Generate random number (100-999)
   
    mov ah, 00h
    int 1ah

    mov ax, dx
    mov bx, 900
    xor dx, dx
    div bx

    add dx, 100
    mov secretnum, dx

    mov cl, chances

game_loop:

    ; Display input message
    lea dx, msg1
    mov ah, 09h
    int 21h

   
    ; Take 3-digit input
   

    ; First digit
    mov ah, 01h
    int 21h
    sub al, '0'

    mov ah, 0
    mov bl, 100
    mul bl
    mov bx, ax

    ; Second digit
    mov ah, 01h
    int 21h
    sub al, '0'

    mov ah, 0
    mov dl, 10
    mul dl
    add bx, ax

    ; Third digit
    mov ah, 01h
    int 21h
    sub al, '0'

    mov ah, 0
    add bx, ax

    mov usernum, bx

   
    ; Compare numbers
    

    mov ax, usernum

    cmp ax, secretnum
    je correct

    ; Wrong guess message
    lea dx, msg3
    mov ah, 09h
    int 21h

  
    ; Hint System
    

    mov ax, usernum
    cmp ax, secretnum

    jl too_low
    jg too_high

too_low:
    lea dx, hintlow
    mov ah, 09h
    int 21h
    jmp continue

too_high:
    lea dx, hinthigh
    mov ah, 09h
    int 21h

continue:
    dec cl
    jnz game_loop

    
    ; Game Over
  

    lea dx, msg4
    mov ah, 09h
    int 21h

    mov ax, secretnum
    call print_num

    jmp exit

correct:
    lea dx, msg2
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h


; Procedure to Print Number in AX


print_num proc

    mov bx, 10
    xor cx, cx

divide:
    xor dx, dx
    div bx

    push dx
    inc cx

    cmp ax, 0
    jne divide

print:
    pop dx
    add dl, '0'

    mov ah, 02h
    int 21h

    loop print

    ret

print_num endp

.exit








