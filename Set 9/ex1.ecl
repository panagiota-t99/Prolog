:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 


%%% worker/3
%%% worker(N,Jobs,Cost)
worker(1,[4,1,3,5,6],[30,8,30,20,10]).
worker(2,[6,3,5,2,4],[140,20,70,10,90]).
worker(3,[8,4,5,7,10],[60,80,10,20,30]).
worker(4,[3,7,8,9,1],[30,40,10,70,10]).
worker(5,[7,1,5,6,4],[40,10,30,20,10]).
worker(6,[8,4,7,9,5],[20,100,130,220,50]).
worker(7,[5,6,7,4,10],[30,30,30,20,10]).
worker(8,[2,6,10,8,3],[50,40,20,10,60]).
worker(9,[1,3,10,9,6],[50,40,10,20,30]).
worker(10,[1,2,7,9,3],[20,20,30,40,50]). 

%%% solve/2
%%% solve(Tasks,Cost)
solve(Tasks,Cost) :- findall(W, worker(W,_,_), Workers),
                     apply_constrain(Workers,Tasks,Costs),
                     ic_global:alldifferent(Tasks),
                     sumlist(Costs,Cost), 
                     bb_min(labeling(Tasks),Cost,_).

apply_constrain([],[],[]).
apply_constrain([W|RestWorkers],[T|RestTasks],[C|RestCosts]) :- worker(W,Tasks,Costs),
                                                   element(I, Tasks, T),
                                                   element(I, Costs, C),
                                                   apply_constrain(RestWorkers,RestTasks,RestCosts).
                                                   
                     

                     
                      



                      


