:-lib(ic).
:-lib(ic_global).
:-lib(branch_and_bound).
:-lib(ic_edge_finder).


weight(10).
weight(20).
weight(30).
weight(50).
weight(60).
weight(90).
weight(100).
weight(150).
weight(250).
weight(500).

%%% balance_lights/2
%%% balance_lights(W, Total)
balance_lights(W,Total) :- W = [W1,W2,W3,W4],
                           findall(X, weight(X), List),
                           W #:: List,
                           ic_global:alldifferent(W),
                           5*W1 #= 5*W2 + 20*W3 + 40*W4,
                           labeling(W),
                           sumlist(W, Total).
                           
                           
                           
                           







