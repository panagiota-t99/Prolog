%%% int_in_range/3
%%% int_in_range(Min,Max,X)

int_in_range(Min,Max,Min) :- Min=<Max.

int_in_range(Min,Max,X) :- Min=<Max,
                           NewMin is Min+1,
                           int_in_range(NewMin, Max, X).
                           