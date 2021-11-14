max_min_eval([X],X).

max_min_eval([A,Op,B|T],Res) :-  member(Op,[min,max]), 
				  C =..[Op,A,B,R], 
				  call(C), 
				  max_min_eval([R|T],Res).
