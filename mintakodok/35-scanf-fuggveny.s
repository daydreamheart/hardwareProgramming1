# A scanf függvény
# első paramétere: formátumsztring, mely megadja a mintát, a beolvasandó adato kszerint
# következő paraméterei: memóriacímek, ahova ezeket az adatokat menteni akarjuk
# ezeknél a m.címeknél gondoskodnunk kell, hogy olyan paraméterekre mutassanak
# amit már lefoglaltunk az adott típusú adatnak
# függvény paramétereit regisztereken adjuk át (edi, esi, edx, ecx)
# eax-be a float-ok számát kell betölteni itt is (printefhez hasonlóan)

        .intel_syntax noprefix
        .section    .rodata
PFS1:   .string     "Enter your nickname and your age (separated by a space): "
SFS:    .string     "%s %d"
PFS2:   .string     "%s, are you really %d years old?\n"
        .globl      main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64                         # age (4) + name (30)
        mov     edi, OFFSET FLAT:PFS1
        mov     eax, 0
        call    printf
        lea     rdx, [rbp-34]                   # age változó betöltése a scanf-be
        lea     rsi, [rbp-30]                   # name sztring kezdőcímének betöltése
        mov     edi, OFFSET FLAT:SFS
        mov     eax, 0
        call    scanf
        mov     edx, DWORD PTR[rbp-34]
        lea     rsi, [rbp-30]			
        mov     edi, OFFSET FLAT:PFS2
        mov     eax, 0
        call    printf
        mov     eax, 0
        mov     rsp, rbp
        pop     rbp
        ret





### C style ###
# #include<stdio.h>
# int main(){
#   int age;
#   char name[30];
#   printf("Enter your nickname and your age (separated by a space): ");
#   scanf("%s %d",name,&age);
#   printf("%s, are you really %d years old?\n",name,age);
#   return 0; 
#   }
