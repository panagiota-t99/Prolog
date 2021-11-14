/*
Panagiota Tychala - dai18162
*/

%%% common_suffix/4
%%% common_suffix(L1,L2,Suffix,Pos)
%%% Succeeds when there is a common suffix between two lists
%%% Returns all the possible common suffixes when backtracking

common_suffix(L1,L2,Suffix,Pos) :- append(_,Suffix,L1),
				    append(_,Suffix,L2),
				    length(Suffix,Pos).
					
				
