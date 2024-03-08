# Rekurzió (faktoriális)

    .intel_syntax noprefix
    .globl  Fact, main

Fact:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     DWORD PTR[rbp-4], edi
        cmp     DWORD PTR[rbp-4], 1
        jne     .L2
        mov     eax, 1
        mov     rsp, rbp
        pop     rbp
        ret

.L2:
        mov     eax, DWORD PTR[rbp-4]
        sub     eax, 1
        mov     edi, eax
        call    Fact
        imul    eax, DWORD PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     edi, 5
        call    Fact
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        mov    rsp, rbp
        pop     rbp
        ret





### C style ###
# int Fact(int N){
#   if (N==1) return 1;
#   return N*Fact(N-1);
#   }
# int main(){
#   int f;
#   f=Fact(5);
#   return f; 
#   }
