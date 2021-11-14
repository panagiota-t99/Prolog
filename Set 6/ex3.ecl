%%% minlist/2
%%% minlist(Min,List)

minlist(Min,List) :- setof(X,member(X, List), [Min|_]).
