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

% showstatus :- 


execute(quit)   :- quit, !.
execute(help)   :- showcommands, !.
execute(map)    :- showmap, !.
execute(w)      :- showPlayerName, write(' bergerak ke utara, '), w_move, showpos, !.
execute(a)      :- a_move, showpos, !.
execute(s)      :- s_move, showpos, !.
execute(d)      :- d_move, showpos, !.
execute(status) :- showstatus, !.