%%% atom/2
%%% atom(Name,List)

atom(hydrogen,[h1,h2,h3,h4,h5,h6,h7]).
atom(carbon,[c1,c2,c3,c4,c5,c6,c7]).
atom(chlorine,[cl]).


%%% atom_bonds_to/2
%%% atom_bonds_to(Atom,List)

atom_bonds_to(h1,[c1]).
atom_bonds_to(h2,[c3]).
atom_bonds_to(h3,[c3]).
atom_bonds_to(h4,[c5]).
atom_bonds_to(h5,[c3]).
atom_bonds_to(h6,[c6]).
atom_bonds_to(h7,[c7]).

atom_bonds_to(c1,[h1,c4,c2]).
atom_bonds_to(c2,[c1,c5,cl]).
atom_bonds_to(c3,[h2,h3,h5,c4]).
atom_bonds_to(c4,[c3,c1,c6]).
atom_bonds_to(c5,[c2,c7,h4]).
atom_bonds_to(c6,[c4,c7,h6]).
atom_bonds_to(c7,[c6,c5,h7]).

atom_bonds_to(cl,[c2]).


%%% carbon/1
carbon(X) :- atom(carbon,L),
	     member(X,L).
	     
%%% hydrogen/1
hydrogen(X) :- atom(hydrogen,L),
		member(X,L).

%%% bonded/2
bonded(X,Y) :- atom_bonds_to(X,L),
		member(Y,L).
		
%%% methyl/1
methyl(X) :- carbon(X),
	     bonded(X,H1),
	     bonded(X,H2),
	     bonded(X,H3),
	     hydrogen(H1),
	     hydrogen(H2),
	     hydrogen(H3),
	     H1 \= H2,
	     H1 \= H3,
	     H2 \= H3, !.
	     
	     

			   
	     
