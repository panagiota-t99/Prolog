:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 
:- use_module(library(ic_edge_finder)).

group(a,60,2).
group(b,30,1).
group(c,50,2).
group(d,40,5).

museum(S) :-    findall(M,group(M,_,_),Mus),
                findall(C,group(_,C,_),Cap),
                findall(D,group(_,_,D),Dur),
                length(Mus, N),
                length(S, N),
                ic_global:sumlist(Dur,Sum),
                S #:: [0..Sum],
                museum_stay_times(S,Dur,E),
                ic_global:maxlist(E,Max),
                cumulative(S,Dur,Cap,100),
                bb_min(labeling(S),Max,_).
                
                
museum_stay_times([],[],[]).
museum_stay_times([S|Starts],[D|Durs],[E|Ends]):-
            S + D #= E,
            state_crossing_times(Starts,Durs,Ends). 