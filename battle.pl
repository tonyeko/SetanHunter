/* Kondisi */
enc :- playerPos(X,Y), enemyTokPos(W,Z), X = W, Y = Z, preBattle.
/* Spawn wild tokemon*/
enemyTok(X) :- enc,!, random(tokemon(X)),asserta(enemyTok(X)).
/* Lokasi Enemy */
enemyTokPos(X,Y) :- random(1,10,X), random(1,10,Y), asserta(enemyTokPos(X,Y)).
legTokPos(X,Y,Z) :- random(1,10,X), random(1,10,Y), random(1,10,Z),asserta(legTokPos(X,Y,Z)).

/* Battle */
preBattle :-
    write('A wild Tokemon appears!'), nl,
    write('Fight or Run?'),nl,
	write('$ '), read(P),
    P = 'Fight' -> run(0);
    random(1,100,Q), run(Q).

run(X) :-
    X < 50, ! ,                                     /* ini bener kah? */
    write('You failed to run!'), nl, initBattle, !.
run(X) :-
    write('You sucessfully escaped the Tokemon!').  /* ini kmn? */

pick(X) :-
    searchParty(X), !,
    write('You : "'),
    write(X),
    write(' I choose you!"'), nl, nl,
    enemyTok(Y), assertz(fighting(X,Y)),
    battle, !.
pick(X) :-
    write('You don’t have that Tokemon!').


showtokemon([]) :- write(']').
showtokemon([X|T]) :-
    tokemon(X), write(X), write(','),
    showtokemon(T).

initBattle :-
    write('Choose your Tokemon!'), nl, nl,
    write('Available Tokemons: '),
    playerTokemon(L), write('['),
    showtokemon(L), nl, nl,
    write('$ '), read(Input), nl,
    pick(Input).

enemymove .

iseffective(M) :- M is 1 . /* blm di cek */ 

battlestatus :-
    fighting(X, Y),
    write(Y), nl,
    write('Health: '), hp(Y, P),
    write(P), nl,
    write('Type: '), type(Q, Y),
    write(Q), nl, nl,
    write(X), nl,
    write('Health: '), hp(X, R),
    write(R), nl,
    write('Type: '), type(S, X),
    write(S), nl, nl.

battlecommand(attack) :-
    fighting(X, Y),
    write('You dealt'),
    nattack(X, Y), write(Y),
    write(' damage to'),
    write(Y), nl, nl,
    iseffective(Modifier),
    hp(Y, P), P is P-(Y * Modifier),
    battlestatus,
    enemymove.

battlecommand(specialattack) :-
    fighting(X, Y),
    write(X),
    spattack(X, Y, Z),
    write(' uses '), write(Z), write('!'),
    iseffective(Modifier),
    hp(Y, P), P is P-(Y * Modifier),
    write(Y), nl, nl,
    enemymove.

battle :-
    repeat,
        battlestatus,
        write('$ '), read(Input), nl,
        battlecommand(Input), nl,
        endbattle.

endbattle :-
    fighting(X, Y),
    hp(Y, P), P = 0, !.
endbattle :-
    fighting(X, Y),
    hp(X, P), P = 0,
    playerTokemon(L), L = [], !,
    health(R), R is 0.              /* bener kah? */
endbattle :-
    fighting(X, Y),
    hp(X, P), P = 0, !,
    /* retract */
    write('$ '), read(Input), nl,
    pick(Input), nl.
