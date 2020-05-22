# A switch szerkezet

    .intel_syntax noprefix
    .globl  main,a,b
    .data
a:  .4byte  2
b:  .4byte  1

main:
        mov     eax, DWORD PTR[a]
        cmp     eax, 2
        je      CASE2
        cmp     eax, 3
        je      CASE3
        cmp     eax, 4
        je      CASE4
        cmp     eax, 1
        jne     DEFAULT                 # ha eax != 1 -> default
        mov     eax, DWORD PTR[b]       # ha eax == 1 -> b++
        inc     eax
        mov     DWORD PTR[b], eax

CASE2:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax

CASE3:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax

CASE4:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax

DEFAULT:
        mov     eax, DWORD PTR[b]
        dec     eax
        mov     DWORD PTR[b], eax

        mov     eax, DWORD PTR[b]
        ret



### C style ###
# int a=2,b=1;
# int main(){
#   switch(a){
#     case 1:
#       b++;
#     case 2:
#       b++;
#     case 3:
#       b++;
#     case 4:
#       b++;
#     default:
#       b--;
#   }
#   return b;  
#   }