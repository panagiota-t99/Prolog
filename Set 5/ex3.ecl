%%% lunion/3
%%% lunion(L1,L2,Union)

lunion([],L,L).

lunion([H|T],L2,U) :- member(H,L2),
		       !,
		       lunion(T,L2,U).

lunion([H|T],L2,[H|U]) :- lunion(T,L2,U).
