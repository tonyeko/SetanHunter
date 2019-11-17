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

:- dynamic(gameMain/1).

/*Rules*/
start :-
	reset,
	asserta(gameMain(1)), nl, 		/* Penanda game sedang berjalan */
	write('  ______              __                                   '),nl, delay,
	write(' /      \\            |  \\                                  '),nl, delay,
	write('|  $$$$$$\\  ______  _| $$_     ______   _______            '),nl, delay,
	write('| $$___\\$$ /      \\|   $$ \\   |      \\ |       \\           '),nl, delay,
    write(' \\$$    \\ |  $$$$$$\\\\$$$$$$    \\$$$$$$\\| $$$$$$$\\          '),nl, delay,
	write(' _\\$$$$$$\\| $$    $$ | $$ __  /      $$| $$  | $$          '),nl, delay,
	write('|  \\__| $$| $$$$$$$$ | $$|  \\|  $$$$$$$| $$  | $$          '),nl, delay,
    write(' \\$$    $$ \\$$     \\  \\$$  $$ \\$$    $$| $$  | $$          '),nl, delay,
	write('  \\$$$$$$   \\$$$$$$$   \\$$$$   \\$$$$$$$ \\$$   \\$$          '),nl, delay,
	write(' __    __                        __                         '),nl, delay,
	write('/  |  /  |                      /  |                        '),nl, delay,
	write('$$ |  $$ | __    __  _______   _$$ |_     ______    ______  '),nl, delay,
	write('$$ |__$$ |/  |  /  |/       \\ / $$   |   /      \\  /      \\ '),nl, delay,
	write('$$    $$ |$$ |  $$ |$$$$$$$  |$$$$$$/   /$$$$$$  |/$$$$$$  |'),nl, delay,
	write('$$$$$$$$ |$$ |  $$ |$$ |  $$ |  $$ | __ $$    $$ |$$ |  $$/ '),nl, delay,
	write('$$ |  $$ |$$ \\__$$ |$$ |  $$ |  $$ |/  |$$$$$$$$/ $$ |      '),nl, delay,
	write('$$ |  $$ |$$    $$/ $$ |  $$ |  $$  $$/ $$       |$$ |      '),nl, delay,
	write('$$/   $$/  $$$$$$/  $$/   $$/    $$$$/   $$$$$$$/ $$/       '),nl, delay,
	nl,nl,
	write('Apakah Anda ingin load status game yang sudah ada(Y/N)? '), nl,
    write('$ '), read(X), isLoad(X),
	showmap,

	repeat,
		write('$ '),
		read(Input), nl,
		execute(Input), nl,
		loop.

loop :-
  gameMain(0), !.

