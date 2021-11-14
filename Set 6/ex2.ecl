%%% set_diff_f/3
%%% set_diff_f(L1,L2,Diff)

set_diff_f(L1,L2,Res) :- findall(X, (member(X,L1), not(member(X,L2))), Res).