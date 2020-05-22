# Lokális változó (dinamikus élettartamú)

    .intel_syntax noprefix
    .globl  main

main:
        push    rbp                     # bázispointer (rbp) elmentése a verembe
        mov     rbp, rsp                # elmentjük a veremmutatót (rsp) az rbp-be
        sub     rsp, 4                  # memóriafoglalás a veremben a lokális változó számára
        mov     DWORD PTR[rbp-4],123
        mov     eax, DWORD PTR[rbp-4]
        mov     rsp, rbp                # az eredeti rsp visszaállítása
        pop     rbp                     # bázispoint visszaállítása a veremből
        ret



### C style ###
# int main(){
#   int a=123;
#   return a; 
#   }
