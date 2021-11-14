mcd(0,N,N).

mcd(M,N,R) :- M > N,
              mcd(N,M,R).
              
mcd(M,N,R) :- N >= M,
              X is N mod M,
              mcd(M,X,R).
