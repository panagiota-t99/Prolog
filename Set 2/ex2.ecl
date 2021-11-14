power(_,0,1).

power(B,E,Res)  :- E>0,
                 NewExp is E-1,
                 power(B,NewExp,NewRes),
                 Res is NewRes*B.

power(B,E,Res) :- E<0,
                  NewExp is -E,
                  power(B,NewExp,NewRes),
                  Res is 1/NewRes.