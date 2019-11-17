:- dynamic(spused/2).
:- dynamic(enemyHP/2).
:- dynamic(fighting/2).
:- dynamic(battleWithLegend/1).

/* Encounter */
enc :-  nl, write('!!!!Cilukk Baaaa!!!!'), nl, write('Tiba-tiba ada setan '), playerPos(A, B), enemy(X, C, D), A == C, B == D, write(X), write(' muncul di depanmu!'), nl, nl, showEnemyStatus(X),
        write('Fight or Run?'), nl, readbattlechoice.
encLegend :-  nl, write('!!!!ALERTT!!!!'), nl, write('Tiba-tiba ada BOS setan '), playerPos(A, B), legendaryPos(X, C, D), A == C, B == D, asserta(enemy(X, C, D)), write(X), write(' muncul di depanmu!'), nl, nl, showEnemyStatus(X),
                asserta(battleWithLegend(1)), initBattle.

readbattlechoice :- write('$ '), read(P), battlechoice(P).

battlechoice(P) :- P = 'Fight', !, asserta(battleWithLegend(0)), initBattle, !.
battlechoice(P) :- P = 'fight', !, asserta(battleWithLegend(0)), initBattle, !.
battlechoice(P) :- P = 'Run', !, random(1,100,Q), run(Q), !.
battlechoice(P) :- P = 'run', !, random(1,100,Q), run(Q), !.
battlechoice(_) :- write('Pilihan tidak ada. Masukkan fight atau run'), nl, readbattlechoice, !.

/* Battle */
preBattle :-
    write('A wild Setan appears!'), nl,
    write('Fight or Run?'),nl,
	write('$ '), read(P),
    P = 'Fight' -> run(0);
    random(1,100,Q), run(Q).

run(X) :- X < 50, !, write('You failed to run!'), nl, asserta(battleWithLegend(0)), initBattle, !.
run(_) :- write('You sucessfully escaped the Setan!'), !.

pick(X) :-
    searchParty(X), !,
    showPlayerName, write(' : '),
    write(X),
    write(', lawan setan itu!'), nl, nl,
    playerPos(D, E), B is D, C is E, enemy(A, B, C),
    asserta(fighting(X, A)),
    starthp(A, M), asserta(enemyHP(A, M)),
    battle, !.
pick(_) :-
    write('You don''t have that Setan!'), nl,
    write('Pick: '), read(Input), pick(Input).

showsetan([]).
showsetan([X|T]) :-
	write(' - '), write(X), nl,
	showsetan(T).

initBattle :-
    write('Choose your Setan!'), nl, nl,
    write('Available Setans: '),
    playerSetan(L), nl,
    showsetan(L), nl,
    write('Pick: '),
    asserta(spused(player, 0)), asserta(spused(enemy, 0)),
    read(Input), nl,
    pick(Input).

initBattleKe2 :-
    write('Available Setans: '),
    playerSetan(L), nl,
    showsetan(L), nl,
    write('Pick: '),
    asserta(spused(player, 0)),
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
    write('Health: '), enemyHP(Y, P),
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
    enemyHP(Y, P), P1 is P-Damage,
    retract(enemyHP(Y, P)), asserta(enemyHP(Y, P1)),
    write('You dealt '), write(Damage),
    write(' damage to '), write(Y).

battlecommand(specialattack) :-
    fighting(X, Y), spused(player, 0), !,
    spattack(X, U, Z),
    write(X), write(' uses '), write(Z), write('!'), nl,
    iseffective(X, Y, Modifier),
    Damage is (U * Modifier),
    enemyHP(Y, P), P1 is P-Damage,
    retract(enemyHP(Y, P)), asserta(enemyHP(Y, P1)),
    write('You dealt '), write(Damage),
    write(' damage to '), write(Y), nl,
    retract(spused(player, 0)),
    asserta(spused(player, 1)).

battlecommand(specialattack) :-
    fighting(_, _), spused(player, 1), !,
    write('Special Attack sudah digunakan!'), nl, nl, inputBattleCommand.

enemymove(N) :-
    fighting(X, Y), N =< 6,
    nattack(Y, U),
    iseffective(X, Y, Modifier),
    Damage is (U * Modifier),
    hp(X, P), P1 is P-Damage,
    retract(hp(X, P)), asserta(hp(X, P1)),
    nl, writeEnemyAttack(Damage), nl.
enemymove(N) :-
    fighting(X, Y), spused(enemy, 0), N > 6, !,
    write('Enemy '), write(Y),
    spattack(Y, U, Z),
    iseffective(X, Y, Modifier),
    write(' uses '), write(Z), write('!'),
    Damage is (U * Modifier),
    hp(X, P), P1 is P-Damage,
    retract(hp(X, P)), asserta(hp(X, P1)),
    nl, writeEnemyAttack(Damage),
    retract(spused(enemy, 0)),
    asserta(spused(enemy, 1)), nl.
enemymove(N) :-
    fighting(X, Y), spused(enemy, 1), N > 6, !,
    nattack(Y, U),
    iseffective(X, Y, Modifier),
    Damage is (U * Modifier),
    hp(X, P), P1 is P-Damage,
    retract(hp(X, P)), asserta(hp(X, P1)),
    nl, writeEnemyAttack(Damage), nl.

writeEnemyAttack(Damage) :-
    fighting(X, Y),
    write(Y), write(' dealt '), write(Damage),
    write(' damage to '), write(X), nl.

battle :-
    repeat,
        battlestatus,
        inputBattleCommand,
        ( 	fighting(_, Y), enemyHP(Y, U), U =< 0 ->
        		endbattle;
        	random(1, 10, N),
       		enemymove(N),
        	endbattle	).


inputBattleCommand :-
    write('$ '), read(Input), nl,
    battlecommand(Input), nl.

endbattle :-
    fighting(_, Y),
    enemyHP(Y, P), P =< 0, !,
    write('Anda telah mengalahkan setan '), write(Y), nl, isLegend(Y),
    write('Apakah anda ingin menangkap '), write(Y), write('(Y/N)? '),
    read(Input), catch(Input, Y), restore, deleteEnemy, !.
endbattle :-
    fighting(X, _),
    hp(X, P), P =< 0, !, dead(X), zeroHP(X), !.

zeroHP(_) :- playerSetan(L), L = [], !,
    write('Anda kehabisan setan. '), restore, endgame(0), !.
zeroHP(X) :- write(X), write(' is dead.'), nl, nl, spused(enemy, Z), battleWithLegend(F), restore, asserta(spused(enemy, Z)), asserta(battleWithLegend(F)), initBattleKe2, !.

isLegend(X) :- battleWithLegend(1), !, legendsSetan(ListLegend), del(X, ListLegend, NewListLegend), retract(legendsSetan(ListLegend)), asserta(legendsSetan(NewListLegend)), endgame(1), !.
isLegend(_) :- battleWithLegend(0), !.

catch(X, Enemy) :- X = 'Y', !, resetEnemyHP(Enemy), captured(Enemy).
catch(X, Enemy) :- X = 'y', !, resetEnemyHP(Enemy), captured(Enemy).
catch(X, _) :- X = 'N', !, nl, write('Sayang sekali anda tidak mau menangkap setan tersebut. Baiklah tidak apa-apa, lanjutkan perjalanan anda!'), !.
catch(X, _) :- X = 'n', !, nl, write('Sayang sekali anda tidak mau menangkap setan tersebut. Baiklah tidak apa-apa, lanjutkan perjalanan anda!'), !.

deleteEnemy :- playerPos(D, E), B is D, C is E, enemy(A, B, C), retract(enemy(A, B, C)), retract(enemyHP(A, _)).

restore :-
    retract(spused(player, _)), retract(fighting(_, _)), retract(spused(enemy, _)), retract(battleWithLegend(_)).
