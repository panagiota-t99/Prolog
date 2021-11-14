%%% map/3
%%% map(Operation,List, Resultst)

map(_,[],[]).
map(Op,[X|List],[R|Res]):- C =..[Op,X,R],
                     	    call(C),
                           map(Op,List,Res).
                           
double(X,Y) :- Y is 2*X.
square(X,Y) :- Y is X*X.
