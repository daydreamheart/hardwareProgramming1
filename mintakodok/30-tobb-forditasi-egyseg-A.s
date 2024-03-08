# Több fordítási egység A
# A: abs függvény
# gcc 29_A.s 29_B.s

    .intel_syntax noprefix
    .globl  abs

abs:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     DWORD PTR[rbp-4], edi
        cmp     DWORD PTR[rbp-4], 0
        jge     .L2
        neg     DWORD PTR[rbp-4]

.L2:    
        mov     eax, DWORD  PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret





### C style ###
# int myabs(int N){
#   if (N<0) N=N*-1;
#   return N;
#   }
