%%% less_than_ten/
%%% less_than_ten(N)

sample(2).
sample(5).
sample(14).
sample(7).
sample(26).

less_than_ten(N) :- findall(X,(sample(X), X<10), Res), length(Res,N).
