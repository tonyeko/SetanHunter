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
	initDifficulty, nl, nl, delay,
	write('Selamat datang di dunia Setan Hunter. Silahkan memperkenalkan dirimu...'),nl, delay,
	initPlayer, nl,
	initLegends,
	initEnemy(20),

	showinstruction,
	showmap,

	repeat,
		write('$ '),
		read(Input), nl,
		execute(Input), nl,
		loop.

loop :-
  gameMain(0), !.

reset :-
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
	retractall(hp(_,_)), consult('setan.pl').
