%%% before_last_element/2
%%% before_last_element(List,Element)

before_last_element([A,_],A).

before_last_element([_|T], E) :- before_last_element(T,E).