%%% rotate_left/3
%%% rotate_left(PosNum,List,Result)
%%% Succeeds when List is rotated by N Positions

/*
rotate_left(0,L,L).

rotate_left(N,[H|T],Res):- NewN is N - 1,
		       NewN >= 0,
		       delete(H,[H|T],Temp1),
		       append(Temp1,[H],Temp2),
		       rotate_left(NewN,Temp2,Res).
*/

rotate_left(N,List,Res) :- append(L1,L2,List),
			    length(L1,N),
			    append(L2,L1,Res).
