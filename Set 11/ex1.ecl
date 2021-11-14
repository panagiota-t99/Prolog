:-use_module(library(ic_sets)).
:-use_module(library(ic_global)).
:-use_module(library(ic)).


%%% fair_father/3
%%% fair_father(S1, S2, S3)
houses([1,3,4,5,6,10,12,14,15,17,20,22]).

fair_father(S1,S2,S3) :-    houses(List),
                            length(List,N),
                            intsets([S1,S2,S3], 3, 1, N),
                            
                            Array =..[a|List],
                            weight(S1,Array,Sum),
                            weight(S2,Array,Sum),
                            weight(S3,Array,Sum),
                            all_disjoint([S1,S2,S3]),
                            /*
                            #(S1,C1),
                            #(S2,C2),
                            #(S3,C3),
                            C1 + C2 + C3 #= N,
                            */
                            129 #= 3*Sum,
                            insetdomain(S1,_,_,_),
                            insetdomain(S2,_,_,_),
                            insetdomain(S3,_,_,_),
                            writeln(Sum).
