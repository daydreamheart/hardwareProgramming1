# Háromoperandusú operátor

    .intel_syntax noprefix
    .globl  main,a,b
    .data
a:  .4byte  11
    .comm   b,4

main:
        mov     eax, DWORD PTR[a]
        cmp     eax, 12
        jne     false
        mov     eax, 23
        jmp     next

false:
        mov     eax, 34

next:
        mov     DWORD PTR[b], eax
        mov     eax, DWORD PTR[b]

        ret 

### C style ###
# int a=12; 
# int b; 
# int main(){
#   b=a==12?23:34;
#   return b;  
#   }