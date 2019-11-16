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
:-include('setan.pl').
:-include('battle.pl').

/*Rules*/
start :-
	asserta(gameMain(1)), nl, 		/* Penanda game sedang berjalan */
	write('  ______              __                                   '),nl,
	write(' /      \\            |  \\                                  '),nl,
	write('|  $$$$$$\\  ______  _| $$_     ______   _______            '),nl,
	write('| $$___\\$$ /      \\|   $$ \\   |      \\ |       \\           '),nl,
    write(' \\$$    \\ |  $$$$$$\\\\$$$$$$    \\$$$$$$\\| $$$$$$$\\          '),nl,
	write(' _\\$$$$$$\\| $$    $$ | $$ __  /      $$| $$  | $$          '),nl,
	write('|  \\__| $$| $$$$$$$$ | $$|  \\|  $$$$$$$| $$  | $$          '),nl,
    write(' \\$$    $$ \\$$     \\  \\$$  $$ \\$$    $$| $$  | $$          '),nl,
	write('  \\$$$$$$   \\$$$$$$$   \\$$$$   \\$$$$$$$ \\$$   \\$$          '),nl,
	write(' __    __                        __                         '),nl,
	write('/  |  /  |                      /  |                        '),nl,
	write('$$ |  $$ | __    __  _______   _$$ |_     ______    ______  '),nl,
	write('$$ |__$$ |/  |  /  |/       \\ / $$   |   /      \\  /      \\ '),nl,
	write('$$    $$ |$$ |  $$ |$$$$$$$  |$$$$$$/   /$$$$$$  |/$$$$$$  |'),nl,
	write('$$$$$$$$ |$$ |  $$ |$$ |  $$ |  $$ | __ $$    $$ |$$ |  $$/ '),nl,
	write('$$ |  $$ |$$ \\__$$ |$$ |  $$ |  $$ |/  |$$$$$$$$/ $$ |      '),nl,
	write('$$ |  $$ |$$    $$/ $$ |  $$ |  $$  $$/ $$       |$$ |      '),nl,
	write('$$/   $$/  $$$$$$/  $$/   $$/    $$$$/   $$$$$$$/ $$/       '),nl,
	nl,nl,
	write('Selamat datang di dunia Setan Hunter. Silahkan memperkenalkan dirimu...'),nl,
	initPlayer, nl,
	initEnemy(20),
	initLegends,
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
