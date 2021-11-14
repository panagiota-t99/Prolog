figure(1,middle(triangle,square)).
figure(2,middle(circle,triangle)).
figure(3,middle(square,circle)).
figure(4,middle(square,square)).
figure(5,middle(square,triangle)).
figure(6,middle(triangle,circle)).
figure(7,middle(circle,square)).
figure(8,middle(triangle,triangle)).

figure(9,down_left(circle,circle)).
figure(10,up_left(circle,circle)).
figure(11,down_right(circle,circle)).
figure(12,up_right(circle,circle)).

figure(13,up_left(square,square)).
figure(14,down_left(square,square)).
figure(15,up_right(square,square)).
figure(16,down_right(square,square)).

relation(middle(X,Y),middle(Y,X), inverse).
relation(middle(X,X),middle(Y,Y), same).
relation(down_left(X,X),down_left(Y,Y), position).
relation(up_left(X,X),up_left(Y,Y), position).
relation(down_right(X,X),down_right(Y,Y), position).
relation(up_right(X,X),up_right(Y,Y), position).


analogy(A,B,C,D) :- figure(A,StateA),figure(B,StateB),relation(StateA,StateB,Rel),
                    figure(C,StateC),relation(StateC,StateD,Rel),
                    figure(D,StateD),
                    C\=D.