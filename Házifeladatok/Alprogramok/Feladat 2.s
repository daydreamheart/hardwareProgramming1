# Írjunk egy függvényt, mely a három int típusú paramétere közül visszaadja a legkisebbet!
# A program hívja meg a függvényt három konstans paraméterrel! 
# A program visszatérés értéke a függvény által visszaadott érték legyen!

# Érték szerinti paraméterátadás regiszteren keresztül

    .intel_syntax noprefix
    .globl  main, minOf3

minOf3:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 12
        mov     DWORD PTR[rbp-4], edi
        mov     DWORD PTR[rbp-8], esi
        mov     DWORD PTR[rbp-12], edx

        mov     eax, DWORD PTR[rbp-4]
        mov     ebx, DWORD PTR[rbp-8]
        cmp     eax, ebx
        jl      else                   # ha a > b akkor ELSE-re ugrik és az a > c-t vizsgálja

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
        mov     edi, 12
        mov     esi, 3
        mov     edx, 20
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
#    return minOf3(12, 3, 20);
#    }