:- dynamic(playerPos/2). 		/* playerPos(X, Y) */
:- dynamic(playerSetan/1). 	/* playerSetan(X, Y) */
:- dynamic(rektoratUsed/1).			/* rektoratUsed(0) or rektoratUsed(1) */
:- dynamic(enemy/3). /* enemy(setan, posX, posY) */

initPlayer :-
	write('Siapa nama kamu?'), nl,
	write('$ '), read(P),
	asserta(player(P)),
    /* Spawn Player */
	random(1,15,X),
	random(1,15,Y),
	asserta(playerPos(X,Y)).
	/* Setan awal */
	playerSetan([pocong, valak]).
	rektoratUsed(0). /* Setan belum pernah disembuhkan di rektorat */
	legendsSetan([lucifer, mammon, asmodeus, belphegor, beelzebub, leviathan, satan]).

initEnemy(0) :- !. /* Basis */
initEnemy(N) :-
    random(1, 15, X),
    random(1, 15, Y),
    findall(Z, setan(Z), ListSetan),
    length(ListSetan, PanjangList),
    random(0, PanjangList, RandomNoSetan),
    getElmt(ListSetan, RandomNoSetan, A),
    asserta(enemy(A, X, Y)), 
    % write(X), nl, write(Y), nl, write(A), nl,
    N1 is N-1,
    initEnemy(N1), !.

showPlayerName :- player(X), write(X).