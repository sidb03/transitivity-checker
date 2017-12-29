:- dynamic(relation/2).
transitive_closure=[].

getRelation(Relation) :-
   sub_string(Relation,1,_,1,Relation1),
   split_string(Relation1,",","()", List),
   rela(List).

rela(Lis) :-
    [X,Y|T]=Lis,
    atom_codes(A,X),
    atom_codes(B,Y),
    Fact =.. [relation,A,B],    
    assertz(Fact),
    rela(T).

check_transitive(Set, Relation):-
\+(getRelation(Relation)),
\+(check_notTras).

check_notTrans:-
relation(X,Y),
\+(transitive(X,Y)).

transitive(X,Y):-
relation(X,Y),
\+(relation(Y,Z)).

transitive(X,Y):-
relation(X,Y),
add_to_set(X,Y),
\+(notTransitive(X,Y)).

notTransitive(X,Y):-
relation(Y,Z),
add_to_set(Y,Z),
\+(check(X,Y,Z)).

check(X,Y,Z):-
relation(Y,Z),
relation(X,Z)
add_to_set(X,Z).

add_to_set(A,B):-
   atom_concat('(',A,",",B,")",K).
   append(transitive_closure,[K],transitive_closure).