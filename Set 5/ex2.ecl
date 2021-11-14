%%% set_diff/3
%%% set_diff(L1,L2,Res)


set_diff([],_,[]).
set_diff([X|Tail], List, [X|Res]) :- not(member(X,List)),
					!,
				      set_diff(Tail,List,Res). 
				
set_diff([_|Tail], List, Res) :- set_diff(Tail,List,Res). 
				

			
 
