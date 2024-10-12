# Rekord - Struktúra

    .intel_syntax noprefix
    .globl main
    .data
    .comm   x, 12                           # a???bbbbcc??

main:
        mov     BYTE PTR[x], 65
        mov     DWORD PTR[x+4], 11
        mov     WORD PTR[x+8], -10
        movsx   edx, BYTE PTR[x]            # move with sign extension
        mov     eax, DWORD PTR[x+4]
        add     edx, eax
        movsx   eax, WORD PTR[x+8]
        add     eax, edx
        ret





### C style ###
# struct abc{
#   char a;
#   int b;
#   short c;
#   };
# struct abc x;
# int main(){
#   x.a='A';
#   x.b=11;
#   x.c=-10;
#   return x.a + x.b + x.c; 
#   }
