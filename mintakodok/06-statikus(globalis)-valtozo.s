# Globális változók (gcc -no-pie)

    .intel_syntax noprefix
    .globl main
    .globl a, b, c
    .data                                   # adat szegmens a statikus változók miatt
a:  .byte   11                              # char: memória lefoglalás és inicializálás
b:  .2byte  22                              # short: memória lefoglalás és inicializálás
c:  .4byte  44                              # int: memória lefoglalás és inicializálás
d:  .4byte  100                             # statikus int: memória lefoglalás és inicializálás (nem globális változó)

main:
        mov     al, BYTE PTR [a]            # betölt egy bytot a változóból (char) al-ba; al = 11
        cbw                                 # al (byte) kiterjeszti ax-ra (word)
        add     ax, WORD PTR [b]            # hozzáadjuk ax-et egy változóhoz (short); al -> ax = 11 + 22 = 33
        cwd                                 # ax (word) kiterjesztjük eax-ra (double word)
        add     eax, DWORD PTR [c]          # hozzáadjuk eax-ot a double wordhöz az int változóból; ax -> eax = 33 + 44 = 77
        add     eax, DWORD PTR [d]          # hozzáadjuk eaxhoz a statikus intet; eax = eax (77) + 100 = 177
        ret





### C style ###
# char      a=11;
# short int b=22;
# int       c=44;
# int main(){
#   static int d=100;
#   return a+b+c+d;
#   }
