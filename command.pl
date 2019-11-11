showinstruction :-
    write('Halo '),
	showPlayerName,
	write(', kamu adalah Tokemon Trainer .... KALIMAT PEMBUKA -----'), nl, nl,
    showcommands.

showcommands :-
    write('Daftar command yang dapat dilakukan: '), nl,
	write('  start.             : memulai permainan.'),nl,
	write('  quit.              : keluar dari permainan.'),nl,
    write('  help.              : menampilkan daftar command yang dapat dilakukan.'),nl,
    write('  map.               : menampilkan peta.'),nl,
	write('  heal.              : menyembuhkan tokemon di inventory jika berada di gym center.'),nl,
	write('  w.                 : bergerak kearah utara.'),nl,
	write('  a.                 : bergerak kearah barat.'),nl,
	write('  s.                 : bergerak kearah selatan.'),nl,
	write('  d.                 : bergerak kearah timur.'),nl,
	write('  status.            : melihat status diri.'),nl,
	write('  save(filename).    : menyimpan status permainan.'),nl,
	write('  load(filename).    : me-load status permainan.'),nl,nl, !.
	
showlegends :-
    write('Keterangan : '), nl,
	write('  P = '), showPlayerName, write(' (Player)'),nl,
    write('  X = pagar'),nl,
	write('  G = gym center'),nl,nl, !.

showmap :- 
    write('Posisi '), showPlayerName, write(' saat ini:'), nl,
    printmap(0,0), nl,
    showlegends, !.

quit :- 
    write('Anda akan keluar dari game. Ingin save status game? (y/n)'), nl,
    write('$ '), 
    read(X), save(X),
    abort, !.

showstatus :-
	write('Info Status:'), nl,
	playerTokemon(X), showstokemonstat(X), nl,
    write('Tokemon Legenda yang BELUM dikalahkan: '), nl, 
    legendsTokemon(Y), showslegends(Y).
	
showstokemonstat([]).
showstokemonstat([X|T]) :-
	tokemon(X),
	write('Nama             : '),  write(X), nl,
	write('HP               : '), starthp(X, Y), write(Y), nl, 
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), attack(X, U), write(U), nl,
	write('Special Attack   : '), spattack(X, V), write(V), nl,
	showstokemonstat(T).

showslegends([]).
showslegends([X|T]) :-
	tokemon(X),
	legendary(X), write(' - '), write(X), nl,
	showslegends(T).

execute(quit)   :- quit, !.
execute(help)   :- showcommands, !.
execute(map)    :- showmap, !.
execute(w)      :- showPlayerName, write(' bergerak ke utara, '), w_move, showpos, !.
execute(a)      :- showPlayerName, write(' bergerak ke barat, '), a_move, showpos, !.
execute(s)      :- showPlayerName, write(' bergerak ke selatan, '), s_move, showpos, !.
execute(d)      :- showPlayerName, write(' bergerak ke timur, '), d_move, showpos, !.
execute(status) :- showstatus, !.