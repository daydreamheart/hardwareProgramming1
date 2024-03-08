# Több fordítási egység B
# B: main függvény

    .intel_syntax noprefix
    .globl  main

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     edi, 0xffffffff                 # -1
        call    abs
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret





### C style ###
# int main(){
#   int n;
#   n=myabs(-1);
#   return n; 
#   }
