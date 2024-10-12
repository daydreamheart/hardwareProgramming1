# Eljárás (paraméter nélküli)

    .intel_syntax noprefix
    .globl  main,plus,a
    .data
a:  .4byte  12

plus:
        mov     eax, DWORD PTR[a]
        inc     eax
        mov     DWORD PTR[a], eax
        ret                             # visszatérés a hívóhoz, visszatérési cím a veremben (régi RIP)

main:
        call    plus                    # meghívja az eljárást, RIP el van tárolva a verembe
        mov     eax, DWORD PTR[a]
        ret





### C style ###
# int a=12;
# void plus(){
#   a++;
#   }
# int main(){
#   plus();
#   return a; 
#   }
