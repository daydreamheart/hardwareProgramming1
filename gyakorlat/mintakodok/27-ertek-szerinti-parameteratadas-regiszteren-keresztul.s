# Érték szerinti paraméterátadás regiszteren keresztül

    .intel_syntax noprefix
    .globl main, box_volume

box_volume:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR[rbp-4], edi
        mov     DWORD PTR[rbp-8], esi
        mov     DWORD PTR[rbp-12], edx
        mov     eax, DWORD PTR[rbp-4]
        imul    eax, DWORD PTR[rbp-8]
        imul    eax, DWORD PTR[rbp-12]
        mov     DWORD PTR[rbp-16], eax
        mov     eax, DWORD PTR[rbp-16]
        mov     rsp, rbp
        pop     rbp
        ret

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     edi, 2
        mov     esi, 3
        mov     edx, 5
        call    box_volume
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret





### C style ###
# int box_volume(int a, int b, int c){
#   int v=a*b*c;
#   return v;
#   }
# int main(){
#   int v;
#   v=box_volume(2,3,5);
#   return v; 
#   }   
     