:- lib(ic).


%%% num_gen/2
%%% num_gen(N1,N2)
num_gen(N1,N2) :- [X1,X2,X3,X4,X5,X6] #:: 0..9,
                  alldifferent([X1,X2,X3,X4,X5,X6,0,1,3,5]),
                  Num1 #= 1*3 + 10*X1 + 100*X2 + 1000*5 + 10000*X3,
                  Num2 #= 1*1 + 10*X4 + 100*0 + 1000*X5 + 10000*X6,
                  abs(Num2 - Num1) #= 12848,
                  labeling([X1,X2,X3,X4,X5,X6]),
                  N1 = [X3,5,X2,X1,3],
                  N2 = [X6,X5,0,X4,1].

%%% num_gen([X3,5,X2,X1,3], [X6,X5,0,X4,1])
%%% remove the last two rows