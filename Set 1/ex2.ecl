%% Company Data
employee(name(john),position(programmer),wage(40000)).
employee(name(alice),position(programmer),wage(35000)).
employee(name(peter),position(uxdesigner),wage(25000)).
employee(name(nick),position(accountant),wage(60000)).
employee(name(helen),position(project_leader),wage(140000)).
employee(name(bob),position(programmer),wage(15000)).
employee(name(mathiew),position(project_namager),wage(50000)).
employee(name(donald),position(public_relations),wage(100000)).
employee(name(igor),position(server_admin),wage(20000)).


data(john,status(married,children(2))).
data(alice,status(single,children(0))).
data(peter,status(married,children(1))).
data(nick,status(married,children(3))).
data(helen,status(single,children(2))).
data(bob,status(single,children(0))).
data(mathiew,status(married,children(1))).
data(donald,status(single,children(1))).
data(igor,status(married,children(1))).


%%% wage/2
%%% wage(Employee,Wage)
%%% Returns the name and wage of an employee
wage(E,W) :- employee(name(E),_,wage(W)).


%%% single_with_children/2
%%% single_with_children(E,N)
%%% Succeeds when an employee is single and has children
single_with_children(E,N) :- data(E,status(single,children(N))),
                             N > 0.


%%% benefit/3
%%% benefit(Employee,Wage,Benefit)
%%% single and no children --> 0
%%% single with children --> 1500
%%% married and no children --> 500
%%% married with children --> 1100

benefit(E,W,0) :- wage(N,W),
                  data(E,status(single,children(0))).

benefit(E,W,1500) :-  wage(N,W),
                      single_with_children(E,_).

benefit(E,W,500) :- wage(N,W),
                    data(E,status(married,children(0))).

benefit(E,W,1100) :- wage(N,W),
                     data(E,status(married,children(N))),
                     N > 0.
