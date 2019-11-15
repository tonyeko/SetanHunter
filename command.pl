showinstruction :-
    write('Halo, '), showPlayerName, write('! Kamu adalah mahasiswa ITB jurusan Teknik Informatika, yang mempunyai banyak sekali tugas besar dan tugas kecil.'), nl,
	write('Tentunya, kamu juga punya banyak sekali deadline tubes yang harus akan datang dalam waktu dekat. Namun, akhir-akhir ini setiap malam di ITB banyak sekali'), nl,
	write('setan yang berkeliaraan yang mengganggu mahasiswa (termasuk kamu), sehingga kamu tidak bisa nubes malem-malem di ITB...'), nl,
	write('Keresahan inilah yang membuat kamu membuat sebuah pengangkap setan (yang dibuat menggunakan bahasa Prolog) dan mencalonkan diri sebagai seorang SETAN HUNTER,'), nl,
	write('yang bertugas untuk menjinakkan setan-setan di ITB, serta mengakhiri penyebab dari penampakan-penampakan ini...'), nl, nl,
	write('Apakah kamu bisa menjinakkan serta mengalahkan semua setan di ITB? Semoga berhasil! Nasib tubes dan indeks dan teman-temanmu semua ada di tanganmu!'), nl, nl,
    showcommands.

showcommands :-
    write('Daftar command yang dapat dilakukan: '), nl,
	write('  start.             : memulai permainan.'),nl,
	write('  quit.              : keluar dari permainan.'),nl,
    write('  help.              : menampilkan daftar command yang dapat dilakukan.'),nl,
    write('  map.               : menampilkan peta.'),nl,
	write('  heal.              : menyembuhkan setan di inventory jika berada di gym center.'),nl,
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
	write('Setan yang dimiliki:'), nl, nl,
	playerTokemon(X), showstokemonstat(X),
    write('Bos Setan yang BELUM dikalahkan: '), nl, 
    legendsTokemon(Y), showslegends(Y).
	
showstokemonstat([]).
showstokemonstat([X|T]) :-
	setan(X),
	write('Nama             : '), write(X), nl,
	write('HP               : '), hp(X, Y), write(Y), nl, 
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), attack(X, U), write(U), nl,
	write('Special Attack   : '), spattack(X, V), write(V), nl, nl,
	showstokemonstat(T).

showEnemyStatus(X) :-
	setan(X),
	write('Nama             : '), write(X), nl,
	write('HP               : '), hp(X, Y), write(Y), nl, 
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), attack(X, U), write(U), nl,
	write('Special Attack   : '), spattack(X, V), write(V), nl, nl, !.

showslegends([]).
/* KASUS SUDAH DITANGKAP */
showslegends([X|T]) :-
	setan(X), searchParty(X),
	legendary(X), write(' - '), write(X), write(' <SUDAH DITANGKAP>'), nl,
	showslegends(T).
/* KASUS BELUM DITANGKAP */
showslegends([X|T]) :-
	setan(X),
	legendary(X), write(' - '), write(X), nl,
	showslegends(T).

count([],0).
count([H|Tail], N) :- number(H),count(Tail, N1), N is N1 + 1.
count([H|Tail], N) :- \+number(H),count(Tail, N).

conc([], List, List).
conc([H|T], List, [H|CList]) :- conc(T, List, CList).

del(Element,[Element|Tail],Tail).
del(Element,[Head|Tail],[Head|Tail1]) :-
	del(Element,Tail,Tail1).

searchParty(X) :- 
    playerTokemon(L),
    member(X, L).

/* KASUS SUDAH 6 PARTY. nb: kalo tetep mau masukin, kasih opsi del satu setan dari party */
captured(X) :-
	setan(X),
	playerTokemon(Y), count(Y, N), N = 6,
	write("Party sudah penuh!").
/* KASUS MASIH ADA SLOT */
captured(X) :-
	setan(X),
	playerTokemon(Y), conc(Y, [X], Z), 
	retract(playerTokemon(Y)), assertz(playerTokemon(Z)).

dead(X) :-
	setan(X),
	playerTokemon(Y), del(X, Y, Z), 
	retract(playerTokemon(Y)), assertz(playerTokemon(Z)).

resetHP([X|T])	:-
	setan(X), starthp(X, Y),
	retract(hp(X, _)), 
	asserta(hp(X, Y)),
	resetHP(T), !.

healing	:- playerPos(X, Y), gymPos(A, B), X == A, Y == B, gymUsed(0), !, write('Setan kamu berhasil disembuhkan.'), nl, nl, retract(gymUsed(0)), asserta(gymUsed(1)), playerTokemon(Z), resetHP(Z), !.
healing	:- gymUsed(0), !, write('tidak berada di area gym, setan kamu tidak bisa disembuhkan.'), nl, !.
healing :- gymUsed(1), !, write('command ini tidak dapat lagi digunakan karena kamu sudah pernah menyembuhkan setan kamu di gym.'), nl, !.

execute(start)	:- write('permainan sudah dimulai.'), nl, !.
execute(quit)   :- quit, !.
execute(help)   :- showcommands, !.
execute(map)    :- showmap, !.
execute(heal)	:- healing, !.
execute(w)      :- showPlayerName, write(' bergerak ke utara, '), w_move, showpos, isEncountered, !.
execute(a)      :- showPlayerName, write(' bergerak ke barat, '), a_move, showpos, isEncountered, !.
execute(s)      :- showPlayerName, write(' bergerak ke selatan, '), s_move, showpos, isEncountered, !.
execute(d)      :- showPlayerName, write(' bergerak ke timur, '), d_move, showpos, isEncountered, !.
execute(status) :- showstatus, !.