:-use_module(library(ic)).
:-use_module(library(ic_global)).
:-use_module(library(ic_sets)).
:-use_module(library(branch_and_bound)). 

values([10,30,45,50,65,70,75,80,90,100]).
weights([100,110,200,210,240,300,430,450,500,600]).

%%% solve/3
%%% solve(N,Sets,Cost)
solve(N,Sets,Cost) :-   values(V),
                        weights(W),
                        Weight =..[a|W],
                        Value =..[b|V],

                        length(V,Len),
                        intsets(Sets,N,1,Len),
                        all_disjoint(Sets),
                        apply_constraint(Sets,Weight,Value,Costs),

                        sumlist(V,Max),
                        sumlist(Costs,Cost),
                        Diff #= Max - Cost,
                        Diff #>= 0,
                        bb_min(labelSets(Sets),Diff,_).            

apply_constraint([],_,_,[]).
apply_constraint([S|Sets],Weight,Value,[C|Costs]) :-    weight(S,Weight,Sum),
                                                        Sum #< 600, 
                                                        weight(S,Value,C),
                                                        apply_constraint(Sets,Weight,Value,Costs).

labelSets([]).
labelSets([G|Groups]):- insetdomain(G,_,_,_), 
                        labelSets(Groups).