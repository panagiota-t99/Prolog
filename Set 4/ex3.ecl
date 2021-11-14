%%% reverst_alt/
%%% reverse_alt(L1,L2)
%%% Succeeds when L2 is L1 reversed

reverse_alt([],[]).

reverse_alt([H|T],L2) :- reverse_alt(T,Temp), 
			  append(Temp,[H],L2).
