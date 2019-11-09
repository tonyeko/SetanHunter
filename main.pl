/* Kelompok 13 K-03
	Anggota  :
		Tony Eko Yuwono         / 13518030
		Dimas Wahyu Langkawi    / 13518069
		Vincent Hasiholan       / 13518108
		M. Fauzan Rafi		    / 13518147
*/

:-include('command.pl').
:-include('player.pl').
:-include('map.pl').

/*Rules*/
start :-
	asserta(gameMain(1)), nl, 		/* Penanda game sedang berjalan */
	write(' /$$$$$$$$        /$$                                                  '),nl,
	write('|__  $$__/       | $$                                                  '),nl,
	write('   | $$  /$$$$$$ | $$   /$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$ '),nl,
	write('   | $$ /$$__  $$| $$  /$$/ /$$__  $$| $$_  $$_  $$ /$$__  $$| $$__  $$'),nl,
    write('   | $$| $$  \\ $$| $$$$$$/ | $$$$$$$$| $$ \\ $$ \\ $$| $$  \\ $$| $$  \\ $$'),nl,
	write('   | $$| $$  | $$| $$_  $$ | $$_____/| $$ | $$ | $$| $$  | $$| $$  | $$'),nl,
	write('   | $$|  $$$$$$/| $$ \\  $$|  $$$$$$$| $$ | $$ | $$|  $$$$$$/| $$  | $$'),nl,
    write('   |__/ \\______/ |__/  \\__/ \\_______/|__/ |__/ |__/ \\______/ |__/  |__/'),nl,
	nl,nl,
	write('Gotta catch ''em all!'),nl,
	write('Selamat datang di dunia Tokemon. .... . Silahkan memperkenalkan dirimu...'),nl,
	% write('Siapa nama kamu?'), nl,
	% write('$ '),
	% read(X),
	% asserta(player(X)),
	initPlayer,

	/* Show Instruction */
	showinstruction,

	% supply,
	% spawn_player,
	
	% spawn_level(L),nl, %Nanti ini diganti sama spawn_level(N) dimana N adalah integer 1 (gampang), 2(sedeng), 3(susah).

	repeat,
		write('>> '), /* Menandakan input */
		read(Input),nl, /*Meminta input dari user */
		do(Input),nl, /*Menjadlankan do(Input) */
		end_condition. /*apabila end end condition terpenuhi maka program akan berakhir */