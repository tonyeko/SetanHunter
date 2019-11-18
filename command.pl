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
    read(X), nl, isSave(X),
    abort, !.

isSave(X) :- X == 'Y', !,
	write('Masukkan nama file: '), nl,
    write('$ '), read(Z), save(X, Z), !.
isSave(X) :- X == 'y', !,
	write('Masukkan nama file: '), nl,
    write('$ '), read(Z), save(X, Z), !.
isSave(X) :- X == 'N', !.
isSave(X) :- X == 'n', !.

isLoad(X) :- X == 'N', !, nl,
	initDifficulty, nl, nl, delay,
	write('Selamat datang di dunia Setan Hunter. Silahkan memperkenalkan dirimu...'),nl, delay,
	initPlayer, nl,
	initLegends,
	initEnemy(35),
	showinstruction, !.
isLoad(X) :- X == 'n', !, nl,
	initDifficulty, nl, nl, delay,
	write('Selamat datang di dunia Setan Hunter. Silahkan memperkenalkan dirimu...'),nl, delay,
	initPlayer, nl,
	initLegends,
	initEnemy(35),
	showinstruction, !.
isLoad(X) :- X == 'Y', !,
	write('Masukkan nama file: '), nl,
    write('$ '), read(Z), loadGame(Z), nl, write('Status game berhasil di-load!'), nl, nl, !.
isLoad(X) :- X == 'y', !,
	write('Masukkan nama file: '), nl,
    write('$ '), read(Z), loadGame(Z), nl, write('Status game berhasil di-load!'), nl, nl, !.

showstatus :-
	write('Setan yang dimiliki:'), nl, nl,
	playerSetan(X), showssetanstat(X),
    write('Bos Setan yang BELUM dikalahkan: '), nl,
    legendsSetan(Y), showslegends(Y).

showssetanstat([]).
showssetanstat([X|T]) :-
	write('Nama             : '), write(X), nl,
	write('Level            : '), level(X, N), write(N), nl,
	write('HP               : '), hp(X, Y), write(Y), write('/'), fullhp(X,A), write(A),nl,
	write('EXP              : '), experience(X, XP), write(XP), nl,
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), nattack(X, U), U1 is (U + (2*N)), write(U1), nl,
	write('Special Attack   : '), spattack(X, V, W), write(W), V1 is (V + (3*N)), write(' ('), write(V1), write(')'), nl, nl,
	showssetanstat(T).

showEnemyStatus(X) :-
	write('Nama             : '), write(X), nl,
	write('Level            : '), enemylv(_, N), write(N), nl,
	write('HP               : '), enemyHP(X, Y), write(Y), write('/'), enemyHP(X, Y), write(Y),nl,
	write('Tipe             : '), type(Z, X), write(Z), nl,
	write('Attack           : '), enemyAtk(X, U), write(U), nl,
	write('Special Attack   : '), enemySA(X, V, W), write(W), write(' ('), write(V), write(')'), nl, nl, !.

/* Generate random X, Y position */
generateRandomPos(X, Y) :- random(1,15,X), random(1,15,Y).

/* Randomize Location Legendary Setan */
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

initCapture(X) :-
    enemylv(X, N),
    asserta(level(X, N)),
    starthp(X, H),
    H1 is (H + (5*N)),
    asserta(hp(X, H1)),
    asserta(fullhp(X, H1)),
    XP is (N*100),
    asserta(experience(X, XP)).

/* KASUS SUDAH 6 PARTY */
captured(X) :-
	playerSetan(Y), count(Y, N), N == 6, !,
	write('Party sudah penuh! '),
	write('Apakah kamu ingin drop Setan di inventory(Y/N)? '), read(Input), drop(Input, X).
/* KASUS MASIH ADA SLOT */
captured(X) :-
	playerSetan(Y), \+searchParty(X), !, initCapture(X),
	conc(Y, [X], Z),
	retract(playerSetan(Y)), assertz(playerSetan(Z)),
	nl, write('Selamat!!'), nl, write(X), write(' berhasil ditangkap!'), nl, nl,
	write('STATUS SAAT INI:'), nl, showstatus.
/* KASUS SETAN SUDAH ADA DI INVENTORY */
captured(X) :-
	searchParty(X), !, 
	nl, write('Setan '), write(X), write(' tidak berhasil ditangkap, karena sudah ada di inventory.'), nl, nl,
	write('STATUS SAAT INI:'), nl, showstatus.

drop(Y, X) :- Y = 'Y' , !,
	write('Silahkan drop Setan: '), nl, nl, playerSetan(Z), showsetan(Z), nl,
    write('Drop: '), read(Input), del(Input, Z, A), retract(playerSetan(Z)), retract(hp(Input, _)), retract(fullhp(Input, _)), retract(experience(Input,_)), retract(level(Input, _)),
    asserta(playerSetan(A)), captured(X).
drop(Y, X) :- Y = 'y' , !,
	write('Silahkan drop Setan: '), nl, nl, playerSetan(Z), showsetan(Z), nl,
    write('Drop: '), read(Input), del(Input, Z, A), retract(playerSetan(Z)), retract(hp(Input, _)), retract(fullhp(Input, _)), retract(experience(Input,_)), retract(level(Input, _)),
    asserta(playerSetan(A)), captured(X).
drop(Y, X) :- Y = 'N', nl, write('Yahh!!'), nl, write(X), write(' tidak berhasil ditangkap :('), !.
drop(Y, X) :- Y = 'n', nl, write('Yahh!!'), nl, write(X), write(' tidak berhasil ditangkap :('), !.

dead(X) :-
	playerSetan(Y), retractSetanFromList(X), del(X, Y, Z),
	retract(playerSetan(Y)), assertz(playerSetan(Z)).

resetHP([]) :- !.
resetHP([X|T])	:-
	fullhp(X, Y),
	retract(hp(X, _)),
	asserta(hp(X, Y)),
	resetHP(T), !.

retractSetanFromList(X) :-
	retract(hp(X, _)),
	retract(level(X, _)),
	retract(experience(X,_)),
	retract(fullhp(X, _)), !.

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
execute(load(NamaFile)) :- loadGame(NamaFile), nl, write('Status game berhasil di-load!'), nl, showstatus, !.
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

save(X, NamaFile) :- X == 'Y' , !, savegame(NamaFile), write('Status game berhasil disimpan!'), nl, !.
save(X, NamaFile) :- X == 'y' , !, savegame(NamaFile), write('Status game berhasil disimpan!'), nl, !.
save(X, _) :- X == 'N' , !.
save(X, _) :- X == 'n' , !.

savegame(NamaFile):-
	open(NamaFile,write,SaveFile),
	player(NamaPlayer),
	write(SaveFile, player(NamaPlayer)),write(SaveFile, '.'), nl(SaveFile),
	playerPos(X, Y),
	write(SaveFile,playerPos(X, Y)),write(SaveFile,'.'),nl(SaveFile),
	difficulty(Diff),
	write(SaveFile,difficulty(Diff)),write(SaveFile,'.'),nl(SaveFile),
	rektoratUsed(Num1),
	write(SaveFile,rektoratUsed(Num1)),write(SaveFile,'.'),nl(SaveFile),
	legendsSetan(Legend),
	write(SaveFile,legendsSetan(Legend)),write(SaveFile,'.'),nl(SaveFile),
	playerSetan(PS),
	write(SaveFile,playerSetan(PS)),write(SaveFile,'.'),nl(SaveFile),
	findall(LegendSetan, legendaryPos(LegendSetan, XPos, YPos), ListLegend),
	findall(XPos, legendaryPos(LegendSetan, XPos, YPos), ListXPosLegend),
	findall(YPos, legendaryPos(LegendSetan, XPos, YPos), ListYPosLegend),
	writeList(SaveFile, legendaryPos, ListLegend, ListXPosLegend, ListYPosLegend),
	findall(Setan, enemy(Setan, XPosSetan, YPosSetan), ListSetan),
	findall(XPosSetan, enemy(Setan, XPosSetan, YPosSetan), ListXPosSetan),
	findall(YPosSetan, enemy(Setan, XPosSetan, YPosSetan), ListYPosSetan),
	writeList(SaveFile, enemy, ListSetan, ListXPosSetan, ListYPosSetan),
	findall(Setan1, hp(Setan1,SetanHP), ListSetan1),	/* List hp */
	findall(SetanHP, hp(Setan1,SetanHP), ListHP),
	writeStatusPlayer(SaveFile, hp, ListSetan1, ListHP),
	findall(Setan2, fullhp(Setan2,SetanHP2), ListSetan2),	/* List fullhp */
	findall(SetanHP2, fullhp(Setan2,SetanHP2), ListHP2),
	writeStatusPlayer(SaveFile, fullhp, ListSetan2, ListHP2),
	findall(Setan3, level(Setan3,LevelSetan), ListSetan3),	/* List level */
	findall(LevelSetan, level(Setan3,LevelSetan), ListLevel),
	writeStatusPlayer(SaveFile, level, ListSetan3, ListLevel),
	findall(Setan4, experience(Setan4,ExpSetan), ListSetan4),	/* List experience */
	findall(ExpSetan, experience(Setan4,ExpSetan), ListExp),
	writeStatusPlayer(SaveFile, experience, ListSetan4, ListExp),
	close(SaveFile).

writeList(_, _, [], [], []) :- !.
writeList(NamaFile, NamaList, [H1|T1], [H2|T2], [H3|T3]) :-
	write(NamaFile, NamaList),
	write(NamaFile, '('),
	write(NamaFile, (H1,H2,H3)),
	write(NamaFile, ')'),
	write(NamaFile, '.'),
	nl(NamaFile),
	writeList(NamaFile, NamaList, T1, T2, T3), !.

writeStatusPlayer(_, _, [], []) :- !.
writeStatusPlayer(NamaFile, NamaList, [H1|T1], [H2|T2]) :-
	write(NamaFile, NamaList),
	write(NamaFile, '('),
	write(NamaFile, (H1,H2)),
	write(NamaFile, ')'),
	write(NamaFile, '.'),
	nl(NamaFile),
	writeStatusPlayer(NamaFile, NamaList, T1, T2), !.

resetHPLoad([], []) :- !.
resetHPLoad([H1|T1], [H2|T2]) :- hp(H1, X), X == H2 , !,
	resetHPLoad(T1, T2), !.
resetHPLoad([H1|T1], [H2|T2]) :- hp(H1, X), X \= H2 , !,
	retract(hp(H1, H2)), asserta(hp(H1, X)),
	resetHPLoad(T1, T2), !.
	
reset :-
	retractall(player(_)),
	retractall(playerPos(_, _)),
	retractall(legendaryPos(_, _, _)),
	retractall(enemy(_, _, _)),
	retractall(difficulty(_)),
	retractall(legendsSetan(_)),
	retractall(playerSetan(_)),
	retractall(rektoratUsed(_)),
	retractall(spused(_)),
	retractall(battleWithLegend(_)),
	retractall(fighting(_,_)),
	retractall(enemyHP(_,_)),
	retractall(enemylv(_,_)),
	retractall(enemyAtk(_,_)),
	retractall(enemySA(_,_,_)),
	retractall(allyAtk(_,_)),
	retractall(allySA(_,_,_)),
	retractall(fullhp(_,_)),
	retractall(level(_,_)),
	retractall(experience(_,_)),
	retractall(hp(_,_)).
	% findall(Setan1, fullhp(Setan1,SetanHP), ListSetan1), /* LIST SETAN YANG PUNYA FULL HP */
	% findall(SetanHP, fullhp(Setan1,SetanHP), ListHP),
	% resetHPLoad(ListSetan1, ListHP).

loadGame(NamaFile) :-
	reset,
	open(NamaFile, read, LoadFile),
	loadStatus(LoadFile),
	close(LoadFile), !.

loadStatus(LoadFile) :-
	repeat,
		read(LoadFile, F),
		asserta(F),
		at_end_of_stream(LoadFile).

% resetHPplayerSetan :- 
% 	findall(Setan1, hpSetanKita(Setan1,SetanHP), ListSetan1),
% 	findall(SetanHP, hpSetanKita(Setan1,SetanHP), ListHP),
% 	resetHPLoad(ListSetan1, ListHP), !.