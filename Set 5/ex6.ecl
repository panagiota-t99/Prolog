unique_element(X,List):- delete(X,List,Dlist),
			  not(member(X,Dlist)).

%%% proper_set/1
%%% proper_set(List)

proper_set([]).
proper_set(L) :- member(X,L), not(unique_element(X,L)), !, fail.
proper_set([_|T]) :- proper_set(T).
