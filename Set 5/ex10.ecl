seperate_lists([],[],[]).

seperate_lists([H|T],Lets,[H|Nums]) :- number(H),!, 
				        seperate_lists(T,Lets,Nums).
				
seperate_lists([H|T],[H|Lets],Nums) :- seperate_lists(T,Lets,Nums).
