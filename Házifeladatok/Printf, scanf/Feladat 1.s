# Írjunk  egy  programot,  mely  bekér  a  billentyűzetről  két  egész  számot, majd  kiírja  a képernyőre az összegüket! 

        .intel_syntax noprefix
        .section    .rodata
PF1:    .string     "Írj be két számot szóközzel elválasztva!\n"
SF:     .string     "%d %d"
PF2:    .string     "%d és %d összege: %d\n"
        .globl      main

main:
        push        rbp
        mov         rbp, rsp
        sub         rsp, 16
        mov         edi, OFFSET FLAT:PF1
        mov         eax, 0
        call        printf
        lea         rdx, [rbp-8]
        lea         rsi, [rbp-4]
        mov         edi, OFFSET FLAT:SF
        mov         eax, 0
        call        scanf
        mov         eax, DWORD PTR[rbp-8]
        add         eax, DWORD PTR[rbp-4]
        mov         ecx, eax
        mov         edx, DWORD PTR[rbp-8]
        mov         esi, DWORD PTR[rbp-4]
        mov         edi, OFFSET FLAT: PF2
        mov         eax, 0
        call        printf
        mov         eax, 0
        mov         rsp, rbp
        pop         rbp
        ret

# include <stdio.h>int main(){
#    int a, b;
#    printf("Írj be két számot szóközzel elválasztva!\n");
#    scanf("%d %d", &a, &b);
#    printf("%d és %d összege: %d\n", a, b, a+b);
#    return 0;
# }
