:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 

antennas(N,Max,Pos) :-   length(Pos,N),
                        Pos #:: [0..40],
                        ic_global:alldifferent(Pos),
                        ic_global:ordered(<,Pos),
                        check_dif(Pos,Dif),
                        flatten(Dif,NDif),
                        ic_global:alldifferent(NDif),
                        ic_global:maxlist(Pos,Max),
                        bb_min(labeling(Pos),Max,_).

check_dif([],[]).
check_dif([H|T],[D|Dif]) :- check(H,T,D),
                            check_dif(T,Dif).
    
check(_,[],[]).
check(X,[H|T],[D|Dif]) :- D #= abs(X - H),
                        check(X,T,Dif).



                          
                               

                               
                                          
                                           
                        