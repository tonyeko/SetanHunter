:- dynamic(playerPos/2). 		/* playerPos(X, Y) */
:- dynamic(playerTokemon/1). 	/* playerTokemon(X, Y) */
:- dynamic(rektoratUsed/1).			/* rektoratUsed(0) or rektoratUsed(1) */

initPlayer :-
	write('Siapa nama kamu?'), nl,
	write('$ '), read(P),
	asserta(player(P)),
    /* Spawn Player */
	random(1,15,X),
	random(1,15,Y),
	asserta(playerPos(X,Y)).
	/* Tokemon awal */
	playerTokemon([tikachu]).
	rektoratUsed(0). /* Tokemon belum pernah disembuhkan di rektorat */
	legendsTokemon([lucifer, mammon, asmodeus, belphegor, beelzebub, leviathan, satan]).

showPlayerName :- player(X), write(X).