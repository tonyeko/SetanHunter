/* Encounter */
enc :-  nl, write('!!!!Cilukk Baaaa!!!!'), nl, write('Tiba-tiba ada setan '), playerPos(A, B), enemy(X, C, D), A == C, B == D, write(X), write(' muncul di depanmu!'), nl, nl, showEnemyStatus(X), 
        write('Fight or Run?'), nl, readbattlechoice. 

readbattlechoice :- write('$ '), read(P), battlechoice(P).

battlechoice(P) :- P = 'Fight', !, initBattle.
battlechoice(P) :- P = 'fight', !, initBattle.
battlechoice(P) :- P = 'Run', !, random(1,100,Q), run(Q). 
battlechoice(P) :- P = 'run', !, random(1,100,Q), run(Q). 
battlechoice(_) :- write('Pilihan tidak ada. Masukkan fight atau run'), nl, readbattlechoice.

/* Battle */
preBattle :-
    write('A wild Setan appears!'), nl,
    write('Fight or Run?'),nl,
	write('$ '), read(P),
    P = 'Fight' -> run(0);
    random(1,100,Q), run(Q).

run(X) :- X < 50, !, write('You failed to run!'), nl, initBattle, !.
run(_) :- write('You sucessfully escaped the Setan!').

pick(X) :-
    searchParty(X), !,
    showPlayerName, write(' : '),
    write(X),
    write(', lawan setan itu!'), nl, nl,
    playerPos(D, E), enemy(A, B, C), D == B, E == C,
    assertz(fighting(X, A)),
    battle, !.
pick(_) :-
    write('You don''t have that Setan!'), nl,
    write('Pick: '), read(Input), pick(Input).


showsetan([]).
showsetan([X|T]) :-
	setan(X),
	write(' - '), write(X), nl,
	showsetan(T).

spused(0).
initBattle :-
    spused(0), 
    write('Choose your Setan!'), nl, nl,
    write('Available Setans: '),
    playerSetan(L), nl,
    showsetan(L), nl, 
    write('Pick: '), 
    read(Input), nl,
    pick(Input).

iseffective(X, Y, M) :-
    type(YourSetanType, X), type(EnemySetanType, Y),
    seffective(YourSetanType, EnemySetanType), !,
    M is 2.
iseffective(X, Y, M) :-
    type(YourSetanType, X), type(EnemySetanType, Y),
    neffective(YourSetanType, EnemySetanType), !,
    M is (1/2).
iseffective(_, _, M) :-
    M is 1.

battlestatus :-
    fighting(X, Y),
    write('Enemy Status: '), nl,
    write(Y), nl,
    write('Health: '), hp(Y, P),
    write(P), nl,
    write('Type: '), type(Q, Y),
    write(Q), nl, nl,
    write('Your Status: '), nl,
    write(X), nl,
    write('Health: '), hp(X, R),
    write(R), nl,
    write('Type: '), type(S, X),
    write(S), nl, nl.

battlecommand(attack) :-
    fighting(X, Y),
    iseffective(X, Y, Modifier),
    nattack(X, Z),
    Damage is (Z * Modifier),
    hp(Y, P), P1 is P-Damage, 
    retract(hp(Y, P)), asserta(hp(Y, P1)),
    write('You dealt '), write(Damage),
    write(' damage to '),
    write(Y), nl.

battlecommand(specialattack) :-
    fighting(X, Y), \+ spused(player),
    write(X),
    spattack(X, U, Z),
    write(' uses '), write(Z), write('!'),
    iseffective(X, Y, Modifier),
    hp(Y, P), P is P-(U * Modifier),
    write(Y), nl, nl,
    assertz(spused(player)).

battlecommand(specialattack) :-
    fighting(_, _), spused(player),
    write('Special Attack sudah digunakan!').

battlecommand(status) :- battlestatus.

enemymove :-  
    fighting(X, Y),
    nattack(Y, U),
    hp(X, P), P is P-U,
    write(X), nl, nl.

battle :-
    repeat,
        battlestatus,
        write('DEBUG'), nl,
        write('$ '), read(Input), nl,
        battlecommand(Input), nl,
        enemymove,
        write('HahahihiDEBUG').
