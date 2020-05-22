# Integer konstansok az x86 assemblyben

    .intel_syntax   noprefix
    .globl  main

main:
#        mov     eax, 123               # eax = 123
#        mov     al, 255                # al = 255
#        mov     eax, 260               # eax = 260 (al = 4)
#        mov     eax, -3                # eax = -3
#        mov     eax, 0x0000000fa       # eax = 0xfa (eax = 250)
        ret                             # return (return value in al; unsigned char)