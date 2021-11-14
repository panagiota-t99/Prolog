%%% map_f/3
%%% map_f(Op,List,Res)

map_f(Op,List,Bag) :- findall(R,
                             (member(X,List), Pred =..[Op,X,R], call(Pred)), 
                             Bag).

square(X,R) :- R is X*X.
double(X,R) :- R is X*2.