%%% connect/3
%%% connect(Location1,Location2,Bridge)

connect(rb1,i1,b2).
connect(rb1,i1,b3).

connect(rb1,i2,b4).

connect(rb2,i1,b5).
connect(rb2,i1,b6).

connect(rb2,i2,b7).

connect(i1,i2,b1).

connection(X,Y,B) :- connect(X,Y,B).
connection(X,Y,B) :- connect(Y,X,B).


%%% walk/3
%%% walk(Location1,Location2,Path)
walk(N,F,Path) :- walk(N,F,[],Path).

walk(N,F,Visited,[B]) :- connection(N,F,B),
			not(member(B,Visited)).

walk(N,F,Visited,[B|Rest]) :- connection(N,Temp,B),
			not(member(B,Visited)),
			walk(Temp,F,[B|Visited],Rest).
			
%%% not( (walk(X,Y,L),length(L,7)) )
			
			
			



