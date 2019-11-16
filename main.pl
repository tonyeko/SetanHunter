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
	initDifficulty, nl, nl,
	write('Selamat datang di dunia Setan Hunter. Silahkan memperkenalkan dirimu...'),nl,
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
