fn(0,1).

fn(X,X) :- X > 0,
           X < 5.

fn(X,Y) :- X > 4,
           X < 9,
           NewX is X-4,
           fn(NewX,NewR),
           Y is NewR*2.

fn(X,Y) :- X > 8,
           NewF is X-8,
           fn(NewF,NewRes),
           fn(NewRes,Y).
