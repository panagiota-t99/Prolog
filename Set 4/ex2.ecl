%%% missing_letter/3
%%% missing_letter(LetterList, Letter, Word)

word([p,r,o,l,o,g]).

missing_letter(List,X,W) :- word(W),
			     delete(X,W,List).
