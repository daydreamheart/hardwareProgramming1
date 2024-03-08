# Fibonacci sorozat n-edik elemének meghatározása.
# A nagyobb elemet ideiglenesen eltároljuk edx regiszterben. 
# Az összeggel felülírjuk a korábbi nagyobb elemet

        .intel_syntax noprefix
        .globl  main, fib0, fib1, n
n:      .4byte  14
fib0:   .4byte  0   # 0. elem
fib1:   .4byte  1   # 1. elem

main:
        mov eax, DWORD PTR[fib1]
        mov ebx, DWORD PTR[fib0]
        mov ecx, DWORD PTR[n]

do:
        mov edx, eax
        add eax, ebx
        mov ebx, edx
        dec ecx

        cmp ecx, 2
        jg  do
        
        ret
        