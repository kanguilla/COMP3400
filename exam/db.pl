r(a, b).
r(a, c).
r(c, a).

s(a, b).
s(a, c).
s(c, b).
s(d, a).

v(_, L):- findall({X,Y},(r(X,Y), not(s(Y,_))),L).
violated :- v(_, L), length(L, X), X>0.

sr(L) :- findall({Y,X}, (r(X,Y), not(r(Y,X)));r(Y,X), L).