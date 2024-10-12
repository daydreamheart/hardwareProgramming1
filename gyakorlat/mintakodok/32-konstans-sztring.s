# Konstans sztring (sztring literál)
#   - melynek tartalma nem módosul a futási idő alatt
#   .string fordítási direktívával adhatjuk meg
#   -no-pie kapcsolóval fordítandó

        .intel_syntax noprefix
.section    .rodata                                             # read-only 
.TXT:   .string     "This is a string."
        .globl      main

# Lokális változóként tároljuk el a ciklusváltozót (i)
# és a tömb kezdőcímét, ezért szükségünk van a verem használatára

main:
        push    rbp                                             # korábbi bázispointer mentése a verembe
        mov     rbp, rsp                                        # bázispointert egyenlővé teszi a veremmutatóval
        sub     rsp, 12                                         # veremmutató értékének csökkentésével helyet foglalunk a veremben
                                                                # 12 mert: tömb kezdőcíme egy pointer : 8 bájt + ciklusváltozó intiger 4 bájt
        mov     QWORD PTR[rbp-8], OFFSET FLAT:.TXT              # sztring kezdőcímének mentése (pointer), 8 bájtos érték ezért QWORD
        mov     DWORD PTR[rbp-12], 0                            # i betöltése a verembe
        jmp     cond

body:   add     DWORD PTR[rbp-12], 1

cond:
        movsx   rbx, DWORD PTR[rbp-12]                          # ciklusváltozó betöltése rbx-be
                                                                # változó 4 bájt, rbx 8 bájtos érték, ezért kell a kiterjesztés
                                                                # movsx: előjeles kiterjesztéssel másolja át a 2. az 1. megadott regiszterbe/memóriacímbe
        mov     rax, QWORD PTR[rbp-8]                           # sztring kezdőcímének betöltése
        add     rax, rbx                                        # ciklusváltozó értékének hozzáadása a sztring kezdőcíméhez
                                                                # mivel 1 bájton vannak eltárolva a karakterek, ezért nem kell megszorozni az i-t
        mov     al, BYTE PTR[rax]                               # az i-edik karakter betöltése al regiszterbe
                                                                # rax regiszterben az eltolt kezdőcím található
                                                                # ezen a címen pedig az i-edik elem
                                                                # egy elem mérete (karakter) 1 bájt, ahogy az al regiszteré is, ezért nem kell kiterjeszteni
        cmp     al, 0
        jne     body
        mov     eax, DWORD PTR[rbp-12]                          # i betöltése (tömbelemek száma) az eaxba
        mov     rsp, rbp                                        # eredeti veremmutató visszaállítása
        pop     rbp                                             # bázismutató visszaállítása
        ret





### C style ###
# int main(){
#   int i;
#   char *s="This is a string.";
#   i=0;
#   while(s[i]!='\0')
#     i++;
#   return i; 
#   }
