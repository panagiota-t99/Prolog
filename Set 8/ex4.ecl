:- lib(ic).

%%% donald/1
%%% donald(Sol)
donald([D,O,N,A,L,G,E,R,B,T]) :- [D,O,N,A,L,G,E,R,B,T] #:: 0..9,
                                 alldifferent([D,O,N,A,L,G,E,R,B,T]),
                                 W1 #= D*100000 + O*10000 + N*1000 + A*100 + L*10 + D*1,
                                 W2 #= G*100000 + E*10000 + R*1000 + A*100 + L*10 + D*1,
                                 W3 #= R*100000 + O*10000 + B*1000 + E*100 + R*10 + T*1,
                                 W1 + W2 #= W3,
                                 labeling([D,O,N,A,L,G,E,R,B,T]).
