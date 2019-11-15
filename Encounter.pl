:- dynamic(enemy/3). /* enemy(tokemon, posX, posY) */

initEnemy(0) :- !. /* Basis */
initEnemy(N) :-
    random(1, 10, X),
    random(1, 10, Y),
    findall(Z, tokemon(Z), ListTokemon),
    length(ListTokemon, PanjangList),
    random(0, PanjangList, RandomNoTokemon),
    getElmt(ListTokemon, RandomNoTokemon, A),
    asserta(enemy(A, X, Y)), 
    write(X), nl, write(Y), nl, write(A), nl,
    N1 is N-1,
    initEnemy(N1), !.
    
/* Ambil elemen ke-N dari List */
getElmt([], 0, '') :- !.
getElmt([H|_], 0, H) :- !.
getElmt([_|T], N, X) :- N1 is N-1, getElmt(T, N1, X), !.


enc :-  nl, write('!!!!ALERT!!!!'), nl, write('A wild Tokemon appears!'), nl, nl, enemy(X, _, _), showEnemyStatus(X), 
        write('Fight or Run?'), write(' MASUK KONDISI BATTLE'), !.