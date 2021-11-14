%%% profession/1
%%% profession(Profession)
pr(baker).
pr(tailor).
pr(smith).
pr(carpenter).


%%% family/3
%%% family(Last_name, Fathers_profession, Sons_profession)
%%% Succeeds when the father and the son have a different profession from their last name and
%%% their professions are different from one another
family(X,FP,SP) :- pr(FP), pr(SP), X\=FP, X\=SP, FP\=SP.


%%% professions/8
professions(F1,F2,F3,F4,S1,S2,S3,S4) :- family(smith,F1,S1),
family(tailor,F2,S2),
family(baker,F3,S3),
family(carpenter,F4,S4),
F3=S4,
S1=baker,
F1\=F2,F1\=F3,F1\=F4,F2\=F3,F2\=F4,F3\=F4,
S1\=S2,S1\=S3,S1\=S4,S2\=S3,S2\=S4,S3\=S4.
