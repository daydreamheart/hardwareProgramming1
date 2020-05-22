# Írjunk egy függvényt, mely a három int típusú paramétere közül visszaadja a legkisebbet!
# A program hívja meg a függvényt három konstans paraméterrel! 
# A program visszatérés értéke a függvény által visszaadott érték legyen!

# Érték szerinti paraméterátadás vermen keresztül

    .intel_syntax noprefix
    .globl main, minOf3

minOf3:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 12
        mov     rax, QWORD PTR[rbp+16]
        mov     DWORD PTR[rbp-4], eax
        mov     rax, QWORD PTR[rbp+24]
        mov     DWORD PTR[rbp-8], eax
        mov     rax, QWORD PTR[rbp+32]
        mov     DWORD PTR[rbp-12], eax

        mov     eax, DWORD PTR[rbp-4]
        mov     ebx, DWORD PTR[rbp-8]
        cmp     eax, ebx
        jl      else

        mov     eax, ebx

else:   
        mov     ecx, DWORD PTR[rbp-12]
        cmp     eax, ecx
        jl      end
        mov     eax, ecx

end:    
        mov     rsp, rbp
        pop     rbp
        ret

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4
        mov     rax, 20
        push    rax
        mov     rax, 3
        push    rax
        mov     rax, 12
        push    rax
        call    minOf3
        mov     DWORD PTR[rbp-4], eax
        mov     eax, DWORD PTR[rbp-4]
        mov     rsp, rbp
        pop     rbp
        ret

# C style
# int minOf3(int a, int b, int c){
#    if (a > b)
#        a = b;
#    if (a > c)
#        a = c;
#    return a;
# }
# int main(){
#    return minOf3(12, 3, 1);
#    }