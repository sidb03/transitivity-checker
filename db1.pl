relation(a,b).
relation(b,c).
relation(a,c).
relation(c,d).
relation(a,d).
relation(d,e).
relation(e,f).
relation(f,d).

# transitive(X,Y):-
# relation(X,Y).

transitive(X,Z):-
relation(X,Y),
transitive(Y,Z).