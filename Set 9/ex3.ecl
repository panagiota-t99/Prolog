:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 

student(alex,[4,1,3,5,6]).
student(nick,[6,3,5,2,4]).
student(jack,[8,4,5,7,10]).
student(helen,[3,7,8,9,1]).
student(maria,[7,1,5,6,4]).
student(evita,[8,4,7,9,5]).
student(jacky,[5,6,7,4,10]).
student(peter,[2,6,10,8,3]).
student(john,[1,3,10,9,6]).
student(mary,[1,6,7,9,10]). 

%%% solve/2
%%% solve(Students,Cost)
solve(Students,Sum) :- findall(S,student(S,_),SList),
                        apply_constraint(SList,Prefs,Index,Students),
                        ic_global:alldifferent(Prefs),
                        sumlist(Index,Sum),
                        bb_min(labeling(Prefs),Sum,_).

apply_constraint([],[],[],[]).
apply_constraint([S|RestS],[P|RestP],[I|RestI],[(S,P)|RestA]) :- student(S,Prefs),
                                                       element(I, Prefs, P),
                                                       apply_constraint(RestS,RestP,RestI,RestA).
                                                       
                        
                                             
                                             
                        
                        
