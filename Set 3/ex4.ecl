%%% count_odd/2
%%% count_odd(List,N)

count_odd([X],N) :- N is X mod 2.

count_odd([H|T],N) :- Res is H mod 2,
                      count_odd(T,NewN),
                      N is NewN + Res.


                      
                     
