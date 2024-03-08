# A printf függvény
# első paramétere: formátumsztring
# további paraméterei: formátumsztringben %-kal kezdődő formátumspecifikációk helyére beszúrt értékek
# visszatérési értéke: képernyőre írt karakterek száma

# Assemblyben: formátumsztringet konstans sztringként adjuk meg
# első paraméter: a sztring kezdőcímét EDI regiszterbe töltjük meg
# következő paraméterek: EDI, ESI, ECX regiszterekbe (előadáson: ESI, ECX, EDI-t mondott, utána nézni)
# Assemblyben plusz paraméter: float paraméterek száma - ezt eaxba töltjük
# visszatérési érték eax-ba kerül

        .intel_syntax   noprefix
        .section    .rodata
.LC0:   .string     "world!"                    # printf "world!" paramétere
.LC1:   .string     "Hello %s%c%d\n"            # formátumsztring
        .globl      main


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8                          # helyfoglalás a 2 integer számára
        call    rand                            # visszatérési érték eax-ban
        and     eax, 0xffff                     # ÉS művelet az FFFF értékkel (utolsó 2 bájt meghatározása.)
        mov     DWORD PTR[rbp-8], eax           # mentés az x változóba
        mov     ecx, DWORD PTR[rbp-8]           # printf paramétereinek betöltése
                                                # ez itt a %d (x) érték betöltése
        mov     edx, 9                          # tabulátor, kódja 9
        mov     esi, OFFSET FLAT:.LC0           # "world!" sztring betöltése (kezdőcímét így adjuk meg)
        mov     edi, OFFSET FLAT:.LC1           # formátumsztring betöltése
        mov     eax, 0                          # float paraméterek számát eax-ba kell tölteni
        call    printf
        mov     DWORD PTR[rbp-4], eax           # eax visszatérési értékének betöltése az y változóba
        mov     eax, DWORD PTR[rbp-4]           # az y változó betöltése eax-ból
        mov     rsp, rbp                        # veremmutató visszaállítása
        pop     rbp                             # bázismutató visszaállítása
        ret                                     # visszatérési érték: 19, képernyőre írt karakterek száma





### C style ###
# #include<stdio.h>
# #include<stdlib.h>
# int main(){
#   int x, y;
#   x=rand()&0xffff; //rand()%65536;
#   y=printf("Hello %s%c%d\n","world!",'\t',x);
#   return y; 
#   }
