/* Print Map */
    /* Print Player Position */
    printmap(X,11) :- playerPos(X,11), !,  write('P '), X1 is X+1, nl, printmap(X1,0), !.
    printmap(X,Y) :- playerPos(X,Y), !,  write('P '), X1 is X+1, printmap(X1,Y), !.
    /* Print Gym Position */
    printmap(X,Y) :- gymPos(X,Y), !, write('G '), X1 is X+1, printmap(X1,Y), !.
    /* Print Pagar */
    printmap(11,11) :- write('X '), nl, !. /* Baris terakhir kolom terakhir */
    % printmap(X,11) :- write('X '), X1 is X+1, printmap(X1,11), !. /* Kolom terakhir Baris X */
    printmap(11,Y) :- write('X '), nl, Y1 is Y+1, printmap(0,Y1), !. /* Baris terakhir Kolom Y */
    printmap(X,Y) :- hedge(X,Y), !,  write('X '), X1 is X+1, printmap(X1,Y), !.
    /* Print Medan */
    printmap(X,Y) :- write('- '), X1 is X+1, printmap(X1,Y), !.


/* Gym Position */
gymPos(5,7).
/* Batas Pagar */
    /* Baris ke-0 */
    hedge(0,0).
    hedge(0,1).
    hedge(0,2).
    hedge(0,3).
    hedge(0,4).
    hedge(0,5).
    hedge(0,6).
    hedge(0,7).
    hedge(0,8).
    hedge(0,9).
    hedge(0,10).
    hedge(0,11).
    /* Baris ke-11 */
    hedge(11,1).
    hedge(11,2).
    hedge(11,3).
    hedge(11,4).
    hedge(11,5).
    hedge(11,6).
    hedge(11,7).
    hedge(11,8).
    hedge(11,9).
    hedge(11,10).
    hedge(11,11).
    /* Kolom ke-0 */
    hedge(1,0).
    hedge(2,0).
    hedge(3,0).
    hedge(4,0).
    hedge(5,0).
    hedge(6,0).
    hedge(7,0).
    hedge(8,0).
    hedge(9,0).
    hedge(10,0).
    hedge(11,0).
    /* Kolom ke-11 */
    hedge(1,11).
    hedge(2,11).
    hedge(3,11).
    hedge(4,11).
    hedge(5,11).
    hedge(6,11).
    hedge(7,11).
    hedge(8,11).
    hedge(9,11).
    hedge(10,11).
    hedge(11,11).