%%% sumoflists/2
%%% sumoflists(List,Sum)

%%% sumoflists([X],X).

sumoflists([],0).

sumoflists([H|T],X) :-
            sumoflists(T,NewX),
            X is H+NewX.
