showinstruction :-
    write('Halo '),
	showPlayerName,
	write(', kamu adalah Tokemon Trainer .... KALIMAT PEMBUKA -----'), nl, nl,
    showcommands,
    showlegends.

showcommands :-
    write('Daftar command yang dapat dilakukan: '), nl,
	write('  start.             : memulai permainan.'),nl,
	write('  quit.              : keluar dari permainan.'),nl,
    write('  help.              : menampilkan daftar command yang dapat dilakukan.'),nl,
    write('  map.               : menampilkan peta.'),nl,
	write('  heal.              : menyembuhkan tokemon di inventory jika berada di gym center.'),nl,
	write('  w.                 : bergerak kearah Utara(atas).'),nl,
	write('  a.                 : bergerak kearah Timur(kanan).'),nl,
	write('  s.                 : bergerak kearah Barat(kiri).'),nl,
	write('  d.                 : bergerak kearah Selatan(bawah).'),nl,
	write('  status.            : melihat status diri.'),nl,
	write('  save(filename).    : menyimpan status permainan.'),nl,
	write('  load(filename).    : me-load status permainan.'),nl,nl, !.
	
showlegends :-
    write('Keterangan : '), nl,
	write('  P = '), showPlayerName, write(' (Player)'),nl,
    write('  X = pagar'),nl,
	write('  G = gym center'),nl,nl, !.