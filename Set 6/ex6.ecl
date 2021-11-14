%%% stack/1
%%% stack(List)

:- dynamic stack/1.
stack([]).

push(X) :- retract(stack(List)),
	   append(List,[X],Res),
	   asserta(stack(Res)).
	   
pop(X) :- retract(stack(List)),
	  append(_,[X],List),
	  delete(X,List,Res),
	  asserta(stack(Res)).
