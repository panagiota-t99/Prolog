%%% reduce/3
%%% reduce(Operation, List, Results)


reduce(_,[X],X).

reduce(Op,[X,Y|Tail],Res):- C =..[Op,X,Y,R],
                     	    call(C),
                           reduce(Op,[R|Tail],Res).
