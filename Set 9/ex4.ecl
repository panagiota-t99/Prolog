:- lib(ic).
:- lib(ic_global).
:- use_module(library(branch_and_bound)). 

box(1,140).
box(2,200).
box(3,450).
box(4,700).
box(5,120).
box(6,300).
box(7,250).
box(8,125).
box(9,600). 
box(10,650).

load_trucks(TA,LA,TB,LB) :- findall(B,box(_,B),Boxes),
                            length(TA,3),
                            length(TB,4),
                            apply_constraint(Boxes,TA,WLA),
                            sumlist(WLA,LA),
                            LA #=< 1200,
                            apply_constraint(Boxes,TB,WLB),
                            sumlist(WLB,LB),
                            LB #=< 1350,
                            append(TA,TB,TC),
                            ic_global:alldifferent(TC),
                            Cost #= 2550 - LA - LB,
                            bb_min(labeling(TC),Cost,_).

apply_constraint(_,[],[]).
apply_constraint(Boxes,[I|RestT],[V|RestL]) :- element(I,Boxes,V),
                                                   apply_constraint(Boxes,RestT,RestL).
                                                   
                            
