%%% transition/3
%%% transition(S1,Cost,s2)

transition(s1,10,s2).
transition(s1,20,s3).
transition(s1,50,s6).

transition(s2,10,s3).
transition(s2,20,s4).

transition(s3,10,s4).
transition(s3,20,s5).

transition(s4,10,s5).
transition(s4,20,s6).

transition(s5,10,s6).

next(X,Y,C) :- transition(X,C,Y).

%%% coins_to_insert/3
%%% coins_to_insert(S1,Coin,S2)

%coins_to_insert(Node,[C],Final) :- next(Node,Final,C).
coins_to_insert(Node,[],Node). 
coins_to_insert(Node,[C|Rest],Final) :- next(Node,Next,C),
			     coins_to_insert(Next,Rest,Final).
			     
			     
%%% all the possible paths
%%% findall(X,(coins_to_insert(s1,X,s6)),List), 	 	length(List,N)
				   
				   
