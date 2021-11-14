%%% max_list/2
%%% max_list(Max,List)

max_list(Max,List) :- member(Max,List),
		      not((member(X,List), X>Max)).


