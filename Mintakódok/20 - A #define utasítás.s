# A #define utasítás

    .intel_syntax noprefix
    .globl  main, A
a:  .4byte  5

main:
        mov     edx, DWORD PTR[a]
        mov     eax, DWORD PTR[a]
        add     eax, edx
        add     eax, 3
        ret


### C style ###
# #define X 3
# #define Y(Z) Z+Z
# int a=5; 
# int main(){
#   return X+Y(a); 
# //  return 3+a+a;  
#   }
