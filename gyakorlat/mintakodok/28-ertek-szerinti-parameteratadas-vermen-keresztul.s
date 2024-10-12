# Érték szerinti paraméterátadás vermen keresztül

    .intel_syntax noprefix
    .globl main, box_volume

box_volume:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rax, QWORD PTR[rbp+16]
        mov     DWORD PTR[rbp-4], eax
        mov     rax, QWORD PTR[rbp+24]
        mov     DWORD PTR[rbp-8], eax
        mov     rax, QWORD PTR[rbp+32]
        mov     DWORD PTR[rbp-12], eax
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
        mov     rax, 5
        push    rax
        mov     rax, 3
        push    rax
        mov     rax, 2
        push    rax
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
