# A do-while ciklus
# A számot a számra emeljük. Pld. 2-t az 5. hatványra.
# Addig fut a ciklus, amíg i != a hatvánnyal

    .intel_syntax noprefix
    .globl  main,a
    .data
a:  .4byte  2
    .comm   i, 4

main:
        mov     DWORD PTR[i], 0
do:
        mov     eax, DWORD PTR[a]
        imul    eax, 2
        mov     DWORD PTR[a], eax
        mov     eax, DWORD PTR[i]
        inc     eax
        mov     DWORD PTR[i], eax

        mov     eax, DWORD PTR[i]
        cmp     eax, 5
        jne     do

        mov     eax, DWORD PTR[a]
        ret