%%% Code for coursework 1 - 2021
%%% Panagiota Tychala - dai18162
%% Exec 1 Lists
%%% extend/2
%%% extend(List,NewList)
extend([],[]).
extend([(0,_)|T],NL) :- !,extend(T,NL). 
extend([(1,X)|T],[[X]|NL]) :- !,extend(T,NL). 
extend([(2,X)|T],[[X,X]|NL]) :- !,extend(T,NL). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exec2 Flights 
%%% flight/5
%%% flight(Code,fromto(Dep,Dest),etd(Time),eta(Time),cost(Cost)).
flight(oa123,fromto(skg,ath),etd(10),eta(11),cost(120)).
flight(oa124,fromto(skg,ath),etd(12),eta(13),cost(80)).
flight(oa125,fromto(skg,ath),etd(13),eta(14),cost(40)).
flight(oa126,fromto(ath,skg),etd(15),eta(16),cost(45)).
flight(oa127,fromto(ath,skg),etd(17),eta(18),cost(45)).
flight(oa120,fromto(skg,lgw),etd(13),eta(14),cost(140)).
flight(aa101,fromto(ath,lgw),etd(15),eta(18),cost(340)).
flight(aa120,fromto(ath,lhr),etd(16),eta(20),cost(120)).
flight(bt190,fromto(ath,lhr),etd(17),eta(21),cost(90)).
flight(bt100,fromto(lgw,ath),etd(18),eta(19),cost(30)).
flight(bt101,fromto(lgw,edi),etd(12),eta(13),cost(30)).
flight(bt110,fromto(lhr,edi),etd(22),eta(23),cost(30)).
flight(lf200,fromto(ath,fra),etd(15),eta(18),cost(550)).
flight(lf201,fromto(fra,ath),etd(20),eta(23),cost(550)).
flight(lf210,fromto(fra,edi),etd(20),eta(22),cost(200)).
flight(lf211,fromto(edi,fra),etd(16),eta(19),cost(190)).

%%% find_flight/5
%%% find_flight(Dept,Dest,Plan,Cost,ETA)
find_flight(Dept,Dest,Plan,Cost,ETA) :- find_flight(Dept,Dest,Plan,Cost,ETA,[Dept],-1).
find_flight(Dept,Dest,[Flight],Cost,ETA,_,Pr) :- flight(Flight,fromto(Dept,Dest),etd(ETD),eta(ETA),cost(Cost)),
                                                 ETD >= Pr + 1.
find_flight(Dept,Dest,[Flight|Plan],Cost,ETA,Visited,Pr) :- flight(Flight,fromto(Dept,Temp),etd(TempETD),eta(TempETA),cost(TempCost)), 
                                              Temp \= Dest,
                                              not(member(Temp,Visited)),
                                              TempETD >= Pr + 1,
                                              find_flight(Temp,Dest,Plan,NCost,ETA,[Temp|Visited],TempETA),
                                              Cost is NCost+TempCost.


%%% waiting_time/2
%%% waiting_time(Flights,WTime)
waiting_time([_],0) :- !.
waiting_time([H1,H2|T],WT) :- flight(H1,_,_,eta(F1A),_),
                              flight(H2,_,etd(F2D),_,_),
			      F2D >= F1A + 1,
                              Time is F2D - F1A,
                              waiting_time([H2|T], NWT),
                              WT is Time+NWT.


%%% select_flight/5
%%% select_flight(Dep,Dest,Plan,Before,Cost,MinWait)
select_flight(Dep,Dest,Plan,Before,Cost,MinWait) :- setof([MinWait,Cost,Plan],
                                                    (find_flight(Dep,Dest,Plan,Cost,ETA), ETA =< Before, waiting_time(Plan,MinWait)),
                                                    [[MinWait,Cost,Plan]|_]),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ΕΧEC 3
%%% reduction/2
%%% reduction(List,Value)
reduction(List,Val) :- reduction(List,[],Val).

reduction([],[X],X).
reduction([H|T],Stack,Val) :- number(H),!,
    reduction(T,[H|Stack],Val).
reduction([H|T],[X,Y|Stack],Val) :- member(H,[min,max,+,-,*,//]),!
    Pred =..[H,X,Y,Res],
    call(Pred),
    reduction(T,[Res|Stack],Val).
reduction([H|T],[X|Stack],Val) :- member(H,[abs]),!,
    Pred =..[H,X],
    Res is Pred,
    reduction(T,[Res|Stack],Val).

