# Függvény (paraméter nélküli)

    .intel_syntax noprefix
    .globl  main, july

july:
        mov     eax, 31
        ret

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        call    july
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret

### C style ###
# int july(){
#   return 31;
#   }
# int main(){
#   int a;
#   a=july();
#   return a; 
#   }
