:- dynamic(difficulty/1).

initDifficulty :-
	write('Pilih tingkat kesulitan game ini: '), nl, delay,
	write(' - easy : Anda hanya perlu mengalahkan 2 legendary setan.'), nl, delay,
	write(' - hard : Anda perlu mengalahkan semua legendary setan dan persentase bertemu legendary setan lebih kecil.'), nl, nl, 
	readDifficulty.

readDifficulty :-
	write('$ '), read(Input), nl, delay,
	chooseDifficulty(Input).

chooseDifficulty(easy) :- write('Anda memilih difficulty: easy'), asserta(difficulty(easy)).
chooseDifficulty(hard) :- write('Anda memilih difficulty: hard'), asserta(difficulty(hard)).
chooseDifficulty(_) :- write('Pilihan tidak ada, masukkan easy atau hard!'), nl, nl, readDifficulty.

delay :- sleep(0.3).
delay2 :- sleep(1).

showinstruction :-
    write('Halo, '), showPlayerName, write('! Kamu adalah mahasiswa ITB jurusan Teknik Informatika, yang mempunyai banyak sekali tugas besar dan tugas kecil.'), nl,
    delay2,
	write('Tentunya, kamu juga punya banyak sekali deadline tubes yang harus akan datang dalam waktu dekat.'), nl,
	delay2,
	write('Namun, akhir-akhir ini setiap malam di ITB banyak sekali setan yang berkeliaraan yang mengganggu mahasiswa (termasuk kamu), sehingga kamu tidak bisa nubes malem-malem di ITB...'), nl, nl,
	delay2,
	write('Keresahan inilah yang membuat kamu membuat sebuah pengangkap setan (yang dibuat menggunakan bahasa Prolog) dan mencalonkan diri sebagai seorang SETAN HUNTER,'), nl,
	delay2,
	write('Kebetulan, kamu (dengan hoki) menangkap satu POCONG, dan kamu bisa menggunakannya untuk mengalahkan setan-setan lain...'), nl,
	delay2,
	write('Kamu akan bertugas untuk menjinakkan setan-setan di ITB, serta mengakhiri penyebab dari penampakan-penampakan ini...'), nl, nl,
	delay2,
	write('Apakah kamu bisa menjinakkan serta mengalahkan semua setan di ITB? Semoga berhasil! Nasib tubes dan indeks dan teman-temanmu semua ada di tanganmu!'), nl, nl,
    sleep(3),
    showcommands.

showcommands :-
    write('Daftar command yang dapat dilakukan: '), nl,
	write('  start.             : memulai permainan.'),nl,
	write('  quit.              : keluar dari permainan.'),nl,
    write('  help.              : menampilkan daftar command yang dapat dilakukan.'),nl,
    write('  map.               : menampilkan peta.'),nl,
	write('  heal.              : menyembuhkan setan di inventory jika berada di rektorat.'),nl,
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
	write('  R = rektorat'),nl,nl, !.

showmap :-
    write('Posisi '), showPlayerName, write(' saat ini:'), nl,
    printmap(0,0), nl,
    showlegends, !.

quit :-
    write('Anda akan keluar dari game. Ingin save status game? (y/n)'), nl,
    write('$ '),
    /*read(X), save(X),*/
    abort, !.

showstatus :-
	write('Setan yang dimiliki:'), nl, nl,
	playerSetan(X), showssetanstat(X),
    write('Bos Setan yang BELUM dikalahkan: '), nl,
    legendsSetan(Y), showslegends(Y).

showssetanstat([]).
showssetanstat([X|T]) :-
	write('Nama             : '), write(X), nl,
	write('HP               : '), hp(X, Y), write(Y), write('/'), starthp(X,A), write(A),nl,
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), nattack(X, U), write(U), nl,
	write('Special Attack   : '), spattack(X, V, W), write(W), write('('), write(V), write(')'), nl, nl,
	showssetanstat(T).

showEnemyStatus(X) :-
	write('Nama             : '), write(X), nl,
	write('HP               : '), hp(X, Y), write(Y), write('/'), starthp(X,A), write(A),nl,
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), nattack(X, U), write(U), nl,
	write('Special Attack   : '), spattack(X, V, W), write(W), write('('), write(V), write(')'), nl, nl, !.

/* Generate random X, Y position */
generateRandomPos(X, Y) :- random(1,15,X), random(1,15,Y).

% /* Randomize Location Legendary Setan */
generateRandomPosLegend :-
	generateRandomPos(X1, Y1), generateRandomPos(X2, Y2), generateRandomPos(X3, Y3),
    generateRandomPos(X4, Y4), generateRandomPos(X5, Y5), generateRandomPos(X6, Y6),
    generateRandomPos(X7, Y7),
	retract(legendaryPos(lucifer, _, _)), retract(legendaryPos(mammon, _, _)), retract(legendaryPos(asmodeus, _, _)),
    retract(legendaryPos(belphegor, _, _)), retract(legendaryPos(beelzebub, _, _)), retract(legendaryPos(leviathan, _, _)),
    retract(legendaryPos(satan, _, _)),
	asserta(legendaryPos(lucifer, X1, Y1)), asserta(legendaryPos(mammon, X2, Y2)), asserta(legendaryPos(asmodeus, X3, Y3)),
    asserta(legendaryPos(belphegor, X4, Y4)), asserta(legendaryPos(beelzebub, X5, Y5)), asserta(legendaryPos(leviathan, X6, Y6)),
    asserta(legendaryPos(satan, X7, Y7)).

/* Ambil elemen ke-N dari List */
getElmt([], 0, '') :- !.
getElmt([H|_], 0, H) :- !.
getElmt([_|T], N, X) :- N1 is N-1, getElmt(T, N1, X), !.

showslegends([]).
/* KASUS SUDAH DITANGKAP */
showslegends([X|T]) :-
	searchParty(X),
	showslegends(T).
/* KASUS BELUM DITANGKAP */
showslegends([X|T]) :-
	write(' - '), write(X), nl,
	showslegends(T).

count([],0).
count([_|Tail], N) :- count(Tail, N1), N is N1 + 1.

conc([], List, List).
conc([H|T], List, [H|CList]) :- conc(T, List, CList).

del(Element, [Element|Tail], Tail).
del(Element, [Head|Tail], [Head|Tail1]) :-
	del(Element,Tail,Tail1).

searchParty(X) :-
    playerSetan(L),
    member(X, L).

/* KASUS SUDAH 6 PARTY */
captured(X) :-
	playerSetan(Y), count(Y, N), N == 6, !,
	write('Party sudah penuh! '),
	write('Apakah kamu ingin drop Setan di inventory(Y/N)? '), read(Input), drop(Input, X).
/* KASUS MASIH ADA SLOT */
captured(X) :-
	playerSetan(Y), conc(Y, [X], Z),
	retract(playerSetan(Y)), assertz(playerSetan(Z)),
	nl, write('Selamat!!'), nl, write(X), write(' berhasil ditangkap!'), nl, nl,
	write('STATUS SAAT INI:'), nl, showstatus.

drop(Y, X) :- Y = 'Y' , !,
	write('Silahkan drop Setan: '), nl, nl, playerSetan(Z), showsetan(Z), nl,
    write('Drop: '), read(Input), del(Input, Z, A), retract(playerSetan(Z)),
    asserta(playerSetan(A)), captured(X).
drop(Y, X) :- Y = 'y' , !,
	write('Silahkan drop Setan: '), nl, nl, playerSetan(Z), showsetan(Z), nl,
    write('Drop: '), read(Input), del(Input, Z, A), retract(playerSetan(Z)),
    asserta(playerSetan(A)), captured(X).
drop(Y, X) :- Y = 'N', nl, write('Yahh!!'), nl, write(X), write(' tidak berhasil ditangkap :('), !.
drop(Y, X) :- Y = 'n', nl, write('Yahh!!'), nl, write(X), write(' tidak berhasil ditangkap :('), !.

dead(X) :-
	playerSetan(Y), resetEnemyHP(X), del(X, Y, Z),
	retract(playerSetan(Y)), assertz(playerSetan(Z)).

resetHP([]) :- !.
resetHP([X|T])	:-
	starthp(X, Y),
	retract(hp(X, _)),
	asserta(hp(X, Y)),
	resetHP(T), !.

resetEnemyHP(X) :-
	starthp(X, Y),
	retract(hp(X, _)),
	asserta(hp(X, Y)), !.

healing	:- playerPos(X, Y), rektoratPos(A, B), X == A, Y == B, rektoratUsed(0), !, playerSetan(Z), resetHP(Z), 
			write('.'), delay2, write('.'), delay2, write('.'), delay2, nl, write('Setan kamu berhasil disembuhkan.'), retract(rektoratUsed(0)), asserta(rektoratUsed(1)), nl, nl, !.
healing	:- rektoratUsed(0), !, write('tidak berada di area rektorat, setan kamu tidak bisa disembuhkan.'), nl, !.
healing :- rektoratUsed(1), !, write('command ini tidak dapat lagi digunakan karena kamu sudah pernah menyembuhkan setan kamu di rektorat.'), nl, !.

execute(start)			:- write('permainan sudah dimulai.'), nl, !.
execute(quit)   		:- quit, !.
execute(help)   		:- showcommands, !.
execute(map)    		:- showmap, !.
execute(heal)			:- healing, !.
execute(w)      		:- showPlayerName, write(' bergerak ke utara, '), w_move, showpos, isEncountered, !.
execute(a)      		:- showPlayerName, write(' bergerak ke barat, '), a_move, showpos, isEncountered, !.
execute(s)      		:- showPlayerName, write(' bergerak ke selatan, '), s_move, showpos, isEncountered, !.
execute(d)      		:- showPlayerName, write(' bergerak ke timur, '), d_move, showpos, isEncountered, !.
execute(status) 		:- showstatus, !.
execute(save(NamaFile)) :- save(y, NamaFile), !.
execute(_)				:- write('Masukan tidak sesuai, silahkan liat daftar command.'), nl, !.

endgame(0) :- nl, delay, loseAnimation, nl, write('Sayang sekali Anda kalah karena kehabisan setan. ITB akhirnya dikuasai oleh makhluk halus, dan menjadi angker...'), nl, abort, !.
endgame(1) :- difficulty(hard), legendsSetan(L), L = [], !, nl, delay, winAnimation, write('Selamat!! Anda telah menyelesaikan permainan ini dalam difficulty hard.'), nl, halt, !.
endgame(1) :- difficulty(easy), legendsSetan(L), count(L, N), N == 5, !, nl, delay, winAnimation, write('Selamat!! Anda telah menyelesaikan permainan ini dalam difficulty easy.'), nl, halt, !.
endgame(_) :- !.

winAnimation :-
	write('_____.___.               __      __.__        '),nl, delay,
	write('\\__  |   | ____  __ __  /  \\    /  \\__| ____  '),nl, delay,
	write(' /   |   |/  _ \\|  |  \\ \\   \\/\\/   /  |/    \\ '),nl, delay,
	write(' \\____   (  <_> )  |  /  \\        /|  |   |  \\'),nl, delay,
	write(' / ______|\\____/|____/    \\__/\\  / |__|___|  /'),nl, delay,
	write(' \\/                            \\/          \\/ '),nl.

loseAnimation :-
	write('_____.___.              .____                        '),nl, delay,
	write('\\__  |   | ____  __ __  |    |    ____  ______ ____  '),nl, delay,
	write(' /   |   |/  _ \\|  |  \\ |    |   /  _ \\/  ___// __ \\ '),nl, delay,
	write(' \\____   (  <_> )  |  / |    |__(  <_> )___ \\\\  ___/ '),nl, delay,
	write(' / ______|\\____/|____/  |_______ \\____/____  >\\___  >'),nl, delay,
	write(' \\/                             \\/         \\/     \\/ '),nl.

save(X) :- X == 'Y' , !, savegame.
save(X) :- X == 'y' , !, savegame.
save(X) :- X == 'N' , !. 
save(X) :- X == 'n' , !. 



