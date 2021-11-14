:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 
:- use_module(library(ic_edge_finder)).

reading(course1,3,12).
reading(course2,5,20).
reading(course3,2,8).
reading(course4,7,22).


schedule_reads(S) :-    findall(D,reading(_,D,_),Dur),
                        findall(E,reading(_,_,E),Exams),
                        length(Dur, N),
                        length(S, N),
                        S #:: [1..31],
                        reading_time(S,Dur,Exams,E),
                        ic_global:maxlist(E,Max),
                        disjunctive(S,Dur),
                        bb_min(labeling(S),Max,_).



reading_time([],[],[],[]).
reading_time([S|Starts],[D|Durs],[Ex|Exams],[E|Ends]) :-   S + D #= E,
                                                           E #=< Ex,
                                                reading_time(Starts,Durs,Exams,Ends). 