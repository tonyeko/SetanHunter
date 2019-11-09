:- dynamic(playerPos/2). 	/* playerPos(X, Y) */

initPlayer :-
	write('Siapa nama kamu?'), nl,
	write('$ '), read(P),
	asserta(player(P)),
    /* Spawn Player */
	random(1,10,X),
	random(1,10,Y),
	asserta(playerPos(X,Y)).
    
    % nl, write(X), write(' '), write(Y), nl,
    % printmap(0,0).

	% asserta(healthpoint(100)),
	% asserta(armor(0)),
	% asserta(senjata(sniper_rifle,40,3)),
	% asserta(maxInventory(10)),
	% asserta(maxHealth(100)),
	% asserta(maxArmor(100)).

showPlayerName :- player(X), write(X).