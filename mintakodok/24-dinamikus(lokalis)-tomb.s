# Lokális (dinamikus) tömb

    .intel_syntax noprefix
    .globl  main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 24                             # memória foglalás 6 int részére
        mov     DWORD PTR[rbp-20], 1                # A[0]
        mov     DWORD PTR[rbp-16], 2                # A[1]
        mov     DWORD PTR[rbp-12], 3                # A[2]
        mov     DWORD PTR[rbp-8], 4                 # A[3]
        mov     DWORD PTR[rbp-4], 5                 # A[4]
        mov     DWORD PTR[rbp-24], 2                # i = 2
        mov     eax, DWORD PTR[rbp-24]              # eax = 2
        cdqe                                        # eax kiterjesztése rax-á
        mov     eax, DWORD PTR[rbp+rax*4-20]        # A + i*sizeof(int) == (rbp-16)+rax*4
        mov     rsp, rbp
        pop     rbp
        ret





### C style ###
# int main(){
#   int i;
#   int A[5]={1,2,3,4,5};
#   i=2;
#   return A[i];
#   }
    