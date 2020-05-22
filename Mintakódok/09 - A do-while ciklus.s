# A do-while ciklus

    .intel_syntax noprefix
    .globl  main,a
    .data
a:  .4byte  41
    .comm   i, 4                # inicializálatlan globális változó, 4 bájttal

main:
        mov     DWORD PTR[i], 0
do:
        mov     eax, DWORD PTR[a]
        dec     eax
        mov     DWORD PTR[a], eax
        mov     eax, DWORD PTR[i]
        inc     eax
        mov     DWORD PTR[i], eax
        
        mov     eax, DWORD PTR[i]
        cmp     eax, 10
        jne     do

        mov     eax, DWORD PTR[a]
        ret


### C style ###
# int a=41;
# int i;
# int main(){
#   i=0;
#   do{
#     a--;
#     i++;
#     }
#   while(i!=10);
#   return a;
#   }

