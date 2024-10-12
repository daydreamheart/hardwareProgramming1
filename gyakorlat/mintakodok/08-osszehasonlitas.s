# Összehasonlító operátorok

    .intel_syntax noprefix
    .globl  main, a
    .data
a:  .4byte  5

main:
        mov     ebx, DWORD PTR[a]
        cmp     ebx, 3               # compare ebx and 3; result in ZF, CF, SF, OF

#        setz    al                  # set al to 1 if ZF==1 (ebx==3), else al=0         
#        setnz   al                  # set al to 1 if ZF==0 (ebx!=3), else al=0
#        setc    al                  # set al to 1 if CF==1 (ebx< 3), else al=0
#        setnc   al                  # set al to 1 if CF==0 (ebx>=3), else al=0

#        sete       al               # set al to 1 if ebx==3 (ZF==1), else al=0
#        setne      al               # set al to 1 if ebx!=3 (ZF==0), else al=0
#        setg       al               # set al to 1 if ebx<3 (ZF==0 and OF==SF), else al=0
#        setge      al               # set al to 1 if ebx>=3 (OF==SF), else al=0
#        setl       al               # set al to 1 if ebx>3 (OF!=SF), else al=0

        setle      al                # set al to 1 if ebx<=3 (ZF==1 or OF!=SF), else al=0
                                     # in case of unsigned values further possibilities: seta, setae, setb, setbe
        ret





### C style ###
# int a=2;
# int main(){
#   return a==3;  // 1: ZF=1
#   //return a!=3;  // 1: ZF=0
#
#   //return a==3;  // 1: ZF=1
#   //return a!=3;  // 1: ZF=0
#   //return a>3;   // 1: ZF=0 AND SF=OF
#   //return a>=3;  // 1: SF=OF
#   //return a<3;   // 1: SF!=OF
#   //return a<=3;  // 1: ZF=1 OR SF!=OF
#   }
