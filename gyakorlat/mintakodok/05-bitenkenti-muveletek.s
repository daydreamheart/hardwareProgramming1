# Bitenkénti műveletek

    .intel_syntax noprefix
    .globl main

main:
        mov     eax, 0x3A
        mov     ebx, 0x35

#        and     eax, ebx        # eax = eax & ebx
#        or      eax, ebx        # eax = eax | ebx
#        xor     eax, ebx        # eax = eax ^ ebx
#        not     eax             # eax = ~eax

        mov     al, 0x81

#        shl     al, 2           # al = al << 2 (logikai léptetés balra)
#        shr     al, 2           # al = al >> 2 (logikai léptetés jobbra)
#        sal     al, 2           # al = al << 2 (aritmetikai léptetés balra)

        sar     al, 2            # al = al >> 2 (aritmetikai léptetés jobbra)
        ret





### C style ### 
# int main(){
#   return 0x3A & 0x35;
#   //return 0x3A | 0x35;
#   //return 0x3A ^ 0x35;
#   //return ~0x3A;
#   //return (unsigned char)0x81u<<2;
#   //return (unsigned char)0x81u>>2;
#   //return (char)0x81<<2;
#   //return (char)0x81>>2;
#   }
