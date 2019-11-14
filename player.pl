:- dynamic(playerPos/2). 		/* playerPos(X, Y) */
:- dynamic(playerTokemon/1). 	/* playerTokemon(X, Y) */
:- dynamic(gymUsed/1).			/* gymUsed(0) or gymUsed(1) */

initPlayer :-
	write('Siapa nama kamu?'), nl,
	write('$ '), read(P),
	asserta(player(P)),
    /* Spawn Player */
	random(1,10,X),
	random(1,10,Y),
	asserta(playerPos(X,Y)).
	/* Tokemon awal */
	playerTokemon([tikachu]).
	gymUsed(0). /* Tokemon belum pernah disembuhkan di gym */
	legendsTokemon([moltron, latian, ruanguru, educa]).

showPlayerName :- player(X), write(X).