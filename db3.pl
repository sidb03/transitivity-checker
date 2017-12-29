:- dynamic(rela/2).


relation(a,b).
relation(a,c).
relation(a,d).
relation(b,a).
relation(b,c).
relation(b,e).
relation(c,d).
relation(c,e).
relation(d,e).
relation(e,f).
relation(a,e).


transitive(X,Y):-
relation(X,Y),
make_rela(X,Y),
\+(relation(Y,Z)).


transitive(X,Y):-
relation(X,Y),
make_rela(X,Y),
\+(notTransitive(X,Y)).


notTransitive(X,Y):-
relation(Y,Z),
make_rela(Y,Z),
\+(check(X,Y,Z)).

check(X,Y,Z):-
relation(Y,Z),
relation(X,Z),
make_rela(X,Z).

make_rela(A,B):-
Fact =.. [rela,A,B],    
    assertz(Fact).



    trans(X,Y):-
    relation(X,Y),
    relation(Y,Z),
    check(X,Y,Z).

    check(X,Y,Z):-
    relation(Y,Z),
    relation(X,Z) #Wheerevr this condition is false, make relation.
