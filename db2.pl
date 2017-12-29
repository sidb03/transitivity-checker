:- dynamic(relation/2).
:- dynamic(notTrans/1).

getRelation(List) :-
    [(X,Y)|T]=List,    
    Fact =.. [relation,X,Y],    
    assertz(Fact),
    getRelation(T).  

check_transitive(Set, Relation):-
retractall(notTrans(_)),
write("Transitive Closure: {"),
\+(getRelation(Relation)),   
\+(check_notTrans), 
write("}"),
nl,write("Is Transitive?"),
retractall(relation(_,_)),
\+(notTrans(rela)).

check_notTrans:-
relation(X,Y), 
format('(~w,~w),',[X,Y]),
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

check(X,Y,Z):-
relation(Y,Z),
\+(relation(X,Z)),
format('(~w,~w),',[X,Z]),
assertz(notTrans(rela)).