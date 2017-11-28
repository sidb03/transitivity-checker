:- dynamic(relation/2).

getRelation :-
   write('Relation write'),
   read(Relation),
   sub_string(Relation,1,_,1,Relation1),
   split_string(Relation1,",","()", List),
   write(List),
   rela(List).

rela(Lis) :-
    [X,Y|T]=Lis,
    atom_codes(A,X),
    atom_codes(B,Y),
    Fact =.. [relation,A,B],    
    assertz(Fact),
    rela(T).

check_transitive:-
\+(check_notTrans).

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


