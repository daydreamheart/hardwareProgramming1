# Lokális sztring
#    - mint minden lokális változót, ezt is veremben tároljuk el
# karakter 1 bájttos adattípus, akkora területet kell foglalni, ahány karakterből áll
# a sorvégi '\0' karaktert is tárolni kell!

        .intel_syntax noprefix
        .section    .rodata
FORM:   .string     "The string is: %s\n"       # printf formátumsztringje
        .globl      main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 34                         # i = 4 bájt + 30 karakter 
        mov     DWORD PTR[rbp-34], 0            # ciklusváltozó [rbp-34]-en lesz (i)
        jmp     cond                    

body:
        mov     edx, DWORD PTR[rbp-34]          # ciklusváltozó betöltése edx-be
        add     edx, 65                         # ciklusváltozóhoz hozzáadjuk a 65-t (A + i)
        movsx   rax, DWORD PTR[rbp-34]          # ciklusváltozó betöltése rax regiszterbe a címzéshez
                                                # előjeles kiterjesztés szükséges, mert 4 bájtként van eltárolva
        mov     BYTE PTR[rbp-30+rax], dl        # aktuális tömbelem értékének megadása
                                                # rbp-30 = sztringünk kezdőcíme
                                                # rax tartalmazza az offset-et
                                                # dl az edx utolsó bájtja, itt található a 65
        add     DWORD PTR[rbp-34], 1            # ciklusváltozó növelése eggyel

cond:
        cmp     DWORD PTR[rbp-34], 26
        jl      body
        movsx   rax, DWORD PTR[rbp-34]          # még el kell tárolni a '\0'-t
                                                # ezért kell a ciklusváltozó érétke
        mov     BYTE PTR[rbp-30+rax], 0         # '\0' eltárolása (kezdőcím + i)
        lea     rsi, [rbp-30]                   # printf paramétereinek betöltése
                                                # a sztring (2. paraméter) rsi-be kerül
                                                # lea: meghatározza a 2. operandus címét és 1.-be kerül (rsi-be)
	                                        # a lokális változók címét töltjük bele
        mov     edi, OFFSET FLAt:FORM           # első paraméter, printf formátumsztringjének címe
        mov     eax, 0                          # float paraméterek száma
        call    printf                          # meghívása
        mov     eax, 0                          # beállítjuk a visszatérési értéket
        mov     rsp, rbp                        # bázis és veremmutatók visszaállítása
        pop     rbp
        ret





### C style ###
# #include<stdio.h>
# int main(){
#   int i;
#   char s[30];
#   for(i=0;i<26;i++)
#     s[i]=i+'A';
#   s[i]='\0';
#   printf("The string is: %s\n",s);
#   return 0; 
#   }
