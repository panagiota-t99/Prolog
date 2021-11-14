%%% proper_set_s/1
%%% proper_set_s(List)

proper_set_s(List) :- setof(X,member(X,List),Res),
		      length(List,N),
		      length(Res,N).
