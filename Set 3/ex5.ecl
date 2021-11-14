%%% vowels/2
%%% vowels(List,N)

vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

vowels([],0).

vowels([H|T],N) :-  vowel(H), 
                    vowels(T,N1),
                    N is N1 + 1.

vowels([H|T],N) :-  not vowel(H),
                    vowels(T,N).


