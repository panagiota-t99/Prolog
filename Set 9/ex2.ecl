:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 

%%% num_gen_min/3
%%% num_gen_min(N1,N2,D)
num_gen_min([X1,5,X2,X3,3],[X4,X5,0,X6,1],D) :- [X1,X2,X3,X4,X5,X6] #:: [0..9],
                                                ic_global:alldifferent([5,3,0,1,X1,X2,X3,X4,X5,X6]),
                                                Num1 #= 3*1 + X3*10 + X2*100 + 5*1000 + X1*10000,
                                                Num2 #= 1*1 + X6*10 + 0*100 + X5*1000 + X4*10000,
                                                D #= abs(Num1-Num2),
                                                bb_min(labeling([X1,X2,X3,X4,X5,X6]),D,_).

                        