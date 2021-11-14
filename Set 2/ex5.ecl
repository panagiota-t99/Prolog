divides(X,X) :- X > 0.

divides(X,Y) :- X > 0,
                Y > 0,
                W is Y-X,
                divides(X,W).