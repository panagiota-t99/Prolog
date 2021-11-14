/*
Panagiota Tychala - dai18162
*/

%%% replace/4
%%% replace(X,Y,List,ResultList)
%%% Succeeds when X in List is replaced by Y and produces ResultList

replace(X, Y, [X|T], [Y|T]).

replace(X, Y, [H|T1], [H|T2]) :- replace(X, Y, T1, T2).
