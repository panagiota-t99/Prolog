%%% occurs/3
%%% occurs(Element,List,Count)

% occurs(E,[E],1).
% occurs(_,[_],0).

occurs(_,[],0).

occurs(Element,[Element|T],N) :- occurs(Element,T,NewN),
                                 N is NewN + 1.

occurs(Element,[H|T],N) :-  Element \= H,
                            occurs(Element,T,N).
