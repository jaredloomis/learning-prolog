mortal(X) :- human(X).
human(socrates).

appendList([],     List, List).
appendList([Head|Tail], List2, [Head|Result]) :-
    appendList(Tail, List2, Result).

% Filter

filter(_, [], []).
filter(P, [X|Xs], [X|Result]) :-
    call(P, X),
    filter(P, Xs, Result).
filter(P, [X|Xs], Result) :-
    filter(P, Xs, Result).

lt(N, X) :- X < N.
lt5(X) :- X < 5.

test1(X) :- filter(lt5, [1,2,3,4,5,6,7,8,9,10], X).
test2(X) :- filter(lt(6), [1,2,3,4,5,6,7,8,9,10], X).

% Fold

foldr(F, Accum,  [],     Accum).
foldr(F, Accum1, [X|Xs], Result) :-
    call(F, Accum1, X, Accum2),
    foldr(F, Accum2, Xs, Result).

add(X, Y, Z) :- Z is X + Y.

sum(Xs, X) :- foldr(add, 0, Xs, X).

% Database?

database(0, john, smith, 'jsmith@gmail.com', 45).

% Project Euler

euler1(Sum) :-
    numlist(0, 1000, Xs),
    filter(euler1IsMult, Xs, Results),
    sum(Results, Sum).

euler1IsMult(X) :-
    mod(X, 3) =:= 0;
    mod(X, 5) =:= 0.
