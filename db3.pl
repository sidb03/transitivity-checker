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




