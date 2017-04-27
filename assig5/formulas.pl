formula(atom(_)).
formula(v(A, B)):- formula(A), formula(B).
formula(~(A)):- formula(A).
formula(^(A, B)):- formula(A), formula(B).
formula(->(A, B)):- formula(A), formula(B).
formula(<->(A, B)):- formula(A), formula(B).

flength(atom(_), 1).
flength(v(A, B), L):-flength(A, C),flength(B, D),L is C+D.
flength(~(A), L):-flength(A, C),L is C.
flength(^(A, B), L):-flength(A, C),flength(B, D),L is C+D.
flength(->(A, B), L):-flength(A, C),flength(B, D),L is C+D.
flength(<->(A, B), L):-flength(A, C),flength(B, D),L is C+D.

lvar(atom(A), [A]).
lvar(v(A, B), L):-lvar(A, C),lvar(B, D),append(C, D, L).
lvar(~(A), L):-lvar(A, L).
lvar(^(A, B), L):-lvar(A, C),lvar(B, D),append(C, D, L).
lvar(->(A, B), L):-lvar(A, C),lvar(B, D),append(C, D, L).
lvar(<->(A, B), L):-lvar(A, C),lvar(B, D),append(C, D, L).

list(cons(_, nil)).
list(cons(_, B)):-list(B).

consAppend(nil,X,X).
consAppend(cons(X,L1),L2,cons(X,L3)):-consAppend(L1,L2,L3).
prefix(A, L) :- consAppend(A, _, L).
suffix(B, L) :- consAppend(_, B, L).
sublist(L1, L2) :- suffix(S, L2), prefix(L1, S).

lilength(cons(_,nil),1).
lilength(cons(A,B), L):-lilength(B, D), L is 1+D.