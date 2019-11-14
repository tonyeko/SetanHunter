:- dynamic(hp/2). /* hp(X, Y) */

/* Nama Tokemon */
        tokemon(charmanbro).
        tokemon(magger).
        tokemon(moltron).
        tokemon(execute).
        tokemon(lotek).
        tokemon(nutleaf).
        tokemon(psyluck).
        tokemon(magicard).
        tokemon(fastpoke).
        tokemon(martini).
        tokemon(latian).
        tokemon(educa).
        tokemon(ruanguru).
        tokemon(dosatu).
        tokemon(pidgay).
        tokemon(setarbuck).
        tokemon(tikachu).
        tokemon(elekterus).
        tokemon(helicopter).

    /* type: fire */
        type(fire, magger).
        type(fire, charmanbro).
        type(fire, moltron).
    /* type: leaves */
        type(leaves, execute).    
        type(leaves, lotek).     
        type(leaves, nutleaf).
    /* type: water */    
        type(water, psyluck).
        type(water, magicard).
        type(water, fastpoke).
    /* type: dragon */
        type(dragon, martini).
        type(dragon, latian).
        type(dragon, educa).
        type(dragon, ruanguru).
    /* type: normal */
        type(normal, dosatu).
        type(normal, pidgay).
        type(normal, setarbuck).
    /* type: electric */ 
        type(electric, tikachu). 
        type(electric, elekterus).
        type(electric, helicopter).
    
/* Legendary Tokemon */
        legendary(moltron).
        legendary(latian).
        legendary(ruanguru).
        legendary(educa).

/* stats */

        starthp(charmanbro, 500).
        starthp(magger, 450).
        starthp(moltron, 1000).
        starthp(execute, 350).
        starthp(lotek, 300).
        starthp(nutleaf, 470).
        starthp(psyluck, 360).
        starthp(magicard, 250).
        starthp(fastpoke, 660).
        starthp(martini, 450).
        starthp(latian, 1500).
        starthp(educa, 2200).
        starthp(ruanguru, 3000).
        starthp(dosatu, 600).
        starthp(pidgay, 340).
        starthp(setarbuck, 460).
        starthp(tikachu, 500).
        starthp(elekterus, 470).
        starthp(helicopter, 750).


        attack(charmanbro, 40).
        attack(magger, 30).
        attack(moltron, 90).
        attack(execute, 25).
        attack(lotek, 25).
        attack(nutleaf, 27).
        attack(psyluck, 23).
        attack(magicard, 15).
        attack(fastpoke, 40).
        attack(martini, 50).
        attack(latian, 95).
        attack(educa, 103).
        attack(ruanguru, 105).
        attack(dosatu, 40).
        attack(pidgay, 34).
        attack(setarbuck, 46).
        attack(tikachu, 40).
        attack(elekterus, 47).
        attack(helicopter, 75).

        spattack(charmanbro, 65).
        spattack(magger, 50).
        spattack(moltron, 120).
        spattack(execute, 50).
        spattack(lotek, 40).
        spattack(nutleaf, 47).
        spattack(psyluck, 43).
        spattack(magicard, 35).
        spattack(fastpoke, 60).
        spattack(martini, 90).
        spattack(latian, 135).
        spattack(educa, 163).
        spattack(ruanguru, 175).
        spattack(dosatu, 60).
        spattack(pidgay, 54).
        spattack(setarbuck, 66).
        spattack(tikachu, 75).
        spattack(elekterus, 77).
        spattack(helicopter, 85).


/* Relasi Tipe Tokemon */
    /* Super Effective */
    /* Serangan tokemon fire efektif terhadap leaves */
    seffective(fire, leaves).
    /* Serangan tokemon leaves efektif terhadap water */
    seffective(leaves, water).
    /* Serangan tokemon water efektif terhadap fire */
    seffective(water, fire).
    /* Serangan tokemon electric efektif terhadap water */
    seffective(electric, water).
    /* Serangan tokemon dragon efektif terhadap dragon */
    seffective(dragon, dragon).
    /* Not Effective */
    /* Serangan tokemon leaves tidak efektif terhadap fire */
    neffective(leaves, fire).
    /* Serangan tokemon water tidak efektif terhadap leaves */
    neffective(water, leaves).
    /* Serangan tokemon fire tidak efektif terhadap water */
    neffective(fire, water).
    /* Serangan tokemon dragon tidak efektif terhadap fire */
    neffective(dragon, fire).
    /* Serangan tokemon dragon tidak efektif terhadap water, leaves, dan electric */
    neffective(dragon, water).
    neffective(dragon, leaves).
    neffective(dragon, electric).
    /* Serangan tokemon electric tidak efektif terhadap leaves */
    neffective(electric, leaves).