/* Print Map */
    /* Print Player Position */
    printmap(X,11) :- playerPos(X,11), !,  write('P '), X1 is X+1, nl, printmap(X1,0), !.
    printmap(X,Y) :- playerPos(X,Y), !,  write('P '), X1 is X+1, printmap(X1,Y), !.
    /* Print Gym Position */
    printmap(X,Y) :- gymPos(X,Y), !, write('G '), X1 is X+1, printmap(X1,Y), !.
    /* Print Pagar */
    printmap(11,11) :- write('X '), nl, !. /* Baris terakhir kolom terakhir */
    printmap(11,Y) :- write('X '), nl, Y1 is Y+1, printmap(0,Y1), !. /* Baris terakhir Kolom Y */
    printmap(X,Y) :- hedge(X,Y), !,  write('X '), X1 is X+1, printmap(X1,Y), !.
    /* Print Medan */
    printmap(X,Y) :- write('- '), X1 is X+1, printmap(X1,Y), !.

/* W A S D */
    % w_move :- playerPos(_,Y), Y == 1, !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke utara.'), nl, !.
    w_move :- playerPos(X, Y), A is X, B is Y-1, hedge(A, B), !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke utara.'), nl, !.
    w_move :- playerPos(X,Y), Y1 is Y-1, retract(playerPos(X,Y)), asserta(playerPos(X,Y1)), !.
    
    
    % a_move :- playerPos(X,_), X == 1, !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke barat.'), nl, !.
    a_move :- playerPos(X, Y), A is X-1, B is Y, hedge(A, B), !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke barat.'), nl, !.
    a_move :- playerPos(X,Y), X1 is X-1, retract(playerPos(X,Y)), asserta(playerPos(X1,Y)), !.

    % s_move :- playerPos(_,Y), Y == 10, !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke selatan.'), nl, !.
    s_move :- playerPos(X, Y), A is X, B is Y+1, hedge(A, B), !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke selatan.'), nl, !.
    s_move :- playerPos(X,Y), Y1 is Y+1, retract(playerPos(X,Y)), asserta(playerPos(X,Y1)), !.

    % d_move :- playerPos(X,_), X == 10, !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke timur.'), nl, !.
    d_move :- playerPos(X, Y), A is X+1, B is Y, hedge(A, B), !, write('tetapi ada pagar yang menghalangi, jadi '), showPlayerName, write(' tidak bisa lagi bergerak ke timur.'), nl, !.
    d_move :- playerPos(X,Y), X1 is X+1, retract(playerPos(X,Y)), asserta(playerPos(X1,Y)), !.

/* Show Position Information */
    showpos :- playerPos(X, Y), pos(X, Y, Z), showPlayerName, write(' sekarang berada di '), write(Z), nl, !.
/* Bertemu Enemy */
    isEncountered :- playerPos(X, Y), enemy(_, B, C), X == B, Y == C, !, enc, nl, !.
    isEncountered :- !.
