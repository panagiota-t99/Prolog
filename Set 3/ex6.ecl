%%% sum_even/2
%%% sum_even(List,Sum)

sum_even([],0).

sum_even([H|T], N) :- 0 is H mod 2,
                      sum_even(T,R),
                      N is H + R.

sum_even([H|T], N) :-  1 is H mod 2,
                       sum_even(T,N).

