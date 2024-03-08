# Globális (statikus) tömb (gcc -no-pie)

    .intel_syntax   noprefix
    .globl  main,A,i
    .data
A:  .4byte  1
    .4byte  2
    .4byte  3
    .4byte  4
    .4byte  5
    .comm   i,4

main:
        mov     DWORD PTR[i], 1
        mov     eax, DWORD PTR[i]
        mov     eax, DWORD PTR[A+(eax*4)]
        ret
          
    


    
### C style ###
# int A[5]={1,2,3,4,5};
# int i;
# int main(){
#   i=2;
#   return A[i];
#   }
