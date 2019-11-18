:- dynamic(playerPos/2). 		    /* playerPos(X, Y) */
:- dynamic(legendaryPos/3).         /* legendaryPos(legendary, X, Y) */
:- dynamic(legendsSetan/1).         /* LegendsSetan(X) -- List */
:- dynamic(playerSetan/1). 	        /* playerSetan(X, Y) */
:- dynamic(rektoratUsed/1).			/* rektoratUsed(0) or rektoratUsed(1) */
:- dynamic(enemy/3).                /* enemy(setan, posX, posY) */
:- dynamic(player/1).                /* player(P) */

initPlayer :-
	write('Siapa nama kamu?'), nl, delay,
	write('$ '), read(P),
	asserta(player(P)),
    /* Spawn Player */
	generateRandomPos(X,Y),
	asserta(playerPos(X,Y)),
    /* Fakta Awal */
	asserta(playerSetan([pocong])),          /* Setan awal */
    asserta(level(pocong, 10)),
    asserta(experience(pocong, 1000)),
    asserta(hp(pocong, 3520)),
    asserta(fullhp(pocong, 3520)),
	asserta(rektoratUsed(0)).                /* Setan belum pernah disembuhkan di rektorat */

initLegends :-
    generateRandomPos(X1, Y1),
    generateRandomPos(X2, Y2), generateRandomPos(X3, Y3),
    generateRandomPos(X4, Y4), generateRandomPos(X5, Y5), generateRandomPos(X6, Y6),
    generateRandomPos(X7, Y7),
	asserta(legendaryPos(lucifer, X1, Y1)),
    asserta(legendaryPos(mammon, X2, Y2)), asserta(legendaryPos(asmodeus, X3, Y3)),
    asserta(legendaryPos(belphegor, X4, Y4)), asserta(legendaryPos(beelzebub, X5, Y5)), asserta(legendaryPos(leviathan, X6, Y6)),
    asserta(legendaryPos(satan, X7, Y7)),
    /* Fakta Awal Legends yg belum dikalahkan */
    asserta(legendsSetan([lucifer, mammon, asmodeus, belphegor, beelzebub, leviathan, satan])).

initEnemy(0) :- !. /* Basis */
initEnemy(N) :-
    generateRandomPos(X, Y),
    findall(Z, setan(Z), ListSetan),
    length(ListSetan, PanjangList),
    random(0, PanjangList, RandomNoSetan),
    getElmt(ListSetan, RandomNoSetan, A),
    asserta(enemy(A, X, Y)),
    % write(X), nl, write(Y), nl, write(A), nl,
    N1 is N-1,
    initEnemy(N1), !.

showPlayerName :- player(X), write(X).