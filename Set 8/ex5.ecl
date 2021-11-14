:- lib(ic).
:- lib(ic_global).

item(pizza,12).
item(burger,14).
item(kingburger,18).
item(platSurprise,15).

%%% menu/2
%%% menu(Amount,Order)
menu(N,Final) :-  findall(F,item(F,_),Food),
                  findall(P,item(_,P),Prices),
                  constrain_menu(Food,N,Res,Final),

                  %%% Ορισμός πεδίου τιμών του Ν
                  ic_global:minlist(Prices, MinPrice),
                  N #:: [MinPrice..1.0Inf],
                  
                  %%% Xρήση της μικρότερης τιμής για καθορισμό του πλήθους των πιάτων
                  Limit is N/MinPrice,
                  LimitCeil is ceiling(Limit),
                  integer(LimitCeil,LimitInt),
               
                  %%% Δημιουργία λίστας αποτελεσμάτων
                  length(Food, Len),
                  length(Res, Len),
                  Res #:: [0..LimitInt],

                  labeling(Res).
               
               
%%% constrain_menu/5
%%% constrain_menu(ListOfMenuItems, Amount, Limit, Order, FinalOrder)
constrain_menu([],0,[],[]).
constrain_menu([F|Food],N,[R|Res],[R - F|Final]) :-   item(F,P),
                                                      NN #= N - R*P,
                                                      NN #>= 0,
                                                      constrain_menu(Food,NN,Res,Final).

