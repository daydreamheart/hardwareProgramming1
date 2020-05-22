# Adott A osztályú IP cím (/8 prefix). 
# A program visszatérési értéke legyen ezen IP cím hálózati azonosítója!
# Megoldás: Eltolás jobbra 24 bittel.

        .intel_syntax noprefix
        .globl  main
        .data
ip:     .4byte  0x51A9B5B3

main:
        mov eax, DWORD PTR[ip]
        shr eax, 24
        ret