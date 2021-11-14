%%% seperate_lists/3
%%% seperate_lists(List,Lets,Nums)

seperate_lists(List,Lets,Nums) :-  findall(Y,(member(Y,List),atom(Y)),Lets),
				    findall(X,(member(X,List),number(X)),Nums).
