/*
Panagiota Tychala - dai18162
*/

%%% command/3
%%% command(Operation,Current_state,Next_state)
%%% Succeeds when the operation leads from the current state to the next state
command(add_r1,state(acc(X),reg1(Y),R2,R3), state(acc(X+Y),reg1(Y),R2,R3)).
command(add_r2,state(acc(X),R1,reg2(Y),R3), state(acc(X+Y),R1,reg2(Y),R3)).
command(add_r3,state(acc(X),R1,R2,reg3(Y)), state(acc(X+Y),R1,R2,reg3(Y))).

command(subtract_r1,state(acc(X),reg1(Y),R2,R3), state(acc(X-Y),reg1(Y),R2,R3)).
command(subtract_r2,state(acc(X),R1,reg2(Y),R3), state(acc(X-Y),R1,reg2(Y),R3)).
command(subtract_r3,state(acc(X),R1,R2,reg3(Y)), state(acc(X-Y),R1,R2,reg3(Y))).

command(store_r1,state(acc(X),_R1,R2,R3), state(acc(X),reg1(X),R2,R3)).
command(store_r2,state(acc(X),R1,_R2,R3), state(acc(X),R1,reg2(X),R3)).
command(store_r3,state(acc(X),R1,R2,_R3), state(acc(X),R1,R2,reg3(X))).

command(load_r1,state(_Acc,reg1(X),R2,R3), state(acc(X),reg1(X),R2,R3)).
command(load_r2,state(_Acc,R1,reg2(X),R3), state(acc(X),R1,reg2(X),R3)).
command(load_r3,state(_Acc,R1,R2,reg3(X)), state(acc(X),R1,R2,reg3(X))).

%%% findOps/3
%%% findOps(Operation1,Operation2,Operation3)
%%% Succeeds when 3 operations are found, which lead from the initial state to the final state
findOps(O1,O2,O3) :- command(O1,state(acc(c1),reg1(0),reg2(c2),reg3(c3)),First_operation),
		                 command(O2,First_operation,Second_operation),
		                 command(O3,Second_operation,state(_Acc,reg1((c1-c2)+c3),_R2,_R3)).
