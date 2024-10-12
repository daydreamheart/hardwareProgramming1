# Legyen adott egy mértani sorozat, melynek első eleme 1024, kvóciense 1/2. 
# Számítsa ki a 6. elemét!

        .intel_syntax noprefix
        .globl  main, n1, n, q
n1:     .4byte  1024
n:      .4byte  6
q:      .4byte  2

main:
        mov     eax, DWORD PTR[n1]          # eax=n1
        mov     ebx, DWORD PTR[n]           # ebx=n
        mov     ecx, DWORD PTR[q]           # ecx=q
        
do:
        cdq
        idiv    ecx                         # eax = edx/ecx
        dec     ebx
        cmp     ebx, 0
        jg      do

        ret
