

relation(a,b).
relation(b,c).
relation(a,c).
relation(b,b).
relation(b,d).
relation(d,e).
relation(b,e).




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

# check(X,Y):-
# (relation(Y,Z),
# relation(X,Z)).




