:-use_module(library(ic)).
:-use_module(library(branch_and_bound)). 
:-use_module(library(ic_edge_finder)).

solve(Starts,Cost) :- Starts = [A1,A2,A3,B1,B2,B3,C1,C2,C3],
            Starts #:: [0..1000],
            A1 + 5 #= EndA1,
            A1 #>= 5,

            A2 + 20 #= EndA2,

            A3 + 15 #= EndA3,
            A3 #>= 10,

            B1 + 5 #= EndB1,

	        B2 + 10 #= EndB2,
	        B2 #>= 10,

            B3 + 5 #= EndB3,
            B3 #>= 5,
            
            C1 + 10 #= EndC1,

            C2 + 15 #= EndC2,
            C2 #>= 10,

            C3 + 10 #= EndC3,
            C3 #>= 20,

            EndA1 #=< A2,
            EndA2 #=< A3,

            EndB1 #=< B2,
            EndB2 #=< B3,

            EndC1 #=< C2,
            EndC2 #=< C3,

            disjunctive([A1,B1,C1],[5,5,10]),
            disjunctive([A2,B2,C2],[20,10,15]),
            disjunctive([A3,B3,C3],[15,5,10]),

            Cost #= (EndA1 - 20) + (EndA2 - 40) + (EndA3 - 35) + (EndB1 - 30) + (EndB2 - 25) + (EndB3 - 30) + 
            (EndC1 - 15) + (EndC2 - 35) + (EndC3- 35),
            
            bb_min(labeling(Starts),Cost,_). 


            


