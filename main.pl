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
:-include('position.pl').
:-include('tokemon.pl').

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
	write('Selamat datang di dunia Tokemon. == ISI KALIMAT == . Silahkan memperkenalkan dirimu...'),nl,
	initPlayer,
	showinstruction,
	showmap,

	/* KONDISI KALAH, NANTI DIGANTI */
	asserta(health(1)),

	repeat,
		write('$ '), 
		read(Input), nl, 
		execute(Input), nl,
		end_game.

end_game :-
  health(0), !, /* KONDISI KALAH, NANTI DIGANTI */
  write('==== KALIMAT KALAH ===='),nl, end(y), !.
