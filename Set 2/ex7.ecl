/*
Panagiota Tychala - dai18162
*/

%%% sumn/2
%%% sumn(N,Result)
%%% Adds the numbers from 1 to N
sumn(1,1).

sumn(N,X) :- N > 0,
             NewN is N-1,
             sumn(NewN,NewX),
             X is N + NewX.