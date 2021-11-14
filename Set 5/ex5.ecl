%%% unique_element/2
%%% unique_element(Element,List)

unique_element(X,List):- delete(X,List,Dlist),
			  not(member(X,Dlist)).
