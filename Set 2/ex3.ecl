fib(1,1).
fib(2,1).

fib(X,R) :- X>2,
            X1 is X-1,
            X2 is X-2,
            fib(X1, R1),
            fib(X2, R2),
            R is R1 + R2.

           