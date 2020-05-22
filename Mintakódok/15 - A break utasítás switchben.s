# A break utasítás switchben

    .intel_syntax noprefix
    .globl main,a,b
    .data
a:  .4byte  5
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
        jne     DEFAULT
        
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax
        jmp     NEXT

CASE2:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax
        jmp     NEXT

CASE3:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax
        jmp     NEXT

CASE4:
        mov     eax, DWORD PTR[b]
        inc     eax
        mov     DWORD PTR[b], eax
        jmp     NEXT

DEFAULT:
        mov     eax, DWORD PTR[b]
        dec     eax
        mov     DWORD PTR[b], eax

NEXT:
        mov     eax, DWORD PTR[b]
        ret


### C style ###
# int a=2,b=1;
# int main(){
#   switch(a){
#     case 1:
#       b++;
#       break;
#     case 2:
#       b++;
#       break;
#     case 3:
#       b++;
#       break;
#     case 4:
#       b++;
#       break;
#     default:
#       b--;
#   }
#   return b;  
#   }