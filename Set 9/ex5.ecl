/*
Panagiota Tychala - dai18162
*/

:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 

provider(a,[0,750,1000,1500],[0,10,13,17]).
provider(b,[0,500,1250,2000],[0,8,12,22]).
provider(c,[0,1000,1750,2000],[0,15,18,25]).
provider(d,[0,1000,1500,1750],[0,13,15,17]).


%%% space/2
%%% space(I,C)
space(I,C) :- findall(X,provider(X,_,_),List),
              length(List, Len),
              create_providers_list(1,Len,List,NewPr),
              apply_constraint(NewPr,I,Costs,Res),
              sumlist(I,Sp),
              Sp #>= 3600,
              Sp #=< 4600,
              sumlist(Costs,C),
              ic_global:alldifferent(Res),
              bb_min(labeling([Res,I]),C,_).


apply_constraint([],[],[],[]).
apply_constraint([(PrN,PrL)|List],[PrIValue|I],[PrCValue|Costs],[PrN|Res]) :- provider(PrL,PrI,PrC),
                                          element(X,PrI, PrIValue),
                                          element(X, PrC, PrCValue),
                                          apply_constraint(List,I,Costs,Res).                                             

create_providers_list(X, X, [Y],[(X,Y)]):- !.
                                        
create_providers_list(Min, Max,[H|List], [(Min,H)|Rest]):- Min =< Max,
                                                                NMin is Min + 1,
                                                                create_providers_list(NMin, Max,List, Rest).                                         