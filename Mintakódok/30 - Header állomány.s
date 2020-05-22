# Header állomány

    .intel_syntax noprefix
    .globl  main

main:
    push    rbp
    mov     rbp, rsp
    call    getchar         # stdio.h
    sub     eax, 32
    mov     edi, eax
    call    putchar         # stdio.h
    mov     edi, 10         # \n
    call    putchar         # stdio.h
    mov     edi, 3
    call    sleep           # unistd.h
    call    rand            # stdlib.h
    mov     rsp, rbp
    pop     rbp
    ret


### C style ###
# #include<stdio.h>
# #include<stdlib.h>
# #include<unistd.h>
# int main(){
#   putchar(getchar()-32);
#   putchar('\n');
#   sleep(3);
#   return rand(); 
#   }
