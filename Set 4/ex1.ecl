%%% A
%%% symmetric([1,2,3,4,1,2,3,4)

symmetric(List) :- append(X,X,List).


%%% B
%%% Succeeds if L1 is suffix of L2

end_sublist(L1,L2) :- append(_,L1,L2).


%%% C
%%% Succeeds if L1 is twice or more sublist in L2

twice_sublist(L1,L2):- append(L21,L22,L2), 
			subset(L1,L21), 
			subset(L1,L22), !.


%%% D
%%% Finds the last element of a list

last_element(L,X) :- append(_,[X],L).




