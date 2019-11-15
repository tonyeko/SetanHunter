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

iseffective(X, Y, M) :-
    type(X, P), type(Y, Q),
    seeffective(P, Q), !,
    M is 2.
iseffective(X, Y, M) :-
    type(X, P), type(Y, Q),
    neffective(P, Q), !,
    M is (1/2).
iseffective(X, Y, M) :-
    M is 1.

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
        nattack(X, Z), write(Z),
        write(' damage to'),
        write(Z), nl, nl,
        iseffective(Modifier),
        hp(Y, P), P is P-(Z * Modifier),
        battlestatus.

    battlecommand(specialattack) :-
        fighting(X, Y), \+ spused(player),
        write(X),
        spattack(X, U, Z),
        write(' uses '), write(Z), write('!'),
        iseffective(Modifier),
        hp(Y, P), P is P-(U * Modifier),
        write(Y), nl, nl,
        assertz(spused(player)).
    battlecommand(specialattack) :-
        fighting(X, Y), spused(player),
        write('Special Attack sudah digunakan!').

    enemymove(N):-
        fighting(X, Y), N > 7,
        spattack(Y, U, W),
        write(' uses '), write(W), write('!'),
        iseffective(Modifier),
        hp(X, P), P is P-(U * Modifier),
        write(X), nl, nl.
    enemymove(N):-
        fighting(X, Y), spused(enemy),
        spattack(Y, U, W),
        write(' uses '), write(W), write('!'),
        iseffective(Modifier),
        hp(X, P), P is P-(U * Modifier),
        write(X), nl, nl.
    enemymove(N):-
        fighting(X, Y), N <= 7, \+ spused(enemy),
        nattack(Y, U),
        iseffective(Modifier),
        hp(X, P), P is P-(U * Modifier),
        write(X), nl, nl.

        battle :-
            repeat,
                battlestatus,
                write('$ '), read(Input), nl,
                battlecommand(Input), nl,
                endbattle,
                random(1, 10, N),
                enemymove(N),
                endbattle.

        endbattle :-
            fighting(X, Y),
            hp(Y, P), P = 0,
            retspatk, !.
        endbattle :-
            fighting(X, Y),
            hp(X, P), P = 0,
            playerTokemon(L), L = [], !,
            health(R), R is 0,
            retspatk.              /* bener kah? */
        endbattle :-
            fighting(X, Y),
            hp(X, P), P = 0, !,
            /* retract */
            write('$ '), read(Input), nl,
            pick(Input), nl.

        restore :-
            spused(player), retract(spused(player)),
            fighting(X,Y), retract(fighting(X,Y)).
        restore :-
            spused(enemy), retract(spused(enemy)),
            fighting(X,Y), retract(fighting(X,Y)).
        restore :-
            spused(player), retract(spused(player)),
            spused(enemy), retract(spused(enemy)),
            fighting(X,Y), retract(fighting(X,Y)).
