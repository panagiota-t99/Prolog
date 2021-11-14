%%% valid_queries/1
%%% valid_queries(Query)

valid_queries(Q) :-  call(Q),
		     write(Q), nl.
