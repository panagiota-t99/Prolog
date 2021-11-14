%%%% Coursework 2 2021
%%%% Panagiota Tychala - dai18162
:-lib(ic).
:-lib(ic_global).
:-lib(ic_edge_finder).
:-lib(branch_and_bound). 

%%% Exec 1
ram([2,8,8,16,2,4]).
price([30,35,20,38,44,65]).
vcpu([4,8,8,4,4,8]).

%%% select_providers/3
%%% select_providers(Provider1,Provider2,TotalCost)
select_providers(X,Y,Cost) :-   /* Συλλογή δεδομένων */
                                ram(Ram),
                                price(Price),
                                vcpu(Vcpu),

                                /* Δημιουργία των 2 μεταβλητών για τους providers με βάση το πλήθος τους */
                                length(Ram, N),
                                [X,Y] #:: [1..N],
                                X #\= Y,

                                /* Ικανοποίηση του περιορισμού για ram */
                                element(X, Ram, Ram1),
                                element(Y, Ram, Ram2),
                                Ram1 #>= 4,
                                Ram2 #>= 4,

                                /* Ικανοποίηση του περιορισμού για vcpu */
                                element(X, Vcpu, Vcpu1),
                                element(Y, Vcpu, Vcpu2),
                                Vcpu1 + Vcpu2 #= 12,

                                /* Εύρεση συνολικού κόστους */
                                element(X, Price, Pr1),
                                element(Y, Price, Pr2),
                                Cost #= Pr1 + Pr2,

                                /* Ελαχιστοποίηση του κόστους */
                                bb_min(labeling([X,Y]),Cost,_).
                                

%%% Exec2
class(clp,3,40,3).
class(procedural,3,60,2).
class(analysis,4,50,2).
class(computer_sys,4,40,3).
class(algebra,3,40,4).

%%% lectures/3
%%% lectures(Classes,Starts,Makespan)
lectures(Classes, Starts, Makespan) :-  /* Συλλογή δεδομένων */
                                        findall(C,class(C,_,_,_),Classes),
                                        findall(D,class(_,D,_,_),Duration),
                                        findall(Z,class(_,_,Z,_),Zoom),
                                        findall(T,class(_,_,_,T),Teachers),

                                        /* Δημιουργία λίστας με τις ώρες έναρξης με βάση το πλήθος των μαθημάτων */
                                        length(Classes, N),
                                        length(Starts, N),
                                        /* Τα μαθήματα ξεκινάνε στις 9. 
                                           Χρησιμοποιείται το 20 ως τελευταία ώρα έναρξης 
                                           αφού τα μαθήματα τελειώνουν στις 21. */
                                        Starts #:: [9..20],

                                        /* Ικανοποίηση περιορισμού για την διάθεση 100 αδειών zoom */
                                        cumulative(Starts,Duration,Zoom,100),

                                        /* Ικανοποίηση περιορισμού για τον συνολικό αριθμό διδασκόντων */
                                        cumulative(Starts,Duration,Teachers,6),
                                        
                                        /* Εύρεση ωρών λήξης */
                                        lectures_end_time(Starts,Duration,Ends),

                                        /* Επιλογή της μεγαλύτερης ώρας λήξης και ελαχιστοποίηση */
                                        ic:maxlist(Ends,Makespan),
                                        bb_min(labeling(Starts),Makespan,_).
%%% lectures_end_time/3
%%% lectures_end_time(Start,Duration,End)
lectures_end_time([],[],[]).
lectures_end_time([S|Starts],[D|Duration],[E|Ends]) :-  S + D #= E,
                                                        /* Τα μαθήματα τελειώνουν στις 21 */
                                                        E #=< 21,
                                                        lectures_end_time(Starts,Duration,Ends).
                                        
                                        

	
%%% Exec 3
product(a,40).
product(b,56).
product(c,48).
product(d,64).

%%% company/4
%%% company(Starts,PrintingDuration,Machines,Makespan)
company(st(S), dur(D), machines(Machines), M) :-   /* Συλλογή δεδομένων */
                                findall(O,product(O,_), Orders),
                                findall(P,product(_,P),Products),

                                /* Δημιουργία λίστας ωρών έναρξης με βάση το πλήθος παραγγελιών */
                                length(Orders, N),
                                length(S, N),
                                /*  Το άθροισμα χρησιμοποιείται για μια χαλαρή προσέγγιση του άνω oρίου,
                                    σε περίπτωση που οι παραγγελίες εκτυπώνονται η μία μετά την άλλη */
                                ic_global:sumlist(Products,Sum),
                                S #:: [0..Sum],
                                
                                /*  Δημιουργία της λίστας για τις μηχανές που θα χρειαστεί η κάθε παραγγελία.
                                    Οι μηχανές είναι συνολικά 8 και δεν γίνεται για καμία παραγγελία να χρησιμοποιηθούν
                                    λιγότερες από 2 μηχανες. */
                                length(Machines, N),
                                Machines #:: [2..8],

                                /*  Δημιουργία λίστας διάρκειας εκτύπωσης */
                                length(D, N),

                                /* Βοηθητικό κατηγόρημα το οποίο δημιουργεί την λίστα FullD, η οποία περιέχει την συνολική διάρκεια
                                   για κάθε παραγγελία (χρόνος εκτύπωσης + παραμετροποίηση μηχανών), και την λίστα Ε, η οποία περιέχει τους χρόνους
                                   ολοκλήρωσης κάθε παραγγελίας */
                                printing_end_time(S,D,FullD,E,Machines,Products),

                                /* Ικανοποίηση περιορισμού για 8 μηχανές */
                                cumulative(S,FullD,Machines,8),

                                /*  Ικανοποίηση περιορισμού για ποιοτικό έλεγχο ο οποίος δέχεται μέχρι 2 παραγγελίες.
                                    Κάθε παραγγελία έχει 1 στην λίστα Inspect. */
                                length(Inspect,N),
                                Inspect #:: [1],
                                cumulative(S,FullD,Inspect,2),

                                /* Εύρεση μέγιστου χρόνου λήξης και ελαχιστοποίηση του 
                                   Δεν λαμβάνεται υπόψιν η τελευταία παραμετροποίηση για τις μηχανές,
                                   γι αυτό και αφαιρούνται 15 λεπτά από το αποτέλεσμα */
                                ic:maxlist(E,M),
                                bb_min(labeling([S,Machines]),M,_).


%%% printing_time/6
%%% printing_time(Start,PrintingDuration,FullDuration,End,Machine,Product)
printing_end_time([],[],[],[],[],[]).
printing_end_time([S|Starts],[PD|PDuration],[FD|FDuration],[E|Ends],[M|Machines],[P|Products]) :-  
                                                    /* Yπολογισμός της απαιτούμενης διάρκειας εκτύπωσης με βάση
                                                    τον αριθμό των προϊόντων και των διαθέσιμων μηχανών */                 
                                                    P/M #= PD,
                                                    /* Συνολική διάρκεια μαζί με την παραμετροποίηση */
                                                    FD #= PD + 15,
                                                    /* Χρόνος ολοκλήρωσης παραγγελίας */
                                                    S + PD #= E,
                                                    printing_end_time(Starts,PDuration,FDuration,Ends,Machines,Products).



                                       

 
                                
                                
