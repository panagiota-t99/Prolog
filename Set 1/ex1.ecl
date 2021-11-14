%%% and/3
and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

%%% or/3
or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

%%% not/2
not(0,1).
not(1,0).

%%% xor_gate/3
xor_gate(0,0,1).
xor_gate(0,1,0).
xor_gate(1,0,0).
xor_gate(1,1,1).

%%% nand_gate/3
nand_gate(X,Y,Z) :- and(X, Y, Result), not(Result, Z).

%%% half_adder/3
%%% half_adder(X,Y,C,S)
%%% Half adder consists of two gates(and,xor)
half_adder(X,Y,C,S) :- xor_gate(X,Y,S), and(X,Y,C).


%%% full_adder/5
%%% full_adder(X,Y,C,Cout,S)                             
full_adder(X,Y,C,Cout,S) :- xor_gate(X,Y,Result_xor),
                            xor_gate(C,Result_xor,S),
                            and(X,Y,Result_and1), 
                            and(C,Result_xor,Result_and2), 
                            or(Result_and1,Result_and2,Cout).

full_adder2(A,B,Cin,Cout,S) :- half_adder(A,B,C1,S1), half_adder(Cin,S1,C2,S), or(C1,C2,Cout).
                       





