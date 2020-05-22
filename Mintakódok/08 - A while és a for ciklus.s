# A while és a for ciklusok

    .intel_syntax noprefix
    .globl main, a
    .data
a:  .4byte 41
    .comm  i, 4                 # "i" egy inicializálatlan 4 bájtú globális változó


main:
        mov     DWORD PTR[i], 0     # i=0
        jmp     cond                # ugrás az adott címkére

body:                               # a címke instrukciói
        mov     eax, DWORD PTR[a]
        dec     eax                 # eax-- (a--)
        mov     DWORD PTR[a], eax
        mov     eax, DWORD PTR[i]
        inc     eax                 # eax++ (i++)
        mov     DWORD PTR[i], eax

cond:
        mov     eax, DWORD PTR[i]   # eax=i
        cmp     eax, 10
        jne     body                # feltételes ugrás: ha nem egyenlő akkor ugrás az adott címkére

        mov     eax, DWORD PTR[a]
        ret



### C style ###
# int a=41;
# int i;
# int main(){
#   i=0;
#   while(i!=10){
#     a--;
#     i++;
#     }
#/*
#   for(i=0;i!=10;i++)
#     a--;
#*/
#/*
#  i=0;
#  goto cond;
#body:
#  a--;
#  i++;
#cond:
#  if(i!=10) goto body; 
#*/
#   return a;
#   }
