/* Kondisi */
Enc :- playerPos(X,Y) = enemyTokPos(W,Z).
/* Spawn wild tokemon*/
enemyTok(X) :- Enc,!, random(tokemon(X)),asserta(enemyTok(X)).
/* Lokasi Enemy */
enemyTokPos(X,Y) :- random(1,10,X), random(1,10,Y), asserta(enemyTokPos(X,Y)).
legTokPos(X,Y,Z) :- random(1,10,X), random(1,10,Y), ,random(1,10,Z),asserta(legTokPos(X,Y,Z)).