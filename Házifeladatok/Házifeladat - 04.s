# Negatív szám ellentetjének meghatározása. 
# (Inverz kettes komplemens módszer)

    .intel_syntax noprefix
    .globl  main
    .data
n:  .4byte  -33

main:   
        mov eax, DWORD PTR[n]
        dec eax                 # elveszek egyet
        not eax                 # bitek invertálása
        ret