:- dynamic(relation/2).


getRelation(List) :-
    [(X,Y)|T]=List,    
    Fact =.. [relation,X,Y],    
    assertz(Fact),
    getRelation(T).  

check_transitive(Set, Relation):-  
\+(getRelation(Relation)),   
\+(check_notTrans),   
retractall(relation(_,_)).  

check_notTrans:-
relation(X,Y),
\+(transitive(X,Y)).

transitive(X,Y):-
relation(X,Y),
\+(relation(Y,Z)).

transitive(X,Y):-
relation(X,Y),  
\+(notTransitive(X,Y)).

notTransitive(X,Y):-
relation(Y,Z),
\+(check(X,Y,Z)).

check(X,Y,Z):-
relation(Y,Z),
relation(X,Z).





